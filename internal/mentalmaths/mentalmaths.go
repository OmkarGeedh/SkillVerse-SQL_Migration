// Package mentalmaths generates the quick-arithmetic CSVs for the Mental Maths subject
// under "Sheets Dump/11th csv/<game>/Mental Maths/". Output is deterministic, so
// regenerating never changes question codes. The CSVs then follow the normal
// `game-db import` → `game-db seed` path.
package mentalmaths

import (
	"encoding/csv"
	"fmt"
	"math/rand/v2"
	"os"
	"path/filepath"
	"strconv"
)

// Folder is the subject folder name (see catalog/subjects.csv).
const Folder = "Mental Maths"

// fact is one arithmetic question, e.g. {"7 + 5", 12}.
type fact struct {
	expr string
	ans  int
}

type level struct {
	file       string
	difficulty int
	facts      []fact
}

// levels: Easy = addition/subtraction, Medium = multiplication tables,
// Hard = division and 2-digit × 1-digit multiplication.
func levels() []level {
	var easy, medium, hard []fact
	for a := 1; a <= 9; a++ {
		for b := 1; b <= 9; b++ {
			easy = append(easy, fact{fmt.Sprintf("%d + %d", a, b), a + b})
		}
	}
	for a := 1; a <= 9; a++ {
		for b := 1; b <= 9; b++ {
			easy = append(easy, fact{fmt.Sprintf("%d - %d", a+b, b), a})
		}
	}
	for a := 2; a <= 9; a++ {
		for b := 2; b <= 9; b++ {
			medium = append(medium, fact{fmt.Sprintf("%d × %d", a, b), a * b})
		}
	}
	for a := 2; a <= 9; a++ {
		for b := 2; b <= 9; b++ {
			hard = append(hard, fact{fmt.Sprintf("%d ÷ %d", a*b, b), a})
		}
	}
	for a := 11; a <= 25; a++ {
		for b := 2; b <= 9; b++ {
			hard = append(hard, fact{fmt.Sprintf("%d × %d", a, b), a * b})
		}
	}
	return []level{
		{"1_Easy.csv", 1, easy},
		{"2_Medium.csv", 2, medium},
		{"3_Hard.csv", 3, hard},
	}
}

// wrongAnswers returns plausible wrong answers (close numbers first), never negative.
func wrongAnswers(ans int) []int {
	var out []int
	seen := map[int]bool{ans: true}
	for _, d := range []int{1, -1, 2, -2, 10, -10, 3, -3, 5, -5} {
		if v := ans + d; v >= 0 && !seen[v] {
			seen[v] = true
			out = append(out, v)
		}
	}
	return out
}

// Write regenerates all Mental Maths CSVs below root ("Sheets Dump/11th csv") and
// returns the files written.
func Write(root string) ([]string, error) {
	type game struct {
		dir    string
		header []string
		rows   func(l level, rng *rand.Rand) [][]string
	}
	letters := []string{"A", "B", "C", "D"}
	choice := func(nOpts int) func(level, *rand.Rand) [][]string {
		return func(l level, rng *rand.Rand) [][]string {
			var rows [][]string
			for i, f := range l.facts {
				wrong := wrongAnswers(f.ans)
				if nOpts == 4 {
					// one close miss plus two from the wider pool
					rest := wrong[1:]
					rng.Shuffle(len(rest), func(i, j int) { rest[i], rest[j] = rest[j], rest[i] })
					wrong = append(wrong[:1:1], rest[:2]...)
				} else {
					k := rng.IntN(2) // ±1 miss, either side
					wrong = wrong[k : k+1]
				}
				opts := append([]int{f.ans}, wrong...)
				rng.Shuffle(len(opts), func(i, j int) { opts[i], opts[j] = opts[j], opts[i] })
				correct := 0
				for k, o := range opts {
					if o == f.ans {
						correct = k
					}
				}
				row := []string{strconv.Itoa(i + 1), f.expr + " = ?"}
				for _, o := range opts {
					row = append(row, strconv.Itoa(o))
				}
				row = append(row, letters[correct], strconv.Itoa(l.difficulty), "", fmt.Sprintf("%s = %d", f.expr, f.ans))
				rows = append(rows, row)
			}
			return rows
		}
	}
	games := []game{
		{"MCQ", []string{"S.No", "Question", "Option A", "Option B", "Option C", "Option D", "Correct Option", "Difficulty", "Hint", "Explanation"}, choice(4)},
		{"Sudden Death", []string{"S.No", "Question", "Option A", "Option B", "Correct Option", "Difficulty", "Hint", "Explanation"}, choice(2)},
		{"Sort it out", []string{"S.No", "Set ID", "Item Type", "Bucket A", "Bucket B", "Item", "Correct Bucket", "Difficulty", "Explanation"},
			func(l level, rng *rand.Rand) [][]string {
				var rows [][]string
				n := 0
				// Set 1: is the statement true? Every other fact shows a near-miss answer.
				for i, f := range l.facts {
					n++
					shown, bucket := f.ans, "A"
					if i%2 == 1 {
						w := wrongAnswers(f.ans)
						shown, bucket = w[rng.IntN(min(4, len(w)))], "B"
					}
					rows = append(rows, []string{strconv.Itoa(n), "SORT-001", "Statement", "True", "False",
						fmt.Sprintf("%s = %d", f.expr, shown), bucket, strconv.Itoa(l.difficulty), fmt.Sprintf("%s = %d", f.expr, f.ans)})
				}
				// Set 2: is the answer even or odd?
				for _, f := range l.facts {
					n++
					bucket := "A"
					if f.ans%2 == 1 {
						bucket = "B"
					}
					rows = append(rows, []string{strconv.Itoa(n), "SORT-002", "Answer", "Even", "Odd",
						f.expr, bucket, strconv.Itoa(l.difficulty), fmt.Sprintf("%s = %d", f.expr, f.ans)})
				}
				return rows
			}},
		{"Match the Following", []string{"S.No", "Left", "Right", "Difficulty"},
			func(l level, _ *rand.Rand) [][]string {
				var rows [][]string
				for i, f := range l.facts {
					rows = append(rows, []string{strconv.Itoa(i + 1), f.expr, strconv.Itoa(f.ans), strconv.Itoa(l.difficulty)})
				}
				return rows
			}},
	}

	var written []string
	for gi, g := range games {
		dir := filepath.Join(root, g.dir, Folder)
		if err := os.MkdirAll(dir, 0o755); err != nil {
			return written, err
		}
		for li, l := range levels() {
			rng := rand.New(rand.NewPCG(uint64(gi+1), uint64(li+1)))
			path := filepath.Join(dir, l.file)
			if err := writeCSV(path, g.header, g.rows(l, rng)); err != nil {
				return written, err
			}
			written = append(written, path)
		}
	}
	return written, nil
}

func writeCSV(path string, header []string, rows [][]string) error {
	f, err := os.Create(path)
	if err != nil {
		return err
	}
	w := csv.NewWriter(f)
	_ = w.Write(header)
	_ = w.WriteAll(rows)
	if err := w.Error(); err != nil {
		f.Close()
		return err
	}
	return f.Close()
}
