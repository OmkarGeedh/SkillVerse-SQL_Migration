package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/config"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/db"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/migrator"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/pipeline"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/profile"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/quality"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func main() {
	if len(os.Args) < 2 {
		usage()
		os.Exit(2)
	}

	command := os.Args[1]

	switch command {
	case "pipeline":
		handlePipeline(os.Args[2:])
	case "dq", "test":
		handleDataQuality(os.Args[2:])
	case "profile", "stats":
		handleProfile(os.Args[2:])
	case "export":
		handleExport(os.Args[2:])
	case "migrate":
		handleMigrate(os.Args[2:])
	case "seed":
		handleSeed(os.Args[2:])
	case "help", "-h", "--help":
		usage()
	default:
		fmt.Fprintf(os.Stderr, "Unknown command: %s\n\n", command)
		usage()
		os.Exit(2)
	}
}

func handlePipeline(args []string) {
	fs := flag.NewFlagSet("pipeline", flag.ExitOnError)
	dbFlag := fs.String("db", "", "PostgreSQL connection string (or DB_URL / DATABASE_URL env)")
	seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
	sheetsFlag := fs.String("sheets", findDir("Sheets Dump"), "Path to Sheets Dump CSV directory")
	strictFlag := fs.Bool("strict", true, "Fail pipeline if Data Quality tests fail")
	_ = fs.Parse(args)

	startTime := time.Now()
	runID := fmt.Sprintf("run_%d", startTime.Unix())

	log.Printf("==> [ETL] Starting SkillVerse Data Pipeline (Run ID: %s)\n", runID)

	// Step 1: Extract
	log.Printf("==> [Extract] Ingesting source files from %s and %s...\n", *seedsFlag, *sheetsFlag)
	questions, users, err := pipeline.ExtractAllSources(*seedsFlag, *sheetsFlag)
	if err != nil {
		log.Fatalf("❌ [Extract] Failed extracting data: %v\n", err)
	}
	log.Printf("==> [Extract] Extracted %d questions and %d demo users.\n", len(questions), len(users))

	// Step 2: Quality & Transformation Gate
	log.Printf("==> [Transform/DQ] Running Data Quality validation suite...\n")
	dqReport := quality.RunDataQualitySuite(questions, users)
	quality.PrintReportToStdout(dqReport)

	if dqReport.Failed > 0 && *strictFlag {
		log.Fatalf("❌ [DQ Gate] Aborting pipeline: %d data quality checks failed (strict mode active).\n", dqReport.Failed)
	}

	checksum := pipeline.ComputeChecksum(questions)
	log.Printf("==> [Transform] Dataset SHA-256 Checksum: %s\n", checksum)

	// Step 3: Load into PostgreSQL
	connStr := config.LoadDatabaseURL(*dbFlag)
	if connStr == "" {
		fmt.Fprintln(os.Stderr, "Error: database URL required to load data. Set DB_URL or DATABASE_URL, or pass -db flag.")
		os.Exit(1)
	}

	sqlDB, err := db.Connect(connStr)
	if err != nil {
		log.Fatalf("❌ [Load] Database connection failed: %v\n", err)
	}
	defer sqlDB.Close()

	ctx := context.Background()

	log.Printf("==> [Load] Loading %d questions into PostgreSQL...\n", len(questions))
	upserted, err := pipeline.LoadQuestionsBatch(ctx, sqlDB, questions)
	if err != nil {
		duration := time.Since(startTime)
		_ = pipeline.LogPipelineRun(ctx, sqlDB, &pipeline.PipelineRunSummary{
			RunID:            runID,
			PipelineName:     "skillverse_questions_etl",
			SourceType:       "hybrid_json_csv",
			RecordsProcessed: len(questions),
			RecordsUpserted:  upserted,
			Checksum:         checksum,
			Duration:         duration,
			Status:           "FAILED",
			ErrorMessage:     err.Error(),
		})
		log.Fatalf("❌ [Load] Failed upserting questions: %v\n", err)
	}

	duration := time.Since(startTime)

	// Step 4: Audit & Lineage Logging
	_ = pipeline.LogPipelineRun(ctx, sqlDB, &pipeline.PipelineRunSummary{
		RunID:            runID,
		PipelineName:     "skillverse_questions_etl",
		SourceType:       "hybrid_json_csv",
		RecordsProcessed: len(questions),
		RecordsUpserted:  upserted,
		Checksum:         checksum,
		Duration:         duration,
		Status:           "SUCCESS",
	})

	log.Printf("✅ [Pipeline Complete] Processed %d records | Upserted %d rows | Elapsed: %v\n",
		len(questions), upserted, duration)
	log.Printf("   Audit record written to PostgreSQL table: data_pipeline_runs\n")
}

func handleDataQuality(args []string) {
	fs := flag.NewFlagSet("dq", flag.ExitOnError)
	seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
	sheetsFlag := fs.String("sheets", findDir("Sheets Dump"), "Path to Sheets Dump CSV directory")
	_ = fs.Parse(args)

	questions, users, err := pipeline.ExtractAllSources(*seedsFlag, *sheetsFlag)
	if err != nil {
		log.Fatalf("Failed loading sources for DQ check: %v\n", err)
	}

	report := quality.RunDataQualitySuite(questions, users)
	quality.PrintReportToStdout(report)

	if report.Failed > 0 {
		os.Exit(1)
	}
}

func handleProfile(args []string) {
	fs := flag.NewFlagSet("profile", flag.ExitOnError)
	seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
	sheetsFlag := fs.String("sheets", findDir("Sheets Dump"), "Path to Sheets Dump CSV directory")
	_ = fs.Parse(args)

	questions, _, err := pipeline.ExtractAllSources(*seedsFlag, *sheetsFlag)
	if err != nil {
		log.Fatalf("Failed loading sources for profiling: %v\n", err)
	}

	prof := profile.ProfileQuestions(questions)
	profile.PrintProfileToStdout(prof)
}

func handleExport(args []string) {
	fs := flag.NewFlagSet("export", flag.ExitOnError)
	formatFlag := fs.String("format", "sql", "Export format: sql or csv")
	seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
	sheetsFlag := fs.String("sheets", findDir("Sheets Dump"), "Path to Sheets Dump CSV directory")
	sqlDirFlag := fs.String("sql", filepath.Join(findDir("seeds"), "sql"), "Output directory for SQL seeds")
	migFlag := fs.String("mig", filepath.Join(findDir("migrations"), "000005_seed_mcq_questions.up.sql"), "Output path for migration file")
	outCSVFlag := fs.String("out", filepath.Join(findDir("Sheets Dump"), "questions_master.csv"), "Output CSV path")
	_ = fs.Parse(args)

	switch strings.ToLower(*formatFlag) {
	case "csv":
		questions, _, err := pipeline.ExtractAllSources(*seedsFlag, *sheetsFlag)
		if err != nil {
			log.Fatalf("Failed loading sources: %v\n", err)
		}
		if err := pipeline.ExportToCSV(questions, *outCSVFlag); err != nil {
			log.Fatalf("Failed exporting to CSV: %v\n", err)
		}
		fmt.Printf("✅ Exported %d questions to CSV: %s\n", len(questions), *outCSVFlag)
	case "sql":
		if err := seeder.ExportSQL(*seedsFlag, *sqlDirFlag, *migFlag); err != nil {
			log.Fatalf("Export to SQL failed: %v\n", err)
		}
		fmt.Printf("✅ Exported JSON seeds to SQL scripts in %s\n", *sqlDirFlag)
		if *migFlag != "" {
			fmt.Printf("✅ Generated migration seed file: %s\n", *migFlag)
		}
	default:
		log.Fatalf("Unknown export format: %s (supported: sql, csv)\n", *formatFlag)
	}
}

func handleMigrate(args []string) {
	if len(args) == 0 {
		fmt.Fprintln(os.Stderr, "Error: migrate sub-command required (up, down, version)")
		usage()
		os.Exit(2)
	}

	subCmd := args[0]
	fs := flag.NewFlagSet("migrate "+subCmd, flag.ExitOnError)
	dbFlag := fs.String("db", "", "PostgreSQL connection string (or DB_URL / DATABASE_URL env)")
	dirFlag := fs.String("dir", findDir("migrations"), "Path to migrations directory")
	_ = fs.Parse(args[1:])

	connStr := config.LoadDatabaseURL(*dbFlag)
	if connStr == "" {
		fmt.Fprintln(os.Stderr, "Error: database URL required. Set DB_URL or DATABASE_URL, or pass -db flag.")
		os.Exit(1)
	}

	sqlDB, err := db.Connect(connStr)
	if err != nil {
		log.Fatalf("Database connection failed: %v\n", err)
	}
	defer sqlDB.Close()

	ctx := context.Background()

	switch subCmd {
	case "up":
		if _, err := migrator.MigrateUp(ctx, sqlDB, *dirFlag); err != nil {
			log.Fatalf("Migrate up failed: %v\n", err)
		}
	case "down":
		if err := migrator.MigrateDown(ctx, sqlDB, *dirFlag); err != nil {
			log.Fatalf("Migrate down failed: %v\n", err)
		}
	case "version", "status":
		if err := migrator.MigrateVersion(ctx, sqlDB, *dirFlag); err != nil {
			log.Fatalf("Migrate version failed: %v\n", err)
		}
	default:
		fmt.Fprintf(os.Stderr, "Unknown migrate sub-command: %s\n", subCmd)
		os.Exit(2)
	}
}

func handleSeed(args []string) {
	if len(args) > 0 && args[0] == "validate" {
		fs := flag.NewFlagSet("seed validate", flag.ExitOnError)
		seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
		_ = fs.Parse(args[1:])

		res, err := seeder.ValidateSeeds(*seedsFlag)
		if err != nil {
			fmt.Fprintf(os.Stderr, "❌ Seed validation failed:\n")
			for _, e := range res.Errors {
				fmt.Fprintf(os.Stderr, "  - %s\n", e)
			}
			os.Exit(1)
		}

		fmt.Printf("✅ Seed validation passed successfully!\n")
		fmt.Printf("   JSON files: %d | SQL files: %d\n", res.TotalJSONFiles, res.TotalSQLFiles)
		fmt.Printf("   Topics: %d | Chapters: %d | Questions: %d | Users: %d\n",
			res.TotalTopics, res.TotalChapters, res.TotalQuestions, res.TotalUsers)
		return
	}

	if len(args) > 0 && (args[0] == "export-sql" || args[0] == "export") {
		handleExport(args[1:])
		return
	}

	// Default seed execution against DB
	fs := flag.NewFlagSet("seed", flag.ExitOnError)
	dbFlag := fs.String("db", "", "PostgreSQL connection string (or DB_URL / DATABASE_URL env)")
	seedsFlag := fs.String("seeds", findDir("seeds"), "Path to seeds directory")
	formatFlag := fs.String("format", "all", "Seed format to apply: all, sql, json")
	_ = fs.Parse(args)

	connStr := config.LoadDatabaseURL(*dbFlag)
	if connStr == "" {
		fmt.Fprintln(os.Stderr, "Error: database URL required. Set DB_URL or DATABASE_URL, or pass -db flag.")
		os.Exit(1)
	}

	sqlDB, err := db.Connect(connStr)
	if err != nil {
		log.Fatalf("Database connection failed: %v\n", err)
	}
	defer sqlDB.Close()

	ctx := context.Background()
	if err := seeder.ApplySeeds(ctx, sqlDB, *seedsFlag, strings.ToLower(*formatFlag)); err != nil {
		log.Fatalf("Seeding failed: %v\n", err)
	}
}

func findDir(target string) string {
	candidates := []string{
		target,
		"./" + target,
		"../" + target,
		filepath.Join(".", target),
	}
	for _, c := range candidates {
		if stat, err := os.Stat(c); err == nil && stat.IsDir() {
			return c
		}
	}
	return target
}

func usage() {
	fmt.Fprintln(os.Stderr, "SkillVerse Data Engineering CLI (game-db)")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "Usage:")
	fmt.Fprintln(os.Stderr, "  # Data Pipeline (ETL & Lineage)")
	fmt.Fprintln(os.Stderr, "  game-db pipeline run [-seeds <dir>] [-sheets <dir>] [-db <url>]")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "  # Data Quality & Profiling")
	fmt.Fprintln(os.Stderr, "  game-db dq [-seeds <dir>] [-sheets <dir>]")
	fmt.Fprintln(os.Stderr, "  game-db profile [-seeds <dir>] [-sheets <dir>]")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "  # Data Export")
	fmt.Fprintln(os.Stderr, "  game-db export -format <sql|csv> [-out <path>]")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "  # Database Schema Migrations")
	fmt.Fprintln(os.Stderr, "  game-db migrate up [-dir <path>] [-db <url>]")
	fmt.Fprintln(os.Stderr, "  game-db migrate down [-dir <path>] [-db <url>]")
	fmt.Fprintln(os.Stderr, "  game-db migrate version [-dir <path>] [-db <url>]")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "  # Backward-Compatible Seeds")
	fmt.Fprintln(os.Stderr, "  game-db seed validate [-seeds <path>]")
	fmt.Fprintln(os.Stderr, "  game-db seed export-sql [-seeds <path>] [-sql <path>]")
	fmt.Fprintln(os.Stderr, "  game-db seed [-seeds <path>] [-format all|sql|json] [-db <url>]")
	fmt.Fprintln(os.Stderr, "")
	fmt.Fprintln(os.Stderr, "Environment variables:")
	fmt.Fprintln(os.Stderr, "  DB_URL or DATABASE_URL : PostgreSQL connection string")
}
