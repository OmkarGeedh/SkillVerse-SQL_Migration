package mentalmaths

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/csvimport"
)

func TestWriteIsDeterministicAndImportsCleanly(t *testing.T) {
	root := t.TempDir()
	catalog := filepath.Join(root, "catalog")
	if err := os.MkdirAll(catalog, 0o755); err != nil {
		t.Fatal(err)
	}
	must := func(err error) {
		t.Helper()
		if err != nil {
			t.Fatal(err)
		}
	}
	must(os.WriteFile(filepath.Join(catalog, "subjects.csv"),
		[]byte("grade,folder,code,short_code,name,sort_order\n11,Mental Maths,mental_maths,mm,Mental Maths,5\n"), 0o644))
	must(os.WriteFile(filepath.Join(catalog, "chapters.csv"),
		[]byte("subject,chapter_no,title\nmental_maths,1,Easy\nmental_maths,2,Medium\nmental_maths,3,Hard\n"), 0o644))

	files, err := Write(filepath.Join(root, "11th csv"))
	must(err)
	first := map[string][]byte{}
	for _, f := range files {
		b, err := os.ReadFile(f)
		must(err)
		first[f] = b
	}
	if _, err := Write(filepath.Join(root, "11th csv")); err != nil {
		t.Fatal(err)
	}
	for _, f := range files {
		b, _ := os.ReadFile(f)
		if string(b) != string(first[f]) {
			t.Fatalf("%s changed on regeneration", f)
		}
	}

	ds, err := csvimport.Load(root)
	must(err)
	if len(ds.Warnings) != 0 {
		t.Fatalf("generated rows were skipped: %v", ds.Warnings)
	}
	// Easy 162 + Medium 64 + Hard 184 facts per game; Sort has two sets per level.
	if len(ds.MCQ) != 410 || len(ds.SuddenDeath) != 410 || ds.SortItemCount() != 820 || len(ds.Pairs) != 410 {
		t.Fatalf("unexpected counts: mcq %d sd %d sort %d match %d", len(ds.MCQ), len(ds.SuddenDeath), ds.SortItemCount(), len(ds.Pairs))
	}
	for _, q := range ds.MCQ {
		if len(q.Code) > 20 {
			t.Fatalf("code too long: %s", q.Code)
		}
	}
}
