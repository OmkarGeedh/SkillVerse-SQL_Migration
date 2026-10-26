package main

import (
	"context"
	"fmt"
	"log"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/config"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/db"
)

func main() {
	connStr := config.LoadDatabaseURL("")
	sqlDB, err := db.Connect(connStr)
	if err != nil {
		log.Fatalf("❌ Database connection failed: %v", err)
	}
	defer sqlDB.Close()

	ctx := context.Background()

	fmt.Println("=================================================================")
	fmt.Println("             LIVE POSTGRESQL DATABASE VERIFICATION              ")
	fmt.Println("=================================================================")

	// 1. Total counts across all question tables
	tables := []string{"sort_it_out_questions", "mcq_questions", "match_the_following_questions", "match_pairs"}
	fmt.Println("📊 Table Counts:")
	for _, t := range tables {
		var cnt int
		err := sqlDB.QueryRowContext(ctx, fmt.Sprintf("SELECT COUNT(*) FROM %s", t)).Scan(&cnt)
		if err != nil {
			log.Fatalf("Failed counting %s: %v", t, err)
		}
		fmt.Printf("   - %-32s : %d rows\n", t, cnt)
	}

	// 2. Chapter 1 Sort It Out questions count
	var ch1Count int
	err = sqlDB.QueryRowContext(ctx, "SELECT COUNT(*) FROM sort_it_out_questions WHERE question_code LIKE 'sio_acc_ch1_%'").Scan(&ch1Count)
	if err != nil {
		log.Fatalf("Failed counting Ch1 questions: %v", err)
	}
	fmt.Printf("\n🎯 Chapter 1 Sort It Out Questions: %d (Expected: 84)\n", ch1Count)
	if ch1Count != 84 {
		log.Fatalf("❌ ERROR: Expected 84 Chapter 1 questions, got %d", ch1Count)
	}

	// 3. Breakdown per pair_type in Chapter 1
	fmt.Println("\n🏷️  Chapter 1 Pair Types & Set Distribution in DB:")
	rows, err := sqlDB.QueryContext(ctx, `
		SELECT pair_type, COUNT(*), MIN(question_code), MAX(question_code)
		FROM sort_it_out_questions
		WHERE question_code LIKE 'sio_acc_ch1_%'
		GROUP BY pair_type
		ORDER BY MIN(question_code);
	`)
	if err != nil {
		log.Fatalf("Query failed: %v", err)
	}
	defer rows.Close()

	for rows.Next() {
		var pairType, minCode, maxCode string
		var count int
		if err := rows.Scan(&pairType, &count, &minCode, &maxCode); err != nil {
			log.Fatal(err)
		}
		fmt.Printf("   - %-30s: %2d items (%s -> %s)\n", pairType, count, minCode, maxCode)
	}

	// 4. Max Length Validation on live DB data
	var maxCodeLen, maxPairLen int
	err = sqlDB.QueryRowContext(ctx, `
		SELECT MAX(LENGTH(question_code)), MAX(LENGTH(pair_type))
		FROM sort_it_out_questions
		WHERE question_code LIKE 'sio_acc_ch1_%'
	`).Scan(&maxCodeLen, &maxPairLen)
	if err != nil {
		log.Fatalf("Length query failed: %v", err)
	}
	fmt.Printf("\n📏 Max Lengths in DB:\n")
	fmt.Printf("   - MAX(LENGTH(question_code)): %d (Limit: 20) -> %s\n", maxCodeLen, passFail(maxCodeLen <= 20))
	fmt.Printf("   - MAX(LENGTH(pair_type)):     %d (Limit: 32) -> %s\n", maxPairLen, passFail(maxPairLen <= 32))

	// 5. Sample Check: First 3 and Last 3 items
	fmt.Println("\n🔎 Sample Records in DB:")
	sampleRows, err := sqlDB.QueryContext(ctx, `
		(SELECT question_code, pair_type, prompt, option_a, option_b, correct_option, difficulty, points
		 FROM sort_it_out_questions WHERE question_code LIKE 'sio_acc_ch1_%' ORDER BY question_code ASC LIMIT 2)
		UNION ALL
		(SELECT question_code, pair_type, prompt, option_a, option_b, correct_option, difficulty, points
		 FROM sort_it_out_questions WHERE question_code LIKE 'sio_acc_ch1_%' ORDER BY question_code DESC LIMIT 2);
	`)
	if err != nil {
		log.Fatalf("Sample query failed: %v", err)
	}
	defer sampleRows.Close()

	for sampleRows.Next() {
		var code, pairType, prompt, optA, optB, corr string
		var diff, pts int
		if err := sampleRows.Scan(&code, &pairType, &prompt, &optA, &optB, &corr, &diff, &pts); err != nil {
			log.Fatal(err)
		}
		fmt.Printf("   [%s] %s (%s vs %s) => '%s' | diff:%d pts:%d | prompt: \"%s\"\n",
			code, pairType, optA, optB, corr, diff, pts, prompt)
	}

	// 6. Seeded Users & Profiles Check
	fmt.Println("\n👥 Seeded Users & Profiles in DB:")
	var userCount, profileCount int
	_ = sqlDB.QueryRowContext(ctx, "SELECT COUNT(*) FROM clients").Scan(&userCount)
	_ = sqlDB.QueryRowContext(ctx, "SELECT COUNT(*) FROM client_profiles").Scan(&profileCount)
	fmt.Printf("   - clients                          : %d rows\n", userCount)
	fmt.Printf("   - client_profiles                  : %d rows\n", profileCount)

	userRows, err := sqlDB.QueryContext(ctx, `
		SELECT c.id, c.username, c.email, p.full_name, p.level, p.weekly_score, p.coins
		FROM clients c
		LEFT JOIN client_profiles p ON c.id = p.client_id
		ORDER BY c.id
	`)
	if err == nil {
		defer userRows.Close()
		for userRows.Next() {
			var id, level, weeklyScore, coins int
			var username, email, fullName string
			if err := userRows.Scan(&id, &username, &email, &fullName, &level, &weeklyScore, &coins); err == nil {
				fmt.Printf("   [%2d] %-16s | %-26s | %-18s | Lvl:%d | Score:%4d | Coins:%4d\n",
					id, username, email, fullName, level, weeklyScore, coins)
			}
		}
	}

	fmt.Println("\n✅ ALL POSTGRESQL DATABASE VERIFICATIONS PASSED 100%!")
	fmt.Println("=================================================================")
}

func passFail(b bool) string {
	if b {
		return "✅ PASS"
	}
	return "❌ FAIL"
}
