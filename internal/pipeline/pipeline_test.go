package pipeline

import (
	"os"
	"path/filepath"
	"testing"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func TestCSVExportAndExtractRoundTrip(t *testing.T) {
	tempDir := t.TempDir()
	csvFile := filepath.Join(tempDir, "test_questions.csv")

	hint := "Think debits and credits"
	expl := "Every transaction has two sides"

	originalQuestions := []seeder.QuestionSeed{
		{
			QuestionCode:  "CSV_TEST_001",
			QuestionType:  "mcq",
			TopicID:       "accounting",
			Prompt:        "What is double-entry bookkeeping?",
			OptionA:       "Two accounts affected",
			OptionB:       "One account affected",
			OptionC:       "Three accounts affected",
			OptionD:       "No accounts affected",
			CorrectOption: "A",
			Difficulty:    1,
			Points:        10,
			Hint:          &hint,
			Explanation:   &expl,
		},
		{
			QuestionCode:  "CSV_TEST_002",
			QuestionType:  "sudden_death",
			TopicID:       "accounting",
			Prompt:        "Does Cash decrease on a Debit?",
			OptionA:       "False",
			OptionB:       "True",
			CorrectOption: "A",
			Difficulty:    2,
			Points:        15,
		},
	}

	// 1. Export to CSV
	if err := ExportToCSV(originalQuestions, csvFile); err != nil {
		t.Fatalf("failed exporting to CSV: %v", err)
	}

	// Verify file exists and has content
	info, err := os.Stat(csvFile)
	if err != nil || info.Size() == 0 {
		t.Fatalf("exported CSV is missing or empty")
	}

	// 2. Extract back from CSV
	extracted, err := ExtractCSVQuestions(csvFile)
	if err != nil {
		t.Fatalf("failed extracting CSV: %v", err)
	}

	if len(extracted) != 2 {
		t.Fatalf("expected 2 questions extracted, got %d", len(extracted))
	}

	if extracted[0].QuestionCode != "CSV_TEST_001" {
		t.Errorf("expected CSV_TEST_001, got %s", extracted[0].QuestionCode)
	}
	if extracted[0].Difficulty != 1 {
		t.Errorf("expected difficulty 1, got %d", extracted[0].Difficulty)
	}
	if extracted[0].Hint == nil || *extracted[0].Hint != hint {
		t.Errorf("expected hint to match")
	}

	if extracted[1].QuestionType != "sudden_death" {
		t.Errorf("expected sudden_death, got %s", extracted[1].QuestionType)
	}
}

func TestComputeChecksum(t *testing.T) {
	questions := []seeder.QuestionSeed{
		{
			QuestionCode:  "Q1",
			Prompt:        "Prompt 1",
			CorrectOption: "A",
		},
	}

	sum1 := ComputeChecksum(questions)
	sum2 := ComputeChecksum(questions)

	if sum1 == "" || sum1 != sum2 {
		t.Fatalf("expected deterministic non-empty checksum, got %s vs %s", sum1, sum2)
	}
}
