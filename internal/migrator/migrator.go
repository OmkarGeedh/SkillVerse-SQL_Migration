package migrator

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

// MigrationRecord represents an applied migration from schema_migrations table.
type MigrationRecord struct {
	Version   string
	AppliedAt time.Time
}

// EnsureSchemaMigrations creates the schema_migrations tracking table if it doesn't exist.
func EnsureSchemaMigrations(ctx context.Context, db *sql.DB) error {
	query := `
	CREATE TABLE IF NOT EXISTS schema_migrations (
		version VARCHAR(255) PRIMARY KEY,
		applied_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
	);`
	_, err := db.ExecContext(ctx, query)
	return err
}

// GetAppliedMigrations retrieves all migration versions already executed.
func GetAppliedMigrations(ctx context.Context, db *sql.DB) (map[string]time.Time, error) {
	if err := EnsureSchemaMigrations(ctx, db); err != nil {
		return nil, fmt.Errorf("failed ensuring schema_migrations: %w", err)
	}

	rows, err := db.QueryContext(ctx, "SELECT version, applied_at FROM schema_migrations ORDER BY version ASC")
	if err != nil {
		return nil, fmt.Errorf("failed querying applied migrations: %w", err)
	}
	defer rows.Close()

	applied := make(map[string]time.Time)
	for rows.Next() {
		var v string
		var t time.Time
		if err := rows.Scan(&v, &t); err != nil {
			return nil, err
		}
		applied[v] = t
	}
	return applied, rows.Err()
}

// MigrateUp applies all pending *.up.sql migrations from the specified directory in order.
func MigrateUp(ctx context.Context, db *sql.DB, migrationsDir string) (int, error) {
	if err := EnsureSchemaMigrations(ctx, db); err != nil {
		return 0, err
	}

	applied, err := GetAppliedMigrations(ctx, db)
	if err != nil {
		return 0, err
	}

	entries, err := os.ReadDir(migrationsDir)
	if err != nil {
		return 0, fmt.Errorf("failed reading migrations directory %s: %w", migrationsDir, err)
	}

	var upFiles []string
	for _, e := range entries {
		if !e.IsDir() && strings.HasSuffix(e.Name(), ".up.sql") {
			upFiles = append(upFiles, e.Name())
		}
	}
	sort.Strings(upFiles)

	if len(upFiles) == 0 {
		log.Println("No .up.sql migrations found.")
		return 0, nil
	}

	appliedCount := 0
	for _, file := range upFiles {
		if _, exists := applied[file]; exists {
			continue
		}

		filePath := filepath.Join(migrationsDir, file)
		content, err := os.ReadFile(filePath)
		if err != nil {
			return appliedCount, fmt.Errorf("failed reading migration file %s: %w", file, err)
		}

		sqlContent := strings.TrimSpace(string(content))
		if sqlContent == "" {
			continue
		}

		log.Printf("==> Applying migration: %s\n", file)
		tx, err := db.BeginTx(ctx, nil)
		if err != nil {
			return appliedCount, fmt.Errorf("failed beginning tx for %s: %w", file, err)
		}

		if _, err := tx.ExecContext(ctx, sqlContent); err != nil {
			tx.Rollback()
			return appliedCount, fmt.Errorf("failed executing migration %s: %w", file, err)
		}

		if _, err := tx.ExecContext(ctx, "INSERT INTO schema_migrations (version) VALUES ($1)", file); err != nil {
			tx.Rollback()
			return appliedCount, fmt.Errorf("failed recording migration %s: %w", file, err)
		}

		if err := tx.Commit(); err != nil {
			return appliedCount, fmt.Errorf("failed committing migration %s: %w", file, err)
		}

		appliedCount++
		log.Printf("==> Successfully applied migration: %s\n", file)
	}

	if appliedCount == 0 {
		log.Println("==> All migrations are already up to date.")
	} else {
		log.Printf("==> Successfully applied %d migration(s).\n", appliedCount)
	}

	return appliedCount, nil
}

// MigrateDown rolls back the most recently applied migration using its *.down.sql file.
func MigrateDown(ctx context.Context, db *sql.DB, migrationsDir string) error {
	if err := EnsureSchemaMigrations(ctx, db); err != nil {
		return err
	}

	var latestVersion string
	row := db.QueryRowContext(ctx, "SELECT version FROM schema_migrations ORDER BY version DESC LIMIT 1")
	if err := row.Scan(&latestVersion); err != nil {
		if err == sql.ErrNoRows {
			log.Println("No migrations have been applied yet.")
			return nil
		}
		return fmt.Errorf("failed fetching latest migration: %w", err)
	}

	// Match corresponding down migration file
	downFileName := strings.TrimSuffix(latestVersion, ".up.sql") + ".down.sql"
	downFilePath := filepath.Join(migrationsDir, downFileName)

	content, err := os.ReadFile(downFilePath)
	if err != nil {
		return fmt.Errorf("failed reading down migration file %s: %w", downFilePath, err)
	}

	sqlContent := strings.TrimSpace(string(content))
	log.Printf("==> Rolling back migration: %s\n", downFileName)

	tx, err := db.BeginTx(ctx, nil)
	if err != nil {
		return fmt.Errorf("failed beginning tx for rollback: %w", err)
	}

	if sqlContent != "" {
		if _, err := tx.ExecContext(ctx, sqlContent); err != nil {
			tx.Rollback()
			return fmt.Errorf("failed executing down migration %s: %w", downFileName, err)
		}
	}

	if _, err := tx.ExecContext(ctx, "DELETE FROM schema_migrations WHERE version = $1", latestVersion); err != nil {
		tx.Rollback()
		return fmt.Errorf("failed removing migration record for %s: %w", latestVersion, err)
	}

	if err := tx.Commit(); err != nil {
		return fmt.Errorf("failed committing rollback: %w", err)
	}

	log.Printf("==> Successfully rolled back migration: %s\n", latestVersion)
	return nil
}

// MigrateVersion prints the status and applied versions of migrations.
func MigrateVersion(ctx context.Context, db *sql.DB, migrationsDir string) error {
	applied, err := GetAppliedMigrations(ctx, db)
	if err != nil {
		return err
	}

	entries, err := os.ReadDir(migrationsDir)
	if err != nil {
		return fmt.Errorf("failed reading migrations directory %s: %w", migrationsDir, err)
	}

	var upFiles []string
	for _, e := range entries {
		if !e.IsDir() && strings.HasSuffix(e.Name(), ".up.sql") {
			upFiles = append(upFiles, e.Name())
		}
	}
	sort.Strings(upFiles)

	fmt.Println("================================================================")
	fmt.Println("                   DATABASE MIGRATION STATUS                    ")
	fmt.Println("================================================================")
	for _, f := range upFiles {
		if appliedAt, ok := applied[f]; ok {
			fmt.Printf(" [APPLIED] %-45s (at %s)\n", f, appliedAt.Format(time.RFC3339))
		} else {
			fmt.Printf(" [PENDING] %-45s\n", f)
		}
	}
	fmt.Println("================================================================")
	fmt.Printf("Total files: %d | Applied: %d | Pending: %d\n",
		len(upFiles), len(applied), len(upFiles)-len(applied))

	return nil
}
