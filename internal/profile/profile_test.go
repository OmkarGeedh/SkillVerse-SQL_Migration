package profile

import (
	"bytes"
	"strings"
	"testing"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func TestProfileQuestions(t *testing.T) {
	hint := "Remember assets"
	expl := "Assets are resources owned by the entity."

	questions := []seeder.QuestionSeed{
		{
			QuestionCode: "Q1",
			QuestionType: "mcq",
			TopicID:      "accounting",
			Prompt:       "What is an asset?",
			Difficulty:   1,
			Hint:         &hint,
			Explanation:  &expl,
		},
		{
			QuestionCode: "Q2",
			QuestionType: "sudden_death",
			TopicID:      "accounting",
			Prompt:       "Is cash an asset in modern accounting?",
			Difficulty:   2,
			Explanation:  &expl,
		},
		{
			QuestionCode: "Q3",
			QuestionType: "mcq",
			TopicID:      "finance",
			Prompt:       "What is NPV?",
			Difficulty:   3,
		},
	}

	p := ProfileQuestions(questions)

	if p.TotalQuestions != 3 {
		t.Fatalf("expected 3 questions, got %d", p.TotalQuestions)
	}
	if p.TypeDistribution["mcq"] != 2 {
		t.Errorf("expected 2 mcq, got %d", p.TypeDistribution["mcq"])
	}
	if p.TypeDistribution["sudden_death"] != 1 {
		t.Errorf("expected 1 sudden_death, got %d", p.TypeDistribution["sudden_death"])
	}
	if p.WithHintCount != 1 {
		t.Errorf("expected 1 hint, got %d", p.WithHintCount)
	}
	if p.WithExplanationCnt != 2 {
		t.Errorf("expected 2 explanations, got %d", p.WithExplanationCnt)
	}

	var buf bytes.Buffer
	PrintProfile(&buf, p)
	output := buf.String()
	if !strings.Contains(output, "DATASET PROFILING & METRICS REPORT") {
		t.Errorf("expected report header, got: %s", output)
	}
}
