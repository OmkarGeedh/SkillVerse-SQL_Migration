package csvimport

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func writeFile(t *testing.T, path, content string) {
	t.Helper()
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(path, []byte(content), 0o644); err != nil {
		t.Fatal(err)
	}
}

func fixture(t *testing.T) string {
	root := t.TempDir()
	writeFile(t, filepath.Join(root, "catalog", "subjects.csv"),
		"grade,folder,code,short_code,name,sort_order\n11,Maths 1,maths1,mth11a,Maths Part 1,1\n")
	writeFile(t, filepath.Join(root, "catalog", "chapters.csv"),
		"subject,chapter_no,title\nmaths1,1,Sets\nmaths1,4,Sequences\n")
	g := filepath.Join(root, "11th csv")
	writeFile(t, filepath.Join(g, "MCQ", "Maths1", "4_SequencesAndSeries.csv"),
		"\ufeffS.No,Subject,Chapter,Concept/Based On,Question,Option A,Option B,Option C,Option D,Correct Option,Difficulty,Points,Hint,Explanation\r\n"+
			"1,Mathematics,Ch 4,GP,\"It's the 5th term?\",486,162,243,54,B,1,3,Use ar^(n-1).,\"line one\nline two\"\r\n"+
			"2,Mathematics,Ch 4,GP,Dup options,1,1,2,3,A,1,3,,\r\n"+
			",,,,,,,,,,,,,\r\n"+
			"3,Mathematics,Ch 4,GP,Bad letter,1,2,3,4,E,1,3,,\r\n")
	writeFile(t, filepath.Join(g, "Sudden Death", "Maths 1", "CH1.csv"),
		"S.No,Subject,Chapter,Question,Option A,Option B,Correct Option,Difficulty,Points,Hint,Explanation\n"+
			"7,Maths,Sets,Is {} a set?,Yes,No,A,2,5,,Empty set.\n")
	writeFile(t, filepath.Join(g, "Sort it out", "Maths1", "Ch1.csv"),
		"S.No,Subject,Chapter,Set ID,Item Type,Bucket A,Bucket B,Item,Correct Bucket,Difficulty,Points,Explanation\n"+
			"1,M,Sets,SORT-002,Set,Finite,Infinite,\"{1,2}\",A,1,3,\n"+
			"2,M,Sets,SORT-002,Set,Finite,Infinite,N,B,1,3,Naturals.\n"+
			"3,M,Sets,SORT-002,Set,Finite,Other,Z,B,1,3,\n")
	writeFile(t, filepath.Join(g, "Match the Following", "Maths 1", "CH1.csv"),
		"S.No,Board ID,Prompt,Left,Right,Difficulty,Points,Hint,Explanation\n"+
			"1,MTF-001,Match sets,{},Empty,1,40,,\n"+
			"2,MTF-001,Match sets,N,Naturals,1,40,,\n"+
			"3,MTF-002,Ambiguous,A,X,1,40,,\n"+
			"4,MTF-002,Ambiguous,B,X,1,40,,\n")
	return root
}

func TestLoad(t *testing.T) {
	ds, err := Load(fixture(t))
	if err != nil {
		t.Fatal(err)
	}

	if len(ds.MCQ) != 1 {
		t.Fatalf("mcq = %d, want 1", len(ds.MCQ))
	}
	q := ds.MCQ[0]
	if q.Code != "mth11a-04-mcq-0001" || q.Correct != "b" || q.Chapter != 4 || len(q.Options) != 4 {
		t.Errorf("unexpected mcq %+v", q)
	}
	if q.Explanation != "line one\nline two" || q.Prompt != "It's the 5th term?" {
		t.Errorf("multi-line/quoted cells not preserved: %q / %q", q.Prompt, q.Explanation)
	}

	if len(ds.SuddenDeath) != 1 || ds.SuddenDeath[0].Code != "mth11a-01-sd-0007" || len(ds.SuddenDeath[0].Options) != 2 {
		t.Errorf("unexpected sudden death %+v", ds.SuddenDeath)
	}

	if len(ds.SortSets) != 1 || ds.SortSets[0].Code != "mth11a-01-set-002" || len(ds.SortSets[0].Items) != 2 {
		t.Fatalf("unexpected sort sets %+v", ds.SortSets)
	}
	if it := ds.SortSets[0].Items[1]; it.Code != "mth11a-01-so-0002" || it.Correct != "b" {
		t.Errorf("unexpected sort item %+v", it)
	}

	if len(ds.Boards) != 1 || ds.Boards[0].Code != "mth11a-01-mf-0001" || len(ds.Boards[0].Pairs) != 2 {
		t.Errorf("unexpected boards %+v", ds.Boards)
	}

	// dup options, bad letter, inconsistent set buckets, ambiguous board
	if len(ds.Warnings) != 4 {
		t.Errorf("warnings = %d, want 4: %v", len(ds.Warnings), ds.Warnings)
	}
	for _, w := range ds.Warnings {
		if !strings.Contains(w, ".csv:") {
			t.Errorf("warning lacks file:line: %s", w)
		}
	}
}

func TestLoadRejectsUnknownChapter(t *testing.T) {
	root := fixture(t)
	writeFile(t, filepath.Join(root, "11th csv", "MCQ", "Maths1", "CH9.csv"),
		"S.No,Question,Option A,Option B,Option C,Option D,Correct Option,Difficulty,Points,Hint,Explanation\n")
	if _, err := Load(root); err == nil || !strings.Contains(err.Error(), "chapter 9") {
		t.Fatalf("expected unknown chapter error, got %v", err)
	}
}

func TestLoadRejectsMissingColumns(t *testing.T) {
	root := fixture(t)
	writeFile(t, filepath.Join(root, "11th csv", "MCQ", "Maths1", "CH1.csv"), "S.No,Question\n1,Q\n")
	if _, err := Load(root); err == nil || !strings.Contains(err.Error(), "missing columns") {
		t.Fatalf("expected missing columns error, got %v", err)
	}
}

func TestChapterFromFilename(t *testing.T) {
	cases := map[string]int{
		"11th_Accounts_CH10.csv":        10,
		"Ch1.csv":                       1,
		"ch2.csv":                       2,
		"10_EconomicPlanning.csv":       10,
		"2_Money_Sudden_Death.csv":      2,
		"9_CommercialMathematics.csv":   9,
		"4_BIVARIATE FREQUENCY.csv":     4,
		"Characteristics.csv":           0,
		"5_Characteristics_of_Data.csv": 5,
	}
	for name, want := range cases {
		if got := chapterFromFilename(name); got != want {
			t.Errorf("%s: got %d want %d", name, got, want)
		}
	}
}

func TestRenderAndWrite(t *testing.T) {
	ds, err := Load(fixture(t))
	if err != nil {
		t.Fatal(err)
	}
	files := Render(ds)
	names := map[string]string{}
	for _, f := range files {
		names[f.Name] = f.Content
		if !strings.HasPrefix(f.Content, GeneratedMarker) {
			t.Errorf("%s missing generated marker", f.Name)
		}
	}
	for _, n := range []string{"10_catalog.sql", "20_mcq_maths1.sql", "30_sudden_death_maths1.sql", "40_sort_it_out_maths1.sql", "50_match_maths1.sql"} {
		if _, ok := names[n]; !ok {
			t.Errorf("missing %s", n)
		}
	}
	mcq := names["20_mcq_maths1.sql"]
	for _, want := range []string{"'It''s the 5th term?'", "WHEN NOT MATCHED BY SOURCE", "IS DISTINCT FROM", "sub.code = 'maths1'"} {
		if !strings.Contains(mcq, want) {
			t.Errorf("mcq sql missing %q", want)
		}
	}

	dir := t.TempDir()
	writeFile(t, filepath.Join(dir, "90_demo_users.sql"), "-- hand written\n")
	writeFile(t, filepath.Join(dir, "20_mcq_old.sql"), GeneratedMarker+"\n")

	drift, err := Write(dir, files, true)
	if err != nil || len(drift) != len(files)+1 {
		t.Fatalf("check drift = %v, %v", drift, err)
	}
	if _, err := Write(dir, files, false); err != nil {
		t.Fatal(err)
	}
	if drift, _ := Write(dir, files, true); len(drift) != 0 {
		t.Errorf("expected no drift after write, got %v", drift)
	}
	if _, err := os.Stat(filepath.Join(dir, "20_mcq_old.sql")); !os.IsNotExist(err) {
		t.Error("stale generated file not removed")
	}
	if _, err := os.Stat(filepath.Join(dir, "90_demo_users.sql")); err != nil {
		t.Error("hand-written file must be kept")
	}
}
