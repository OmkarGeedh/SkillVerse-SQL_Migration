package seeder

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"time"
)

// ApplySeeds executes seed operations against the database.
// format can be "all", "sql", or "json". Default is "all".
func ApplySeeds(ctx context.Context, db *sql.DB, seedsDir string, format string) error {
	log.Printf("==> Starting seed process (format: %s)...\n", format)
	startTime := time.Now()

	// Always validate seeds first
	valRes, err := ValidateSeeds(seedsDir)
	if err != nil {
		return fmt.Errorf("seed validation failed: %w (errors: %s)", err, strings.Join(valRes.Errors, "; "))
	}
	log.Printf("==> Seed validation passed (%d topics, %d chapters, %d questions, %d users).\n",
		valRes.TotalTopics, valRes.TotalChapters, valRes.TotalQuestions, valRes.TotalUsers)

	// Ensure SQL exports are up to date
	sqlDir := filepath.Join(seedsDir, "sql")
	migFile := filepath.Join(filepath.Dir(seedsDir), "migrations", "000005_seed_mcq_questions.up.sql")
	if err := ExportSQL(seedsDir, sqlDir, migFile); err != nil {
		log.Printf("Warning: SQL export during seed encountered: %v\n", err)
	}

	if format == "json" {
		if err := applyJSONSeeds(ctx, db, seedsDir); err != nil {
			return err
		}
	} else {
		// "sql" or "all" - run sql scripts in seeds/sql/
		if err := applySQLSeeds(ctx, db, sqlDir); err != nil {
			return err
		}
	}

	log.Printf("==> Seed process completed successfully in %v.\n", time.Since(startTime))
	return nil
}

func applySQLSeeds(ctx context.Context, db *sql.DB, sqlDir string) error {
	entries, err := os.ReadDir(sqlDir)
	if err != nil {
		return fmt.Errorf("failed reading sql seed dir %s: %w", sqlDir, err)
	}

	var sqlFiles []string
	for _, e := range entries {
		if !e.IsDir() && strings.HasSuffix(e.Name(), ".sql") {
			sqlFiles = append(sqlFiles, e.Name())
		}
	}
	sort.Strings(sqlFiles)

	if len(sqlFiles) == 0 {
		return fmt.Errorf("no .sql seed files found in %s", sqlDir)
	}

	for _, file := range sqlFiles {
		filePath := filepath.Join(sqlDir, file)
		content, err := os.ReadFile(filePath)
		if err != nil {
			return fmt.Errorf("failed reading seed script %s: %w", file, err)
		}

		sqlContent := strings.TrimSpace(string(content))
		if sqlContent == "" {
			continue
		}

		log.Printf("==> Executing SQL seed: %s\n", file)
		tx, err := db.BeginTx(ctx, nil)
		if err != nil {
			return fmt.Errorf("failed beginning tx for %s: %w", file, err)
		}

		if _, err := tx.ExecContext(ctx, sqlContent); err != nil {
			tx.Rollback()
			return fmt.Errorf("failed executing %s: %w", file, err)
		}

		if err := tx.Commit(); err != nil {
			return fmt.Errorf("failed committing %s: %w", file, err)
		}
		log.Printf("==> Successfully executed: %s\n", file)
	}

	return nil
}

func applyJSONSeeds(ctx context.Context, db *sql.DB, seedsDir string) error {
	// Re-use SQL exporter output or execute direct parameterized batch
	sqlDir := filepath.Join(seedsDir, "sql")
	return applySQLSeeds(ctx, db, sqlDir)
}
