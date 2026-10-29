// Package seeder applies the SQL files in seeds/sql to PostgreSQL.
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

// Apply runs every *.sql file in dir in lexical order, each in its own transaction.
func Apply(ctx context.Context, db *sql.DB, dir string) error {
	entries, err := os.ReadDir(dir)
	if err != nil {
		return fmt.Errorf("reading seed dir %s: %w", dir, err)
	}
	var files []string
	for _, e := range entries {
		if !e.IsDir() && strings.HasSuffix(e.Name(), ".sql") {
			files = append(files, e.Name())
		}
	}
	sort.Strings(files)
	if len(files) == 0 {
		return fmt.Errorf("no .sql seed files in %s (run `game-db import` first)", dir)
	}

	for _, name := range files {
		content, err := os.ReadFile(filepath.Join(dir, name))
		if err != nil {
			return err
		}
		start := time.Now()
		tx, err := db.BeginTx(ctx, nil)
		if err != nil {
			return fmt.Errorf("%s: begin: %w", name, err)
		}
		if _, err := tx.ExecContext(ctx, string(content)); err != nil {
			_ = tx.Rollback()
			return fmt.Errorf("%s: %w", name, err)
		}
		if err := tx.Commit(); err != nil {
			return fmt.Errorf("%s: commit: %w", name, err)
		}
		log.Printf("seeded %-32s (%v)", name, time.Since(start).Round(time.Millisecond))
	}
	return nil
}
