package pipeline

import (
	"context"
	"crypto/sha256"
	"database/sql"
	"encoding/csv"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/quality"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

// PipelineRunSummary contains operational metadata and metrics for an ETL execution.
type PipelineRunSummary struct {
	RunID            string
	PipelineName     string
	SourceType       string
	RecordsProcessed int
	RecordsUpserted  int
	Checksum         string
	Duration         time.Duration
	Status           string // SUCCESS, FAILED
	ErrorMessage     string
	QualityReport    *quality.QualityReport
}

// EnsureAuditTable creates the data_pipeline_runs audit and lineage table if it does not exist.
func EnsureAuditTable(ctx context.Context, db *sql.DB) error {
	createSQL := `
	CREATE TABLE IF NOT EXISTS data_pipeline_runs (
		run_id VARCHAR(64) PRIMARY KEY,
		pipeline_name VARCHAR(100) NOT NULL,
		source_type VARCHAR(50) NOT NULL,
		records_processed INT NOT NULL DEFAULT 0,
		records_inserted INT NOT NULL DEFAULT 0,
		status VARCHAR(20) NOT NULL,
		duration_ms BIGINT NOT NULL,
		checksum VARCHAR(64),
		error_message TEXT,
		executed_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
	);`
	_, err := db.ExecContext(ctx, createSQL)
	return err
}

// LogPipelineRun writes the execution record into data_pipeline_runs.
func LogPipelineRun(ctx context.Context, db *sql.DB, s *PipelineRunSummary) error {
	if err := EnsureAuditTable(ctx, db); err != nil {
		return fmt.Errorf("failed creating audit table: %w", err)
	}

	insertSQL := `
	INSERT INTO data_pipeline_runs (
		run_id, pipeline_name, source_type, records_processed, records_inserted,
		status, duration_ms, checksum, error_message, executed_at
	) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, CURRENT_TIMESTAMP);`

	var errStr *string
	if s.ErrorMessage != "" {
		errStr = &s.ErrorMessage
	}

	_, err := db.ExecContext(ctx, insertSQL,
		s.RunID, s.PipelineName, s.SourceType, s.RecordsProcessed, s.RecordsUpserted,
		s.Status, s.Duration.Milliseconds(), s.Checksum, errStr,
	)
	return err
}

// ExtractAllSources loads questions and users from the seeds directory and optional CSV dumps.
func ExtractAllSources(seedsDir string, sheetsDumpDir string) ([]seeder.QuestionSeed, []seeder.UserSeed, error) {
	var allQuestions []seeder.QuestionSeed
	var allUsers []seeder.UserSeed

	// 1. Walk seeds directory for JSON
	err := filepath.Walk(seedsDir, func(path string, info os.FileInfo, err error) error {
		if err != nil || info.IsDir() {
			return err
		}
		if !strings.HasSuffix(strings.ToLower(path), ".json") || info.Name() == "manifest.json" {
			return nil
		}

		data, err := os.ReadFile(path)
		if err != nil {
			return err
		}

		var raw map[string]json.RawMessage
		if err := json.Unmarshal(data, &raw); err != nil {
			return nil
		}

		if _, ok := raw["questions"]; ok {
			var qf seeder.QuestionFile
			if err := json.Unmarshal(data, &qf); err == nil {
				allQuestions = append(allQuestions, qf.Questions...)
			}
		} else if _, ok := raw["users"]; ok {
			var uf seeder.UserFile
			if err := json.Unmarshal(data, &uf); err == nil {
				allUsers = append(allUsers, uf.Users...)
			}
		}
		return nil
	})
	if err != nil {
		return nil, nil, fmt.Errorf("failed walking seeds directory: %w", err)
	}

	// 2. Check Sheets Dump directory for incoming raw CSV dumps (excluding exported master files)
	if sheetsDumpDir != "" {
		seenCodes := make(map[string]bool)
		for _, q := range allQuestions {
			seenCodes[q.QuestionCode] = true
		}

		csvFiles, _ := filepath.Glob(filepath.Join(sheetsDumpDir, "*.csv"))
		for _, f := range csvFiles {
			// Skip generated export snapshots to avoid cyclic self-ingestion
			base := filepath.Base(f)
			if strings.Contains(base, "master") || strings.Contains(base, "export") {
				continue
			}

			csvQuestions, err := ExtractCSVQuestions(f)
			if err == nil && len(csvQuestions) > 0 {
				newCount := 0
				for _, q := range csvQuestions {
					if !seenCodes[q.QuestionCode] {
						seenCodes[q.QuestionCode] = true
						allQuestions = append(allQuestions, q)
						newCount++
					}
				}
				if newCount > 0 {
					log.Printf("==> Extracted %d new questions from Sheets CSV: %s\n", newCount, base)
				}
			}
		}
	}

	return allQuestions, allUsers, nil
}

// ExtractCSVQuestions parses questions from a CSV file matching the schema.
func ExtractCSVQuestions(csvPath string) ([]seeder.QuestionSeed, error) {
	f, err := os.Open(csvPath)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	reader := csv.NewReader(f)
	records, err := reader.ReadAll()
	if err != nil {
		return nil, err
	}

	if len(records) < 2 {
		return nil, nil // Header only or empty
	}

	headers := records[0]
	headerMap := make(map[string]int)
	for i, h := range headers {
		headerMap[strings.ToLower(strings.TrimSpace(h))] = i
	}

	var questions []seeder.QuestionSeed
	for rowIdx, row := range records[1:] {
		getVal := func(key string) string {
			if idx, ok := headerMap[key]; ok && idx < len(row) {
				return strings.TrimSpace(row[idx])
			}
			return ""
		}

		code := getVal("question_code")
		if code == "" {
			continue // skip empty rows
		}

		diff, _ := strconv.Atoi(getVal("difficulty"))
		if diff <= 0 {
			diff = 1
		}
		pts, _ := strconv.Atoi(getVal("points"))
		if pts <= 0 {
			pts = 10
		}

		var hint *string
		if h := getVal("hint"); h != "" {
			hint = &h
		}
		var explanation *string
		if e := getVal("explanation"); e != "" {
			explanation = &e
		}

		qType := getVal("question_type")
		if qType == "" {
			qType = "mcq"
		}

		pairType := getVal("pair_type")
		var matchPairs []seeder.MatchPairSeed
		if mpStr := getVal("match_pairs"); mpStr != "" {
			_ = json.Unmarshal([]byte(mpStr), &matchPairs)
		}

		q := seeder.QuestionSeed{
			QuestionCode:  code,
			QuestionType:  qType,
			TopicID:       getVal("topic_id"),
			PairType:      pairType,
			Prompt:        getVal("prompt"),
			OptionA:       getVal("option_a"),
			OptionB:       getVal("option_b"),
			OptionC:       getVal("option_c"),
			OptionD:       getVal("option_d"),
			CorrectOption: strings.ToUpper(getVal("correct_option")),
			Difficulty:    diff,
			Points:        pts,
			Hint:          hint,
			Explanation:   explanation,
			MatchPairs:    matchPairs,
		}
		_ = rowIdx
		questions = append(questions, q)
	}

	return questions, nil
}

// ComputeChecksum calculates a deterministic SHA-256 hash representing the dataset state.
func ComputeChecksum(questions []seeder.QuestionSeed) string {
	h := sha256.New()
	for _, q := range questions {
		io.WriteString(h, q.QuestionCode)
		io.WriteString(h, q.QuestionType)
		io.WriteString(h, q.TopicID)
		io.WriteString(h, q.PairType)
		io.WriteString(h, q.Prompt)
		io.WriteString(h, q.OptionA)
		io.WriteString(h, q.OptionB)
		io.WriteString(h, q.OptionC)
		io.WriteString(h, q.OptionD)
		io.WriteString(h, q.CorrectOption)
		io.WriteString(h, strconv.Itoa(q.Difficulty))
		io.WriteString(h, strconv.Itoa(q.Points))
		for _, p := range q.MatchPairs {
			io.WriteString(h, strconv.Itoa(p.PairOrder))
			io.WriteString(h, p.LeftText)
			io.WriteString(h, p.RightText)
		}
	}
	return hex.EncodeToString(h.Sum(nil))
}

// LoadQuestionsBatch performs idempotent upserts of questions into PostgreSQL.
func LoadQuestionsBatch(ctx context.Context, db *sql.DB, questions []seeder.QuestionSeed) (int, error) {
	if len(questions) == 0 {
		return 0, nil
	}

	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return 0, fmt.Errorf("failed starting tx: %w", err)
	}
	defer tx.Rollback()

	mcqQuery := `
	INSERT INTO mcq_questions (
		question_code, question_type, topic_id, prompt,
		option_a, option_b, option_c, option_d,
		correct_option, difficulty, points, hint, explanation
	) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
	ON CONFLICT (question_code) DO UPDATE SET
		question_type = EXCLUDED.question_type,
		topic_id = EXCLUDED.topic_id,
		prompt = EXCLUDED.prompt,
		option_a = EXCLUDED.option_a,
		option_b = EXCLUDED.option_b,
		option_c = EXCLUDED.option_c,
		option_d = EXCLUDED.option_d,
		correct_option = EXCLUDED.correct_option,
		difficulty = EXCLUDED.difficulty,
		points = EXCLUDED.points,
		hint = EXCLUDED.hint,
		explanation = EXCLUDED.explanation,
		updated_at = CURRENT_TIMESTAMP;`

	mcqStmt, err := tx.PrepareContext(ctx, mcqQuery)
	if err != nil {
		return 0, fmt.Errorf("failed preparing mcq upsert stmt: %w", err)
	}
	defer mcqStmt.Close()

	sioQuery := `
	INSERT INTO sort_it_out_questions (
		question_code, topic_id, pair_type, prompt,
		option_a, option_b, correct_option, difficulty, points, hint, explanation
	) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
	ON CONFLICT (question_code) DO UPDATE SET
		topic_id = EXCLUDED.topic_id,
		pair_type = EXCLUDED.pair_type,
		prompt = EXCLUDED.prompt,
		option_a = EXCLUDED.option_a,
		option_b = EXCLUDED.option_b,
		correct_option = EXCLUDED.correct_option,
		difficulty = EXCLUDED.difficulty,
		points = EXCLUDED.points,
		hint = EXCLUDED.hint,
		explanation = EXCLUDED.explanation,
		updated_at = CURRENT_TIMESTAMP;`

	sioStmt, err := tx.PrepareContext(ctx, sioQuery)
	if err != nil {
		return 0, fmt.Errorf("failed preparing sort_it_out upsert stmt: %w", err)
	}
	defer sioStmt.Close()

	mtfQuery := `
	INSERT INTO match_the_following_questions (
		question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
	) VALUES ($1, $2, $3, 25, $4, $5, $6, $7)
	ON CONFLICT (question_code) DO UPDATE SET
		topic_id = EXCLUDED.topic_id,
		prompt = EXCLUDED.prompt,
		time_limit_sec = EXCLUDED.time_limit_sec,
		difficulty = EXCLUDED.difficulty,
		points = EXCLUDED.points,
		hint = EXCLUDED.hint,
		explanation = EXCLUDED.explanation,
		updated_at = CURRENT_TIMESTAMP
	RETURNING id;`

	mtfStmt, err := tx.PrepareContext(ctx, mtfQuery)
	if err != nil {
		return 0, fmt.Errorf("failed preparing match_the_following upsert stmt: %w", err)
	}
	defer mtfStmt.Close()

	pairInsertQuery := `
	INSERT INTO match_pairs (question_id, pair_order, left_text, right_text)
	VALUES ($1, $2, $3, $4);`

	pairStmt, err := tx.PrepareContext(ctx, pairInsertQuery)
	if err != nil {
		return 0, fmt.Errorf("failed preparing match_pairs insert stmt: %w", err)
	}
	defer pairStmt.Close()

	upserted := 0
	for _, q := range questions {
		qType := strings.ToLower(strings.TrimSpace(q.QuestionType))
		switch qType {
		case "sort_it_out":
			_, err := sioStmt.ExecContext(ctx,
				q.QuestionCode, q.TopicID, q.PairType, q.Prompt,
				q.OptionA, q.OptionB, strings.ToLower(q.CorrectOption),
				q.Difficulty, q.Points, q.Hint, q.Explanation,
			)
			if err != nil {
				return upserted, fmt.Errorf("failed upserting sort_it_out question %s: %w", q.QuestionCode, err)
			}
			upserted++

		case "match_the_following":
			pts := q.Points
			if pts <= 0 {
				pts = 40
			}
			var qID string
			err := mtfStmt.QueryRowContext(ctx,
				q.QuestionCode, q.TopicID, q.Prompt,
				q.Difficulty, pts, q.Hint, q.Explanation,
			).Scan(&qID)
			if err != nil {
				return upserted, fmt.Errorf("failed upserting match_the_following question %s: %w", q.QuestionCode, err)
			}
			_, _ = tx.ExecContext(ctx, "DELETE FROM match_pairs WHERE question_id = $1", qID)
			for pIdx, p := range q.MatchPairs {
				order := p.PairOrder
				if order <= 0 {
					order = pIdx + 1
				}
				if _, err := pairStmt.ExecContext(ctx, qID, order, p.LeftText, p.RightText); err != nil {
					return upserted, fmt.Errorf("failed inserting pair for %s: %w", q.QuestionCode, err)
				}
			}
			upserted++

		default: // "mcq", "sudden_death"
			effectiveType := qType
			if effectiveType == "" {
				effectiveType = "mcq"
			}
			_, err := mcqStmt.ExecContext(ctx,
				q.QuestionCode, effectiveType, q.TopicID, q.Prompt,
				q.OptionA, q.OptionB, q.OptionC, q.OptionD,
				strings.ToLower(q.CorrectOption), q.Difficulty, q.Points, q.Hint, q.Explanation,
			)
			if err != nil {
				return upserted, fmt.Errorf("failed upserting mcq question %s: %w", q.QuestionCode, err)
			}
			upserted++
		}
	}

	if err := tx.Commit(); err != nil {
		return 0, fmt.Errorf("failed committing batch: %w", err)
	}

	return upserted, nil
}

// ExportToCSV writes questions into a standard CSV format (useful for Google Sheets export).
func ExportToCSV(questions []seeder.QuestionSeed, destPath string) error {
	if err := os.MkdirAll(filepath.Dir(destPath), 0755); err != nil {
		return err
	}

	f, err := os.Create(destPath)
	if err != nil {
		return err
	}
	defer f.Close()

	w := csv.NewWriter(f)
	defer w.Flush()

	headers := []string{
		"question_code", "question_type", "topic_id", "pair_type", "prompt",
		"option_a", "option_b", "option_c", "option_d",
		"correct_option", "difficulty", "points", "hint", "explanation", "match_pairs",
	}
	if err := w.Write(headers); err != nil {
		return err
	}

	for _, q := range questions {
		hint := ""
		if q.Hint != nil {
			hint = *q.Hint
		}
		expl := ""
		if q.Explanation != nil {
			expl = *q.Explanation
		}
		pairsJSON := ""
		if len(q.MatchPairs) > 0 {
			if b, err := json.Marshal(q.MatchPairs); err == nil {
				pairsJSON = string(b)
			}
		}

		row := []string{
			q.QuestionCode,
			q.QuestionType,
			q.TopicID,
			q.PairType,
			q.Prompt,
			q.OptionA,
			q.OptionB,
			q.OptionC,
			q.OptionD,
			q.CorrectOption,
			strconv.Itoa(q.Difficulty),
			strconv.Itoa(q.Points),
			hint,
			expl,
			pairsJSON,
		}
		if err := w.Write(row); err != nil {
			return err
		}
	}

	return nil
}
