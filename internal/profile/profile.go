package profile

import (
	"fmt"
	"io"
	"os"
	"sort"
	"strings"
	"text/tabwriter"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

// DifficultyBreakdown holds distribution metrics for a single difficulty tier.
type DifficultyBreakdown struct {
	Level      int
	Count      int
	Percentage float64
}

// DatasetProfile encapsulates statistical profiling metrics for content datasets.
type DatasetProfile struct {
	TotalQuestions     int
	TypeDistribution   map[string]int
	TopicDistribution  map[string]int
	DifficultyStats    []DifficultyBreakdown
	WithHintCount      int
	WithHintPct        float64
	WithExplanationCnt int
	WithExplanationPct float64
	AvgPromptWords     float64
	MinPromptWords     int
	MaxPromptWords     int
	AvgPromptChars     float64
}

// ProfileQuestions analyzes a slice of questions and produces a comprehensive statistical profile.
func ProfileQuestions(questions []seeder.QuestionSeed) *DatasetProfile {
	p := &DatasetProfile{
		TotalQuestions:    len(questions),
		TypeDistribution:  make(map[string]int),
		TopicDistribution: make(map[string]int),
	}

	if len(questions) == 0 {
		return p
	}

	difficultyCounts := make(map[int]int)
	totalWords := 0
	totalChars := 0
	minWords := 999999
	maxWords := 0

	for _, q := range questions {
		qType := strings.ToLower(strings.TrimSpace(q.QuestionType))
		if qType == "" {
			qType = "mcq"
		}
		p.TypeDistribution[qType]++

		topic := strings.TrimSpace(q.TopicID)
		if topic == "" {
			topic = "unknown"
		}
		p.TopicDistribution[topic]++

		difficultyCounts[q.Difficulty]++

		if q.Hint != nil && strings.TrimSpace(*q.Hint) != "" {
			p.WithHintCount++
		}
		if q.Explanation != nil && strings.TrimSpace(*q.Explanation) != "" {
			p.WithExplanationCnt++
		}

		words := len(strings.Fields(q.Prompt))
		chars := len(q.Prompt)
		totalWords += words
		totalChars += chars

		if words < minWords {
			minWords = words
		}
		if words > maxWords {
			maxWords = words
		}
	}

	p.WithHintPct = (float64(p.WithHintCount) / float64(p.TotalQuestions)) * 100.0
	p.WithExplanationPct = (float64(p.WithExplanationCnt) / float64(p.TotalQuestions)) * 100.0
	p.AvgPromptWords = float64(totalWords) / float64(p.TotalQuestions)
	p.AvgPromptChars = float64(totalChars) / float64(p.TotalQuestions)
	p.MinPromptWords = minWords
	p.MaxPromptWords = maxWords

	// Build sorted difficulty distribution
	levels := []int{1, 2, 3, 4, 5}
	for _, l := range levels {
		cnt := difficultyCounts[l]
		pct := (float64(cnt) / float64(p.TotalQuestions)) * 100.0
		p.DifficultyStats = append(p.DifficultyStats, DifficultyBreakdown{
			Level:      l,
			Count:      cnt,
			Percentage: pct,
		})
	}

	return p
}

// PrintProfile outputs a readable Data Profiling dashboard to the specified writer.
func PrintProfile(w io.Writer, p *DatasetProfile) {
	fmt.Fprintln(w, "==========================================================================================")
	fmt.Fprintln(w, "                           DATASET PROFILING & METRICS REPORT                             ")
	fmt.Fprintln(w, "==========================================================================================")

	fmt.Fprintf(w, "Total Records: %d Questions\n\n", p.TotalQuestions)

	// 1. Question Type Distribution
	fmt.Fprintln(w, "📊 Mode Distribution:")
	twTypes := tabwriter.NewWriter(w, 0, 0, 2, ' ', 0)
	fmt.Fprintf(twTypes, "   MODE\tCOUNT\tPERCENTAGE\n")
	fmt.Fprintf(twTypes, "   ----\t-----\t----------\n")
	for mode, count := range p.TypeDistribution {
		pct := 0.0
		if p.TotalQuestions > 0 {
			pct = (float64(count) / float64(p.TotalQuestions)) * 100.0
		}
		fmt.Fprintf(twTypes, "   %s\t%d\t%.1f%%\n", mode, count, pct)
	}
	twTypes.Flush()

	// 2. Topic Distribution
	fmt.Fprintln(w, "\n📚 Topic Distribution:")
	twTopic := tabwriter.NewWriter(w, 0, 0, 2, ' ', 0)
	fmt.Fprintf(twTopic, "   TOPIC\tCOUNT\tPERCENTAGE\n")
	fmt.Fprintf(twTopic, "   -----\t-----\t----------\n")
	var topics []string
	for t := range p.TopicDistribution {
		topics = append(topics, t)
	}
	sort.Strings(topics)
	for _, t := range topics {
		count := p.TopicDistribution[t]
		pct := 0.0
		if p.TotalQuestions > 0 {
			pct = (float64(count) / float64(p.TotalQuestions)) * 100.0
		}
		fmt.Fprintf(twTopic, "   %s\t%d\t%.1f%%\n", t, count, pct)
	}
	twTopic.Flush()

	// 3. Difficulty Distribution
	fmt.Fprintln(w, "\n⚡ Difficulty Breakdown:")
	twDiff := tabwriter.NewWriter(w, 0, 0, 2, ' ', 0)
	fmt.Fprintf(twDiff, "   LEVEL\tCOUNT\tPERCENTAGE\tBAR\n")
	fmt.Fprintf(twDiff, "   -----\t-----\t----------\t---\n")
	for _, d := range p.DifficultyStats {
		bars := int(d.Percentage / 5.0)
		barStr := strings.Repeat("█", bars)
		fmt.Fprintf(twDiff, "   Tier %d\t%d\t%.1f%%\t%s\n", d.Level, d.Count, d.Percentage, barStr)
	}
	twDiff.Flush()

	// 4. Feature Completeness & NLP Metrics
	fmt.Fprintln(w, "\n🔍 Content Depth & Quality Indicators:")
	fmt.Fprintf(w, "   - Hint Coverage:        %d / %d (%.1f%%)\n", p.WithHintCount, p.TotalQuestions, p.WithHintPct)
	fmt.Fprintf(w, "   - Explanation Coverage: %d / %d (%.1f%%)\n", p.WithExplanationCnt, p.TotalQuestions, p.WithExplanationPct)
	fmt.Fprintf(w, "   - Average Prompt Words: %.1f words (min: %d, max: %d)\n", p.AvgPromptWords, p.MinPromptWords, p.MaxPromptWords)
	fmt.Fprintf(w, "   - Average Prompt Chars: %.1f characters\n", p.AvgPromptChars)
	fmt.Fprintln(w, "==========================================================================================")
}

// PrintProfileToStdout is a convenience helper for writing to stdout.
func PrintProfileToStdout(p *DatasetProfile) {
	PrintProfile(os.Stdout, p)
}
