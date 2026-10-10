package seeder

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

// ValidationResult holds statistics and errors from validating seeds.
type ValidationResult struct {
	TotalJSONFiles int
	TotalSQLFiles  int
	TotalTopics    int
	TotalChapters  int
	TotalQuestions int
	TotalUsers     int
	Errors         []string
}

// ValidateSeeds validates all JSON and SQL seeds located in seedsDir.
func ValidateSeeds(seedsDir string) (*ValidationResult, error) {
	res := &ValidationResult{}

	// 1. Validate manifest.json
	manifestPath := filepath.Join(seedsDir, "manifest.json")
	manifestData, err := os.ReadFile(manifestPath)
	if err != nil {
		res.Errors = append(res.Errors, fmt.Sprintf("Missing manifest.json: %v", err))
	} else {
		var manifest Manifest
		if err := json.Unmarshal(manifestData, &manifest); err != nil {
			res.Errors = append(res.Errors, fmt.Sprintf("Invalid manifest.json: %v", err))
		} else if manifest.ContentVersion <= 0 {
			res.Errors = append(res.Errors, "manifest.json content_version must be > 0")
		}
	}

	knownTopics := make(map[string]bool)
	knownChapters := make(map[string]bool)
	knownQuestions := make(map[string]string) // code -> filename

	// 2. Discover and validate all JSON files
	err = filepath.Walk(seedsDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if info.IsDir() {
			return nil
		}

		ext := strings.ToLower(filepath.Ext(path))
		if ext == ".json" {
			res.TotalJSONFiles++
			if info.Name() == "manifest.json" {
				return nil
			}
			validateJSONFile(path, res, knownTopics, knownChapters, knownQuestions)
		} else if ext == ".sql" {
			res.TotalSQLFiles++
			validateSQLFile(path, res)
		}
		return nil
	})

	if err != nil {
		return res, fmt.Errorf("error scanning seeds directory: %w", err)
	}

	if len(res.Errors) > 0 {
		return res, fmt.Errorf("seed validation failed with %d error(s)", len(res.Errors))
	}

	return res, nil
}

func validateJSONFile(path string, res *ValidationResult, knownTopics, knownChapters map[string]bool, knownQuestions map[string]string) {
	data, err := os.ReadFile(path)
	if err != nil {
		res.Errors = append(res.Errors, fmt.Sprintf("%s: failed to read: %v", path, err))
		return
	}

	// Try checking if it's topics, chapters, questions, or users
	var raw map[string]json.RawMessage
	if err := json.Unmarshal(data, &raw); err != nil {
		res.Errors = append(res.Errors, fmt.Sprintf("%s: invalid JSON syntax: %v", path, err))
		return
	}

	if _, hasTopics := raw["topics"]; hasTopics {
		var tf TopicFile
		if err := json.Unmarshal(data, &tf); err != nil {
			res.Errors = append(res.Errors, fmt.Sprintf("%s: failed parsing topics: %v", path, err))
			return
		}
		for i, t := range tf.Topics {
			if strings.TrimSpace(t.TopicCode) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: topic[%d] missing topic_code", path, i))
			} else {
				knownTopics[t.TopicCode] = true
			}
			if strings.TrimSpace(t.Name) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: topic[%d] missing name", path, i))
			}
			res.TotalTopics++
		}
	}

	if _, hasChapters := raw["chapters"]; hasChapters {
		var cf ChapterFile
		if err := json.Unmarshal(data, &cf); err != nil {
			res.Errors = append(res.Errors, fmt.Sprintf("%s: failed parsing chapters: %v", path, err))
			return
		}
		for i, c := range cf.Chapters {
			if strings.TrimSpace(c.ChapterCode) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: chapter[%d] missing chapter_code", path, i))
			} else {
				knownChapters[c.ChapterCode] = true
			}
			if strings.TrimSpace(c.TopicCode) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: chapter[%d] missing topic_code", path, i))
			}
			if strings.TrimSpace(c.Name) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: chapter[%d] missing name", path, i))
			}
			res.TotalChapters++
		}
	}

	if _, hasQuestions := raw["questions"]; hasQuestions {
		var qf QuestionFile
		if err := json.Unmarshal(data, &qf); err != nil {
			res.Errors = append(res.Errors, fmt.Sprintf("%s: failed parsing questions: %v", path, err))
			return
		}
		for i, q := range qf.Questions {
			if strings.TrimSpace(q.QuestionCode) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: question[%d] missing question_code", path, i))
			} else {
				if prev, exists := knownQuestions[q.QuestionCode]; exists {
					res.Errors = append(res.Errors, fmt.Sprintf("%s: duplicate question_code '%s' (already defined in %s)", path, q.QuestionCode, prev))
				} else {
					knownQuestions[q.QuestionCode] = filepath.Base(path)
				}
			}
			if strings.TrimSpace(q.TopicID) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: question[%d] missing topic_id", path, i))
			}
			if strings.TrimSpace(q.Prompt) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: question[%d] missing prompt", path, i))
			}
			if strings.TrimSpace(q.OptionA) == "" || strings.TrimSpace(q.OptionB) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: question[%d] must define at least option_a and option_b", path, i))
			}
			corr := strings.ToLower(strings.TrimSpace(q.CorrectOption))
			if corr != "a" && corr != "b" && corr != "c" && corr != "d" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: question[%d] correct_option must be 'a', 'b', 'c', or 'd', got '%s'", path, i, q.CorrectOption))
			}
			res.TotalQuestions++
		}
	}

	if _, hasUsers := raw["users"]; hasUsers {
		var uf UserFile
		if err := json.Unmarshal(data, &uf); err != nil {
			res.Errors = append(res.Errors, fmt.Sprintf("%s: failed parsing users: %v", path, err))
			return
		}
		for i, u := range uf.Users {
			if strings.TrimSpace(u.Username) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: user[%d] missing username", path, i))
			}
			if strings.TrimSpace(u.Email) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: user[%d] missing email", path, i))
			}
			if strings.TrimSpace(u.PasswordHash) == "" {
				res.Errors = append(res.Errors, fmt.Sprintf("%s: user[%d] missing password_hash", path, i))
			}
			res.TotalUsers++
		}
	}
}

func validateSQLFile(path string, res *ValidationResult) {
	data, err := os.ReadFile(path)
	if err != nil {
		res.Errors = append(res.Errors, fmt.Sprintf("%s: failed to read SQL file: %v", path, err))
		return
	}
	content := strings.TrimSpace(string(data))
	if len(content) == 0 {
		res.Errors = append(res.Errors, fmt.Sprintf("%s: SQL file is empty", path))
	}
}
