// Package csvimport turns the authored CSVs under "Sheets Dump" into a validated
// in-memory dataset and renders it as idempotent PostgreSQL seed files.
package csvimport

import (
	"encoding/csv"
	"errors"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
)

const (
	GameMCQ         = "mcq"
	GameSuddenDeath = "sudden_death"
	GameSortItOut   = "sort_it_out"
	GameMatch       = "match_the_following"
)

var gameFolders = map[string]string{
	"mcq":               GameMCQ,
	"suddendeath":       GameSuddenDeath,
	"sortitout":         GameSortItOut,
	"matchthefollowing": GameMatch,
}

// Columns each game's CSV must carry (normalized header names). Extra columns are ignored.
var requiredColumns = map[string][]string{
	GameMCQ:         {"sno", "question", "optiona", "optionb", "optionc", "optiond", "correctoption", "difficulty", "hint", "explanation"},
	GameSuddenDeath: {"sno", "question", "optiona", "optionb", "correctoption", "difficulty", "hint", "explanation"},
	GameSortItOut:   {"sno", "setid", "itemtype", "bucketa", "bucketb", "item", "correctbucket", "difficulty", "explanation"},
	GameMatch:       {"sno", "left", "right", "difficulty"},
}

type Subject struct {
	Grade     int
	Folder    string
	Code      string
	Short     string
	Name      string
	SortOrder int
}

type Chapter struct {
	Subject string
	No      int
	Title   string
}

// Question is an MCQ (4 options) or Sudden Death (2 options) question.
type Question struct {
	Code        string
	Subject     string
	Chapter     int
	Prompt      string
	Options     []string
	Correct     string
	Difficulty  int
	Hint        string
	Explanation string
}

type SortSet struct {
	Code     string
	Subject  string
	Chapter  int
	ItemType string
	BucketA  string
	BucketB  string
	Items    []SortItem
}

type SortItem struct {
	Code        string
	Prompt      string
	Correct     string
	Difficulty  int
	Explanation string
}

// Pair is one Match the Following left/right pair. The backend deals a chapter's pairs
// into boards at game time, so the CSV's Board ID/Prompt/Hint/Explanation are ignored.
type Pair struct {
	Code       string
	Subject    string
	Chapter    int
	Left       string
	Right      string
	Difficulty int
}

type Dataset struct {
	Subjects    []Subject
	Chapters    []Chapter
	MCQ         []Question
	SuddenDeath []Question
	SortSets    []SortSet
	Pairs       []Pair
	// Warnings lists rows skipped because their content is invalid (file:line: reason).
	Warnings []string
}

func (d *Dataset) SortItemCount() int {
	n := 0
	for _, s := range d.SortSets {
		n += len(s.Items)
	}
	return n
}

// Load reads <root>/catalog/{subjects,chapters}.csv and every content CSV laid out as
// <root>/<grade dir>/<game dir>/<subject folder>/<chapter file>.csv.
// Structural problems return an error; invalid content rows are skipped with a warning.
func Load(root string) (*Dataset, error) {
	ds := &Dataset{}
	var err error
	if ds.Subjects, err = loadSubjects(filepath.Join(root, "catalog", "subjects.csv")); err != nil {
		return nil, err
	}
	if ds.Chapters, err = loadChapters(filepath.Join(root, "catalog", "chapters.csv"), ds.Subjects); err != nil {
		return nil, err
	}

	subjectByFolder := map[string]Subject{}
	for _, s := range ds.Subjects {
		subjectByFolder[folderKey(s.Grade, s.Folder)] = s
	}
	chapterExists := map[string]bool{}
	for _, c := range ds.Chapters {
		chapterExists[chapterKey(c.Subject, c.No)] = true
	}

	gradeDirs, err := subdirs(root)
	if err != nil {
		return nil, err
	}
	seenFile := map[string]string{}
	for _, gradeDir := range gradeDirs {
		if gradeDir == "catalog" {
			continue
		}
		grade := leadingInt(gradeDir)
		if grade == 0 {
			return nil, fmt.Errorf("%s: grade folder must start with the grade number (e.g. \"11th csv\")", filepath.Join(root, gradeDir))
		}
		gameDirs, err := subdirs(filepath.Join(root, gradeDir))
		if err != nil {
			return nil, err
		}
		for _, gameDir := range gameDirs {
			game, ok := gameFolders[normalize(gameDir)]
			if !ok {
				return nil, fmt.Errorf("%s: unknown game folder (expected MCQ, Sudden Death, Sort it out, Match the Following)", filepath.Join(root, gradeDir, gameDir))
			}
			subjectDirs, err := subdirs(filepath.Join(root, gradeDir, gameDir))
			if err != nil {
				return nil, err
			}
			for _, subjectDir := range subjectDirs {
				dir := filepath.Join(root, gradeDir, gameDir, subjectDir)
				subj, ok := subjectByFolder[folderKey(grade, subjectDir)]
				if !ok {
					return nil, fmt.Errorf("%s: no subject in catalog/subjects.csv with grade %d and folder %q", dir, grade, subjectDir)
				}
				files, err := csvFiles(dir)
				if err != nil {
					return nil, err
				}
				for _, name := range files {
					path := filepath.Join(dir, name)
					ch := chapterFromFilename(name)
					if ch == 0 {
						return nil, fmt.Errorf("%s: cannot read chapter number from file name (use CH<n>.csv or <n>_<Name>.csv)", path)
					}
					if !chapterExists[chapterKey(subj.Code, ch)] {
						return nil, fmt.Errorf("%s: chapter %d of %s is not in catalog/chapters.csv", path, ch, subj.Code)
					}
					key := fmt.Sprintf("%s/%s/%d", game, subj.Code, ch)
					if prev, dup := seenFile[key]; dup {
						return nil, fmt.Errorf("%s: duplicates chapter %d already loaded from %s", path, ch, prev)
					}
					seenFile[key] = path
					if err := ds.loadFile(path, game, subj, ch); err != nil {
						return nil, err
					}
				}
			}
		}
	}

	ds.sortAll()
	if err := ds.checkUniqueCodes(); err != nil {
		return nil, err
	}
	return ds, nil
}

func (d *Dataset) loadFile(path, game string, subj Subject, ch int) error {
	t, err := readTable(path, requiredColumns[game])
	if err != nil {
		return err
	}
	warn := func(line int, format string, args ...any) {
		d.Warnings = append(d.Warnings, fmt.Sprintf("%s:%d: %s", path, line, fmt.Sprintf(format, args...)))
	}
	switch game {
	case GameMCQ, GameSuddenDeath:
		nOpts, tag := 4, "mcq"
		if game == GameSuddenDeath {
			nOpts, tag = 2, "sd"
		}
		seen := map[int]bool{}
		for _, r := range t.rows {
			q, problem := parseQuestion(t, r, nOpts)
			if problem == "" && seen[q.sno] {
				problem = fmt.Sprintf("duplicate S.No %d", q.sno)
			}
			if problem != "" {
				warn(r.line, "%s", problem)
				continue
			}
			seen[q.sno] = true
			q.Code = fmt.Sprintf("%s-%02d-%s-%04d", subj.Short, ch, tag, q.sno)
			q.Subject, q.Chapter = subj.Code, ch
			if game == GameMCQ {
				d.MCQ = append(d.MCQ, q.Question)
			} else {
				d.SuddenDeath = append(d.SuddenDeath, q.Question)
			}
		}
	case GameSortItOut:
		d.loadSortItOut(t, subj, ch, warn)
	case GameMatch:
		d.loadMatch(t, subj, ch, warn)
	}
	return nil
}

type parsedQuestion struct {
	Question
	sno int
}

func parseQuestion(t *table, r row, nOpts int) (parsedQuestion, string) {
	var q parsedQuestion
	var problem string
	if q.sno, problem = parseSNo(t.get(r, "sno")); problem != "" {
		return q, problem
	}
	q.Prompt = t.get(r, "question")
	if q.Prompt == "" {
		return q, "blank Question"
	}
	cols := []string{"optiona", "optionb", "optionc", "optiond"}[:nOpts]
	for _, c := range cols {
		q.Options = append(q.Options, t.get(r, c))
	}
	if problem = checkOptions(q.Options); problem != "" {
		return q, problem
	}
	if q.Correct, problem = parseLetter(t.get(r, "correctoption"), nOpts, "Correct Option"); problem != "" {
		return q, problem
	}
	if q.Difficulty, problem = parseDifficulty(t, r); problem != "" {
		return q, problem
	}
	q.Hint, q.Explanation = t.get(r, "hint"), t.get(r, "explanation")
	return q, ""
}

var trailingNumber = regexp.MustCompile(`(\d+)\s*$`)

func (d *Dataset) loadSortItOut(t *table, subj Subject, ch int, warn func(int, string, ...any)) {
	sets := map[int]*SortSet{}
	var order []int
	seen := map[int]bool{}
	for _, r := range t.rows {
		sno, problem := parseSNo(t.get(r, "sno"))
		if problem == "" && seen[sno] {
			problem = fmt.Sprintf("duplicate S.No %d", sno)
		}
		setNo := 0
		if m := trailingNumber.FindStringSubmatch(t.get(r, "setid")); m != nil {
			setNo, _ = strconv.Atoi(m[1])
		}
		if problem == "" && (setNo < 1 || setNo > 999) {
			problem = fmt.Sprintf("Set ID %q must end with a number 1-999", t.get(r, "setid"))
		}
		itemType, a, b := t.get(r, "itemtype"), t.get(r, "bucketa"), t.get(r, "bucketb")
		if problem == "" && itemType == "" {
			problem = "blank Item Type"
		}
		if problem == "" {
			problem = checkOptions([]string{a, b})
		}
		item := SortItem{Prompt: t.get(r, "item"), Explanation: t.get(r, "explanation")}
		if problem == "" && item.Prompt == "" {
			problem = "blank Item"
		}
		if problem == "" {
			item.Correct, problem = parseLetter(t.get(r, "correctbucket"), 2, "Correct Bucket")
		}
		if problem == "" {
			item.Difficulty, problem = parseDifficulty(t, r)
		}
		set := sets[setNo]
		if problem == "" && set != nil && (set.ItemType != itemType || set.BucketA != a || set.BucketB != b) {
			problem = fmt.Sprintf("Item Type/Bucket A/Bucket B differ from earlier rows of set %d", setNo)
		}
		if problem != "" {
			warn(r.line, "%s", problem)
			continue
		}
		seen[sno] = true
		if set == nil {
			set = &SortSet{
				Code:     fmt.Sprintf("%s-%02d-set-%03d", subj.Short, ch, setNo),
				Subject:  subj.Code,
				Chapter:  ch,
				ItemType: itemType,
				BucketA:  a,
				BucketB:  b,
			}
			sets[setNo] = set
			order = append(order, setNo)
		}
		item.Code = fmt.Sprintf("%s-%02d-so-%04d", subj.Short, ch, sno)
		set.Items = append(set.Items, item)
	}
	for _, n := range order {
		d.SortSets = append(d.SortSets, *sets[n])
	}
}

func (d *Dataset) loadMatch(t *table, subj Subject, ch int, warn func(int, string, ...any)) {
	seenSNo := map[int]bool{}
	seenPair := map[string]bool{}
	for _, r := range t.rows {
		sno, problem := parseSNo(t.get(r, "sno"))
		if problem == "" && seenSNo[sno] {
			problem = fmt.Sprintf("duplicate S.No %d", sno)
		}
		p := Pair{Left: t.get(r, "left"), Right: t.get(r, "right")}
		if problem == "" {
			problem = checkOptions([]string{p.Left, p.Right})
		}
		key := strings.ToLower(p.Left + "\x00" + p.Right)
		if problem == "" && seenPair[key] {
			problem = "duplicate Left/Right pair"
		}
		if problem == "" {
			p.Difficulty, problem = parseDifficulty(t, r)
		}
		if problem != "" {
			warn(r.line, "%s", problem)
			continue
		}
		seenSNo[sno], seenPair[key] = true, true
		p.Code = fmt.Sprintf("%s-%02d-mf-%04d", subj.Short, ch, sno)
		p.Subject, p.Chapter = subj.Code, ch
		d.Pairs = append(d.Pairs, p)
	}
}

func parseSNo(s string) (int, string) {
	n, err := strconv.Atoi(s)
	if err != nil || n < 1 || n > 9999 {
		return 0, fmt.Sprintf("S.No %q must be a whole number 1-9999", s)
	}
	return n, ""
}

func parseLetter(s string, nOpts int, col string) (string, string) {
	l := strings.ToLower(strings.TrimSpace(s))
	if len(l) != 1 || l[0] < 'a' || int(l[0]-'a') >= nOpts {
		return "", fmt.Sprintf("%s %q must be one of %s", col, s, strings.ToUpper("abcd"[:nOpts]))
	}
	return l, ""
}

func parseDifficulty(t *table, r row) (int, string) {
	diff, err := strconv.Atoi(t.get(r, "difficulty"))
	if err != nil || diff < 1 || diff > 3 {
		return 0, fmt.Sprintf("Difficulty %q must be 1, 2 or 3", t.get(r, "difficulty"))
	}
	return diff, ""
}

// checkOptions requires every value to be non-blank and distinct (case-insensitive).
func checkOptions(opts []string) string {
	seen := map[string]bool{}
	for _, o := range opts {
		if o == "" {
			return "blank option"
		}
		k := strings.ToLower(o)
		if seen[k] {
			return fmt.Sprintf("duplicate option %q", o)
		}
		seen[k] = true
	}
	return ""
}

var (
	subjectCodeRe     = regexp.MustCompile(`^[a-z0-9_]+$`)
	shortCodeRe       = regexp.MustCompile(`^[a-z0-9]{1,8}$`)
	leadingNumberFile = regexp.MustCompile(`^(\d+)[_ .-]`)
	chapterTagFile    = regexp.MustCompile(`(?i)(?:^|[^a-z])ch[_ -]?(\d+)`)
)

func chapterFromFilename(name string) int {
	base := strings.TrimSuffix(name, filepath.Ext(name))
	for _, re := range []*regexp.Regexp{leadingNumberFile, chapterTagFile} {
		if m := re.FindStringSubmatch(base); m != nil {
			n, _ := strconv.Atoi(m[1])
			return n
		}
	}
	return 0
}

func (d *Dataset) sortAll() {
	rank := map[string]int{}
	for _, s := range d.Subjects {
		rank[s.Code] = s.SortOrder
	}
	sort.SliceStable(d.Subjects, func(i, j int) bool { return d.Subjects[i].SortOrder < d.Subjects[j].SortOrder })
	sort.SliceStable(d.Chapters, func(i, j int) bool {
		a, b := d.Chapters[i], d.Chapters[j]
		if rank[a.Subject] != rank[b.Subject] {
			return rank[a.Subject] < rank[b.Subject]
		}
		return a.No < b.No
	})
	byCode := func(codes func(i int) (string, string)) func(i, j int) bool {
		return func(i, j int) bool {
			si, ci := codes(i)
			sj, cj := codes(j)
			if rank[si] != rank[sj] {
				return rank[si] < rank[sj]
			}
			return ci < cj
		}
	}
	sort.Slice(d.MCQ, byCode(func(i int) (string, string) { return d.MCQ[i].Subject, d.MCQ[i].Code }))
	sort.Slice(d.SuddenDeath, byCode(func(i int) (string, string) { return d.SuddenDeath[i].Subject, d.SuddenDeath[i].Code }))
	sort.Slice(d.SortSets, byCode(func(i int) (string, string) { return d.SortSets[i].Subject, d.SortSets[i].Code }))
	sort.Slice(d.Pairs, byCode(func(i int) (string, string) { return d.Pairs[i].Subject, d.Pairs[i].Code }))
}

func (d *Dataset) checkUniqueCodes() error {
	seen := map[string]bool{}
	var dups []string
	add := func(code string) {
		if len(code) > 20 {
			dups = append(dups, code+" (longer than 20 chars)")
		}
		if seen[code] {
			dups = append(dups, code)
		}
		seen[code] = true
	}
	for _, q := range d.MCQ {
		add(q.Code)
	}
	for _, q := range d.SuddenDeath {
		add(q.Code)
	}
	for _, s := range d.SortSets {
		add(s.Code)
		for _, it := range s.Items {
			add(it.Code)
		}
	}
	for _, p := range d.Pairs {
		add(p.Code)
	}
	if len(dups) > 0 {
		return fmt.Errorf("invalid question codes: %s", strings.Join(dups, ", "))
	}
	return nil
}

func loadSubjects(path string) ([]Subject, error) {
	t, err := readTable(path, []string{"grade", "folder", "code", "shortcode", "name", "sortorder"})
	if err != nil {
		return nil, err
	}
	var out []Subject
	seen := map[string]bool{}
	for _, r := range t.rows {
		s := Subject{Folder: t.get(r, "folder"), Code: t.get(r, "code"), Short: t.get(r, "shortcode"), Name: t.get(r, "name")}
		s.Grade, _ = strconv.Atoi(t.get(r, "grade"))
		s.SortOrder, _ = strconv.Atoi(t.get(r, "sortorder"))
		if s.Grade < 1 || s.Grade > 12 || s.Folder == "" || s.Name == "" ||
			!subjectCodeRe.MatchString(s.Code) || !shortCodeRe.MatchString(s.Short) {
			return nil, fmt.Errorf("%s:%d: invalid subject row (grade 1-12, folder, code [a-z0-9_], short_code [a-z0-9]{1,8}, name)", path, r.line)
		}
		for _, k := range []string{"code:" + s.Code, "short:" + s.Short, "folder:" + folderKey(s.Grade, s.Folder)} {
			if seen[k] {
				return nil, fmt.Errorf("%s:%d: duplicate %s", path, r.line, k)
			}
			seen[k] = true
		}
		out = append(out, s)
	}
	return out, nil
}

func loadChapters(path string, subjects []Subject) ([]Chapter, error) {
	t, err := readTable(path, []string{"subject", "chapterno", "title"})
	if err != nil {
		return nil, err
	}
	known := map[string]bool{}
	for _, s := range subjects {
		known[s.Code] = true
	}
	var out []Chapter
	seen := map[string]bool{}
	for _, r := range t.rows {
		c := Chapter{Subject: t.get(r, "subject"), Title: t.get(r, "title")}
		c.No, _ = strconv.Atoi(t.get(r, "chapterno"))
		if !known[c.Subject] || c.No < 1 || c.No > 99 || c.Title == "" {
			return nil, fmt.Errorf("%s:%d: invalid chapter row (known subject, chapter_no 1-99, title)", path, r.line)
		}
		if seen[chapterKey(c.Subject, c.No)] {
			return nil, fmt.Errorf("%s:%d: duplicate chapter %s/%d", path, r.line, c.Subject, c.No)
		}
		seen[chapterKey(c.Subject, c.No)] = true
		out = append(out, c)
	}
	return out, nil
}

type table struct {
	cols map[string]int
	rows []row
}

type row struct {
	line   int
	fields []string
}

func (t *table) get(r row, col string) string {
	if i, ok := t.cols[col]; ok && i < len(r.fields) {
		return strings.TrimSpace(r.fields[i])
	}
	return ""
}

// readTable parses a CSV (BOM, CRLF and multi-line quoted cells allowed), checks the
// required headers and drops fully blank rows.
func readTable(path string, required []string) (*table, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()
	r := csv.NewReader(f)
	r.FieldsPerRecord = -1
	header, err := r.Read()
	if err != nil {
		return nil, fmt.Errorf("%s: reading header: %w", path, err)
	}
	t := &table{cols: map[string]int{}}
	for i, h := range header {
		t.cols[normalize(strings.TrimPrefix(h, "\ufeff"))] = i
	}
	var missing []string
	for _, c := range required {
		if _, ok := t.cols[c]; !ok {
			missing = append(missing, c)
		}
	}
	if len(missing) > 0 {
		return nil, fmt.Errorf("%s: missing columns %v (have %q)", path, missing, header)
	}
	for {
		rec, err := r.Read()
		if errors.Is(err, io.EOF) {
			break
		}
		if err != nil {
			return nil, fmt.Errorf("%s: %w", path, err)
		}
		line, _ := r.FieldPos(0)
		if strings.TrimSpace(strings.Join(rec, "")) == "" {
			continue
		}
		t.rows = append(t.rows, row{line: line, fields: rec})
	}
	return t, nil
}

func subdirs(dir string) ([]string, error) {
	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, err
	}
	var out []string
	for _, e := range entries {
		if e.IsDir() && !strings.HasPrefix(e.Name(), ".") {
			out = append(out, e.Name())
		}
	}
	return out, nil
}

func csvFiles(dir string) ([]string, error) {
	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, err
	}
	var out []string
	for _, e := range entries {
		if !e.IsDir() && strings.EqualFold(filepath.Ext(e.Name()), ".csv") {
			out = append(out, e.Name())
		}
	}
	return out, nil
}

func normalize(s string) string {
	var b strings.Builder
	for _, r := range strings.ToLower(s) {
		if (r >= 'a' && r <= 'z') || (r >= '0' && r <= '9') {
			b.WriteRune(r)
		}
	}
	return b.String()
}

func leadingInt(s string) int {
	i := 0
	for i < len(s) && s[i] >= '0' && s[i] <= '9' {
		i++
	}
	n, _ := strconv.Atoi(s[:i])
	return n
}

func folderKey(grade int, folder string) string {
	return fmt.Sprintf("%d/%s", grade, normalize(folder))
}
func chapterKey(subject string, no int) string { return fmt.Sprintf("%s/%d", subject, no) }
