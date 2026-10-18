package seeder

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

// ExportSQL compiles all JSON seed files into idempotent SQL seed files in seeds/sql/
// and updates migrations/000005_seed_mcq_questions.up.sql.
func ExportSQL(seedsDir string, sqlOutputDir string, migrationFilePath string) error {
	if err := os.MkdirAll(sqlOutputDir, 0755); err != nil {
		return fmt.Errorf("failed creating sql output dir: %w", err)
	}

	var mcqs []QuestionSeed
	var suddenDeath []QuestionSeed
	var sortItOuts []QuestionSeed
	var matchTheFollowings []QuestionSeed
	var users []UserSeed

	err := filepath.Walk(seedsDir, func(path string, info os.FileInfo, err error) error {
		if err != nil || info.IsDir() || strings.ToLower(filepath.Ext(path)) != ".json" {
			return err
		}
		if info.Name() == "manifest.json" {
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
			var qf QuestionFile
			if err := json.Unmarshal(data, &qf); err == nil {
				for _, q := range qf.Questions {
					qType := strings.ToLower(strings.TrimSpace(q.QuestionType))
					switch qType {
					case "sudden_death":
						suddenDeath = append(suddenDeath, q)
					case "sort_it_out":
						sortItOuts = append(sortItOuts, q)
					case "match_the_following":
						matchTheFollowings = append(matchTheFollowings, q)
					default:
						mcqs = append(mcqs, q)
					}
				}
			}
		}

		if _, ok := raw["users"]; ok {
			var uf UserFile
			if err := json.Unmarshal(data, &uf); err == nil {
				users = append(users, uf.Users...)
			}
		}

		return nil
	})
	if err != nil {
		return fmt.Errorf("failed walking seeds directory: %w", err)
	}

	// Clean out any legacy 01_seed_topics_and_chapters.sql
	_ = os.Remove(filepath.Join(sqlOutputDir, "01_seed_topics_and_chapters.sql"))

	// Generate 01_seed_mcq_questions.sql
	sql01 := buildMCQsSQL(mcqs, "MCQ questions", "mcq")
	if err := os.WriteFile(filepath.Join(sqlOutputDir, "01_seed_mcq_questions.sql"), []byte(sql01), 0644); err != nil {
		return fmt.Errorf("failed writing 01_seed_mcq_questions.sql: %w", err)
	}

	// Generate 02_seed_sudden_death_questions.sql
	sql02 := buildMCQsSQL(suddenDeath, "Sudden Death questions", "sudden_death")
	if err := os.WriteFile(filepath.Join(sqlOutputDir, "02_seed_sudden_death_questions.sql"), []byte(sql02), 0644); err != nil {
		return fmt.Errorf("failed writing 02_seed_sudden_death_questions.sql: %w", err)
	}

	// Generate 03_seed_sort_it_out_questions.sql
	sql03 := buildSortItOutSQL(sortItOuts)
	if err := os.WriteFile(filepath.Join(sqlOutputDir, "03_seed_sort_it_out_questions.sql"), []byte(sql03), 0644); err != nil {
		return fmt.Errorf("failed writing 03_seed_sort_it_out_questions.sql: %w", err)
	}

	// Generate 04_seed_match_the_following_questions.sql
	sql04 := buildMatchTheFollowingSQL(matchTheFollowings)
	if err := os.WriteFile(filepath.Join(sqlOutputDir, "04_seed_match_the_following_questions.sql"), []byte(sql04), 0644); err != nil {
		return fmt.Errorf("failed writing 04_seed_match_the_following_questions.sql: %w", err)
	}

	// Generate 05_seed_demo_user.sql
	sql05 := buildUsersSQL(users)
	if err := os.WriteFile(filepath.Join(sqlOutputDir, "05_seed_demo_user.sql"), []byte(sql05), 0644); err != nil {
		return fmt.Errorf("failed writing 05_seed_demo_user.sql: %w", err)
	}

	// Generate consolidated migration 000005_seed_mcq_questions.up.sql
	if migrationFilePath != "" {
		var combined strings.Builder
		combined.WriteString("-- Migration: 000005_seed_mcq_questions.up.sql\n")
		combined.WriteString("-- Description: Seed all quiz questions (MCQ, Sudden Death, Sort It Out, Match the Following) and demo user\n\n")
		combined.WriteString(sql01)
		combined.WriteString("\n\n")
		combined.WriteString(sql02)
		combined.WriteString("\n\n")
		combined.WriteString(sql03)
		combined.WriteString("\n\n")
		combined.WriteString(sql04)
		combined.WriteString("\n\n")
		combined.WriteString(sql05)
		combined.WriteString("\n")

		if err := os.WriteFile(migrationFilePath, []byte(combined.String()), 0644); err != nil {
			return fmt.Errorf("failed writing migration file: %w", err)
		}

		downPath := strings.TrimSuffix(migrationFilePath, ".up.sql") + ".down.sql"
		downSQL := `-- Migration: 000005_seed_mcq_questions.down.sql
-- Description: Revert quiz questions and demo user

DELETE FROM match_pairs;
DELETE FROM match_the_following_questions;
DELETE FROM sort_it_out_questions;
DELETE FROM mcq_questions;
DELETE FROM client_streak_activities WHERE client_id IN (SELECT id FROM clients WHERE email = 'player@example.com');
DELETE FROM client_profiles WHERE client_id IN (SELECT id FROM clients WHERE email = 'player@example.com');
DELETE FROM clients WHERE email = 'player@example.com';
`
		if err := os.WriteFile(downPath, []byte(downSQL), 0644); err != nil {
			return fmt.Errorf("failed writing down migration file: %w", err)
		}
	}

	return nil
}

func escapeSQL(s string) string {
	return strings.ReplaceAll(s, "'", "''")
}

func buildMCQsSQL(questions []QuestionSeed, comment string, defaultType string) string {
	var sb strings.Builder
	sb.WriteString(fmt.Sprintf("-- Seeds: %s (%d items)\n\n", comment, len(questions)))

	if len(questions) == 0 {
		return sb.String()
	}

	batchSize := 50
	for i := 0; i < len(questions); i += batchSize {
		end := i + batchSize
		if end > len(questions) {
			end = len(questions)
		}

		sb.WriteString("INSERT INTO mcq_questions (\n    question_code, question_type, topic_id, prompt,\n    option_a, option_b, option_c, option_d,\n    correct_option, difficulty, points, hint, explanation\n) VALUES\n")

		batch := questions[i:end]
		for j, q := range batch {
			qType := q.QuestionType
			if qType == "" {
				qType = defaultType
			}
			hintVal := "NULL"
			if q.Hint != nil && *q.Hint != "" {
				hintVal = fmt.Sprintf("'%s'", escapeSQL(*q.Hint))
			}
			expVal := "NULL"
			if q.Explanation != nil && *q.Explanation != "" {
				expVal = fmt.Sprintf("'%s'", escapeSQL(*q.Explanation))
			}

			sb.WriteString(fmt.Sprintf(
				"(\n    '%s', '%s', '%s', '%s',\n    '%s', '%s', '%s', '%s',\n    '%s', %d, %d, %s, %s\n)",
				escapeSQL(q.QuestionCode),
				escapeSQL(qType),
				escapeSQL(q.TopicID),
				escapeSQL(q.Prompt),
				escapeSQL(q.OptionA),
				escapeSQL(q.OptionB),
				escapeSQL(q.OptionC),
				escapeSQL(q.OptionD),
				escapeSQL(strings.ToLower(q.CorrectOption)),
				q.Difficulty,
				q.Points,
				hintVal,
				expVal,
			))

			if j < len(batch)-1 {
				sb.WriteString(",\n")
			} else {
				sb.WriteString("\n")
			}
		}

		sb.WriteString(`ON CONFLICT (question_code) DO UPDATE SET
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
    updated_at = CURRENT_TIMESTAMP;

`)
	}

	return sb.String()
}

func buildSortItOutSQL(questions []QuestionSeed) string {
	var sb strings.Builder
	sb.WriteString(fmt.Sprintf("-- Seeds: Sort It Out questions (%d items)\n\n", len(questions)))

	if len(questions) == 0 {
		return sb.String()
	}

	batchSize := 50
	for i := 0; i < len(questions); i += batchSize {
		end := i + batchSize
		if end > len(questions) {
			end = len(questions)
		}

		sb.WriteString("INSERT INTO sort_it_out_questions (\n    question_code, topic_id, pair_type, prompt,\n    option_a, option_b, correct_option, difficulty, points, hint, explanation\n) VALUES\n")

		batch := questions[i:end]
		for j, q := range batch {
			hintVal := "NULL"
			if q.Hint != nil && *q.Hint != "" {
				hintVal = fmt.Sprintf("'%s'", escapeSQL(*q.Hint))
			}
			expVal := "NULL"
			if q.Explanation != nil && *q.Explanation != "" {
				expVal = fmt.Sprintf("'%s'", escapeSQL(*q.Explanation))
			}

			sb.WriteString(fmt.Sprintf(
				"(\n    '%s', '%s', '%s', '%s',\n    '%s', '%s', '%s', %d, %d, %s, %s\n)",
				escapeSQL(q.QuestionCode),
				escapeSQL(q.TopicID),
				escapeSQL(q.PairType),
				escapeSQL(q.Prompt),
				escapeSQL(q.OptionA),
				escapeSQL(q.OptionB),
				escapeSQL(strings.ToLower(q.CorrectOption)),
				q.Difficulty,
				q.Points,
				hintVal,
				expVal,
			))

			if j < len(batch)-1 {
				sb.WriteString(",\n")
			} else {
				sb.WriteString("\n")
			}
		}

		sb.WriteString(`ON CONFLICT (question_code) DO UPDATE SET
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
    updated_at = CURRENT_TIMESTAMP;

`)
	}

	return sb.String()
}

func buildMatchTheFollowingSQL(questions []QuestionSeed) string {
	var sb strings.Builder
	sb.WriteString(fmt.Sprintf("-- Seeds: Match The Following questions (%d items)\n\n", len(questions)))

	if len(questions) == 0 {
		return sb.String()
	}

	for _, q := range questions {
		hintVal := "NULL"
		if q.Hint != nil && *q.Hint != "" {
			hintVal = fmt.Sprintf("'%s'", escapeSQL(*q.Hint))
		}
		expVal := "NULL"
		if q.Explanation != nil && *q.Explanation != "" {
			expVal = fmt.Sprintf("'%s'", escapeSQL(*q.Explanation))
		}

		pts := q.Points
		if pts <= 0 {
			pts = 40
		}

		sb.WriteString(fmt.Sprintf(`INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    '%s', '%s', '%s', 25, %d, %d, %s, %s
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

`,
			escapeSQL(q.QuestionCode),
			escapeSQL(q.TopicID),
			escapeSQL(q.Prompt),
			q.Difficulty,
			pts,
			hintVal,
			expVal,
		))

		if len(q.MatchPairs) > 0 {
			sb.WriteString(fmt.Sprintf("DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = '%s');\n", escapeSQL(q.QuestionCode)))
			sb.WriteString("INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES\n")
			for pIdx, p := range q.MatchPairs {
				order := p.PairOrder
				if order <= 0 {
					order = pIdx + 1
				}
				comma := ","
				if pIdx == len(q.MatchPairs)-1 {
					comma = ";"
				}
				sb.WriteString(fmt.Sprintf("((SELECT id FROM match_the_following_questions WHERE question_code = '%s'), %d, '%s', '%s')%s\n",
					escapeSQL(q.QuestionCode),
					order,
					escapeSQL(p.LeftText),
					escapeSQL(p.RightText),
					comma,
				))
			}
			sb.WriteString("\n")
		}
	}

	return sb.String()
}

func buildUsersSQL(users []UserSeed) string {
	var sb strings.Builder
	sb.WriteString("-- Seeds: Demo Users and Profiles\n\n")

	for _, u := range users {
		phoneVal := "NULL"
		if u.Phone != "" {
			phoneVal = fmt.Sprintf("'%s'", escapeSQL(u.Phone))
		}

		sb.WriteString(fmt.Sprintf(`INSERT INTO clients (username, email, phone, password, status)
VALUES ('%s', '%s', %s, '%s', '%s')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

`, escapeSQL(u.Username), escapeSQL(u.Email), phoneVal, escapeSQL(u.PasswordHash), escapeSQL(u.Status)))

		if u.Profile != nil {
			p := u.Profile
			sb.WriteString(fmt.Sprintf(`INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, '%s', '%s', '%s', '%s', '%s',
       %t, %d, %d, %d, %d, %d, %d, CURRENT_DATE, %d
FROM clients WHERE email = '%s'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = '%s'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = '%s'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = '%s'
ON CONFLICT (client_id, activity_date) DO NOTHING;

`,
				escapeSQL(p.FullName), escapeSQL(p.AvatarID), escapeSQL(p.Class), escapeSQL(p.Board), escapeSQL(p.Subjects),
				p.IsOnboarded, p.Coins, p.Gems, p.Experience, p.Level, p.CurrentStreak, p.HighestStreak, p.WeeklyScore,
				escapeSQL(u.Email), escapeSQL(u.Email), escapeSQL(u.Email), escapeSQL(u.Email),
			))
		}
	}

	return sb.String()
}
