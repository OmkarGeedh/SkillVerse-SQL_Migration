package seeder_test

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func TestValidateSeeds(t *testing.T) {
	seedsDir := "../../seeds"
	if _, err := os.Stat(seedsDir); err != nil {
		seedsDir = "seeds"
	}

	res, err := seeder.ValidateSeeds(seedsDir)
	if err != nil {
		t.Fatalf("ValidateSeeds returned unexpected error: %v, errors: %v", err, res.Errors)
	}

	if res.TotalQuestions != 505 {
		t.Errorf("Expected 505 questions, got %d", res.TotalQuestions)
	}
	if res.TotalUsers < 1 {
		t.Errorf("Expected at least 1 user, got %d", res.TotalUsers)
	}
}

func TestExportSQL(t *testing.T) {
	seedsDir := "../../seeds"
	if _, err := os.Stat(seedsDir); err != nil {
		seedsDir = "seeds"
	}

	tempDir := t.TempDir()
	sqlOut := filepath.Join(tempDir, "sql")
	migOut := filepath.Join(tempDir, "000005_test.up.sql")

	if err := seeder.ExportSQL(seedsDir, sqlOut, migOut); err != nil {
		t.Fatalf("ExportSQL failed: %v", err)
	}

	expected := []string{
		"01_seed_mcq_questions.sql",
		"02_seed_sudden_death_questions.sql",
		"03_seed_sort_it_out_questions.sql",
		"04_seed_match_the_following_questions.sql",
		"05_seed_demo_user.sql",
	}

	for _, f := range expected {
		p := filepath.Join(sqlOut, f)
		data, err := os.ReadFile(p)
		if err != nil {
			t.Errorf("Expected file %s not found: %v", f, err)
		}
		if len(data) == 0 {
			t.Errorf("File %s was empty", f)
		}
	}

	migData, err := os.ReadFile(migOut)
	if err != nil || len(migData) == 0 {
		t.Errorf("Migration file was not generated or empty")
	}
}
