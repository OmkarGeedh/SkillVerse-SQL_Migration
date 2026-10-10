package quality

import (
	"bytes"
	"strings"
	"testing"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func TestRunDataQualitySuite_ValidData(t *testing.T) {
	questions := []seeder.QuestionSeed{
		{
			QuestionCode:  "ACC_MCQ_001",
			QuestionType:  "mcq",
			TopicID:       "accounting",
			Prompt:        "What is the basic accounting equation?",
			OptionA:       "Assets = Liabilities + Equity",
			OptionB:       "Assets = Liabilities - Equity",
			OptionC:       "Assets = Revenue - Expenses",
			OptionD:       "Assets = Cash + Debt",
			CorrectOption: "A",
			Difficulty:    1,
			Points:        10,
		},
		{
			QuestionCode:  "ACC_SD_001",
			QuestionType:  "sudden_death",
			TopicID:       "accounting",
			Prompt:        "Is cash considered an asset?",
			OptionA:       "True",
			OptionB:       "False",
			CorrectOption: "A",
			Difficulty:    1,
			Points:        15,
		},
	}

	users := []seeder.UserSeed{
		{
			Username: "player1",
			Email:    "player1@example.com",
			Status:   "active",
		},
	}

	report := RunDataQualitySuite(questions, users)

	if report.Failed != 0 {
		t.Fatalf("expected 0 failures, got %d", report.Failed)
	}
	if report.Passed != 9 {
		t.Fatalf("expected 9 passed checks, got %d", report.Passed)
	}

	var buf bytes.Buffer
	PrintReport(&buf, report)
	output := buf.String()
	if !strings.Contains(output, "DATA QUALITY SUITE REPORT") {
		t.Errorf("expected report title in output, got: %s", output)
	}
}

func TestRunDataQualitySuite_DetectsAnomalies(t *testing.T) {
	// Question with multiple defects: duplicate code, duplicate option, invalid difficulty, invalid correct option
	questions := []seeder.QuestionSeed{
		{
			QuestionCode:  "DUPLICATE_CODE",
			QuestionType:  "mcq",
			TopicID:       "accounting",
			Prompt:        "Defective question 1",
			OptionA:       "Option A",
			OptionB:       "Option A", // duplicate option
			OptionC:       "Option C",
			OptionD:       "Option D",
			CorrectOption: "Z", // invalid option
			Difficulty:    10,  // outside [1, 5]
			Points:        -5,  // negative points
		},
		{
			QuestionCode:  "DUPLICATE_CODE", // duplicate code
			QuestionType:  "sudden_death",
			TopicID:       "accounting",
			Prompt:        "Defective sudden death",
			OptionA:       "True",
			OptionB:       "False",
			OptionC:       "Illegal Option C", // violates 2-option contract
			CorrectOption: "C",
			Difficulty:    1,
			Points:        10,
		},
	}

	report := RunDataQualitySuite(questions, nil)

	if report.Failed == 0 {
		t.Fatalf("expected failures for defective dataset, got 0")
	}

	var buf bytes.Buffer
	PrintReport(&buf, report)
	output := buf.String()
	if !strings.Contains(output, "❌ FAIL") {
		t.Errorf("expected FAIL markers in report output: %s", output)
	}
}
