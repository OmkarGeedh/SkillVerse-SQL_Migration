package quality

import (
	"fmt"
	"io"
	"os"
	"strings"
	"text/tabwriter"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

// CheckCategory defines the dimension of data quality being measured.
type CheckCategory string

const (
	CategoryUniqueness   CheckCategory = "Uniqueness"
	CategoryCompleteness CheckCategory = "Completeness"
	CategoryDomain       CheckCategory = "Domain/Validity"
	CategoryIntegrity    CheckCategory = "Integrity"
)

// QualityCheckResult represents the outcome of an individual data quality rule.
type QualityCheckResult struct {
	Name         string
	Category     CheckCategory
	TotalChecked int
	FailedCount  int
	Status       string // PASS, FAIL, WARN
	Errors       []string
}

// QualityReport encapsulates the overall data quality suite evaluation.
type QualityReport struct {
	TotalChecks int
	Passed      int
	Failed      int
	Warnings    int
	Results     []QualityCheckResult
}

// RunDataQualitySuite runs a comprehensive battery of data quality tests against seed questions and entities.
func RunDataQualitySuite(questions []seeder.QuestionSeed, users []seeder.UserSeed) *QualityReport {
	report := &QualityReport{
		Results: make([]QualityCheckResult, 0),
	}

	// 1. Uniqueness of Question Codes
	checkQuestionCodeUniqueness(questions, report)

	// 2. Completeness: Mandatory Question Attributes
	checkQuestionCompleteness(questions, report)

	// 3. Domain: Valid Question Types
	checkQuestionTypeDomain(questions, report)

	// 4. Domain: Valid Correct Option Bounds
	checkCorrectOptionBounds(questions, report)

	// 5. Domain: Difficulty Range (1 - 5)
	checkDifficultyRange(questions, report)

	// 6. Domain: Points Non-Negative
	checkPointsRange(questions, report)

	// 7. Integrity: Option Deduplication
	checkOptionDeduplication(questions, report)

	// 8. Integrity: Sudden Death Two-Option Contract
	checkSuddenDeathTwoOptionContract(questions, report)

	// 8b. Integrity: Sort It Out Contract
	checkSortItOutContract(questions, report)

	// 8c. Integrity: Match the Following Pairs Contract
	checkMatchPairsContract(questions, report)

	// 9. Uniqueness: User Accounts (Email & Username)
	checkUserUniqueness(users, report)

	// Calculate summary counts
	report.TotalChecks = len(report.Results)
	for _, r := range report.Results {
		if r.Status == "PASS" {
			report.Passed++
		} else if r.Status == "FAIL" {
			report.Failed++
		} else {
			report.Warnings++
		}
	}

	return report
}

func checkQuestionCodeUniqueness(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_question_code_uniqueness",
		Category:     CategoryUniqueness,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	seen := make(map[string]int)
	for idx, q := range questions {
		code := strings.TrimSpace(q.QuestionCode)
		if code == "" {
			result.Errors = append(result.Errors, fmt.Sprintf("row %d: empty question_code", idx))
			result.FailedCount++
			continue
		}
		if firstIdx, exists := seen[code]; exists {
			result.Errors = append(result.Errors, fmt.Sprintf("duplicate question_code '%s' at index %d (first seen at %d)", code, idx, firstIdx))
			result.FailedCount++
		} else {
			seen[code] = idx
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkQuestionCompleteness(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_question_mandatory_fields_not_null",
		Category:     CategoryCompleteness,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		var missing []string
		if strings.TrimSpace(q.Prompt) == "" {
			missing = append(missing, "prompt")
		}
		if strings.TrimSpace(q.TopicID) == "" {
			missing = append(missing, "topic_id")
		}
		qType := strings.ToLower(strings.TrimSpace(q.QuestionType))
		if qType == "match_the_following" {
			if len(q.MatchPairs) < 2 {
				missing = append(missing, "match_pairs")
			}
		} else {
			if strings.TrimSpace(q.OptionA) == "" {
				missing = append(missing, "option_a")
			}
			if strings.TrimSpace(q.OptionB) == "" {
				missing = append(missing, "option_b")
			}
			if strings.TrimSpace(q.CorrectOption) == "" {
				missing = append(missing, "correct_option")
			}
		}

		if len(missing) > 0 {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("question '%s' missing fields: %s", q.QuestionCode, strings.Join(missing, ", ")))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkQuestionTypeDomain(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_accepted_question_types",
		Category:     CategoryDomain,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	validTypes := map[string]bool{
		"mcq":                 true,
		"sudden_death":        true,
		"sort_it_out":         true,
		"match_the_following": true,
	}

	for _, q := range questions {
		t := strings.ToLower(strings.TrimSpace(q.QuestionType))
		if t == "" {
			t = "mcq" // default
		}
		if !validTypes[t] {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("question '%s' has unsupported question_type '%s'", q.QuestionCode, q.QuestionType))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkCorrectOptionBounds(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_correct_option_in_domain",
		Category:     CategoryDomain,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		qType := strings.ToLower(strings.TrimSpace(q.QuestionType))
		if qType == "match_the_following" {
			continue // Match the following validates via match_pairs contract
		}
		opt := strings.ToUpper(strings.TrimSpace(q.CorrectOption))
		if qType == "sudden_death" || qType == "sort_it_out" {
			if opt != "A" && opt != "B" {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("%s question '%s' correct_option must be 'A' or 'B' (got '%s')", qType, q.QuestionCode, opt))
			}
		} else {
			if opt != "A" && opt != "B" && opt != "C" && opt != "D" {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("MCQ question '%s' correct_option must be A, B, C, or D (got '%s')", q.QuestionCode, opt))
			}
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkDifficultyRange(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_difficulty_range_1_to_5",
		Category:     CategoryDomain,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if q.Difficulty < 1 || q.Difficulty > 5 {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("question '%s' difficulty %d is outside [1, 5]", q.QuestionCode, q.Difficulty))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkPointsRange(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_points_positive",
		Category:     CategoryDomain,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if q.Points <= 0 {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("question '%s' points %d must be > 0", q.QuestionCode, q.Points))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkOptionDeduplication(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_no_duplicate_options_per_question",
		Category:     CategoryIntegrity,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if strings.ToLower(strings.TrimSpace(q.QuestionType)) == "match_the_following" {
			continue // Match the following uses match_pairs rather than options
		}
		opts := []string{
			strings.TrimSpace(strings.ToLower(q.OptionA)),
			strings.TrimSpace(strings.ToLower(q.OptionB)),
		}
		if q.OptionC != "" {
			opts = append(opts, strings.TrimSpace(strings.ToLower(q.OptionC)))
		}
		if q.OptionD != "" {
			opts = append(opts, strings.TrimSpace(strings.ToLower(q.OptionD)))
		}

		seen := make(map[string]bool)
		for _, o := range opts {
			if o == "" {
				continue
			}
			if seen[o] {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("question '%s' has duplicate option text: '%s'", q.QuestionCode, o))
				break
			}
			seen[o] = true
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkSuddenDeathTwoOptionContract(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_sudden_death_binary_option_contract",
		Category:     CategoryIntegrity,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if strings.ToLower(strings.TrimSpace(q.QuestionType)) != "sudden_death" {
			continue
		}
		if strings.TrimSpace(q.OptionC) != "" || strings.TrimSpace(q.OptionD) != "" {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("sudden_death question '%s' must not have option_c or option_d populated (got C='%s', D='%s')", q.QuestionCode, q.OptionC, q.OptionD))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkSortItOutContract(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_sort_it_out_contract",
		Category:     CategoryIntegrity,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if strings.ToLower(strings.TrimSpace(q.QuestionType)) != "sort_it_out" {
			continue
		}
		if strings.TrimSpace(q.PairType) == "" {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("sort_it_out question '%s' must have pair_type populated", q.QuestionCode))
		}
		if strings.TrimSpace(q.OptionC) != "" || strings.TrimSpace(q.OptionD) != "" {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("sort_it_out question '%s' must not have option_c or option_d populated (got C='%s', D='%s')", q.QuestionCode, q.OptionC, q.OptionD))
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkMatchPairsContract(questions []seeder.QuestionSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_match_the_following_pairs_contract",
		Category:     CategoryIntegrity,
		TotalChecked: len(questions),
		Status:       "PASS",
	}

	for _, q := range questions {
		if strings.ToLower(strings.TrimSpace(q.QuestionType)) != "match_the_following" {
			continue
		}
		if len(q.MatchPairs) < 2 {
			result.FailedCount++
			result.Errors = append(result.Errors, fmt.Sprintf("match_the_following question '%s' must have at least 2 match pairs (got %d)", q.QuestionCode, len(q.MatchPairs)))
		}
		for idx, p := range q.MatchPairs {
			if strings.TrimSpace(p.LeftText) == "" || strings.TrimSpace(p.RightText) == "" {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("match_the_following question '%s' pair %d must have non-empty left_text and right_text", q.QuestionCode, idx+1))
			}
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

func checkUserUniqueness(users []seeder.UserSeed, report *QualityReport) {
	result := QualityCheckResult{
		Name:         "test_user_credentials_uniqueness",
		Category:     CategoryUniqueness,
		TotalChecked: len(users),
		Status:       "PASS",
	}

	emails := make(map[string]int)
	usernames := make(map[string]int)

	for idx, u := range users {
		email := strings.ToLower(strings.TrimSpace(u.Email))
		if email != "" {
			if first, exists := emails[email]; exists {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("duplicate user email '%s' at index %d (first seen at %d)", email, idx, first))
			} else {
				emails[email] = idx
			}
		}

		username := strings.ToLower(strings.TrimSpace(u.Username))
		if username != "" {
			if first, exists := usernames[username]; exists {
				result.FailedCount++
				result.Errors = append(result.Errors, fmt.Sprintf("duplicate username '%s' at index %d (first seen at %d)", username, idx, first))
			} else {
				usernames[username] = idx
			}
		}
	}

	if result.FailedCount > 0 {
		result.Status = "FAIL"
	}
	report.Results = append(report.Results, result)
}

// PrintReport outputs a cleanly formatted dbt/Great Expectations style ASCII table.
func PrintReport(w io.Writer, report *QualityReport) {
	fmt.Fprintln(w, "==========================================================================================")
	fmt.Fprintln(w, "                            DATA QUALITY SUITE REPORT (DQ)                                ")
	fmt.Fprintln(w, "==========================================================================================")

	tw := tabwriter.NewWriter(w, 0, 0, 2, ' ', 0)
	fmt.Fprintf(tw, "STATUS\tCATEGORY\tTEST NAME\tRECORDS\tFAILURES\n")
	fmt.Fprintf(tw, "------\t--------\t---------\t-------\t--------\n")

	for _, r := range report.Results {
		statusBadge := "✅ PASS"
		if r.Status == "FAIL" {
			statusBadge = "❌ FAIL"
		} else if r.Status == "WARN" {
			statusBadge = "⚠️  WARN"
		}
		fmt.Fprintf(tw, "%s\t%s\t%s\t%d\t%d\n", statusBadge, r.Category, r.Name, r.TotalChecked, r.FailedCount)
	}
	tw.Flush()

	fmt.Fprintln(w, "------------------------------------------------------------------------------------------")
	fmt.Fprintf(w, "Summary: %d Checks | %d Passed | %d Failed | %d Warnings\n",
		report.TotalChecks, report.Passed, report.Failed, report.Warnings)
	fmt.Fprintln(w, "==========================================================================================")

	if report.Failed > 0 {
		fmt.Fprintln(w, "\n❌ Failure Details:")
		for _, r := range report.Results {
			if len(r.Errors) > 0 {
				fmt.Fprintf(w, "  [%s - %s]:\n", r.Category, r.Name)
				for _, e := range r.Errors {
					fmt.Fprintf(w, "    - %s\n", e)
				}
			}
		}
		fmt.Fprintln(w, "")
	}
}

// PrintReportToStdout is a convenience helper for writing to stdout.
func PrintReportToStdout(report *QualityReport) {
	PrintReport(os.Stdout, report)
}
