// Command game-db converts content CSVs to SQL seeds and manages the PostgreSQL schema.
package main

import (
	"context"
	"database/sql"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"

	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/config"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/csvimport"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/db"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/migrator"
	"github.com/OmkarGeedh/SkillVerse-SQL_Migration/internal/seeder"
)

func main() {
	log.SetFlags(0)
	if len(os.Args) < 2 {
		usage()
		os.Exit(2)
	}
	switch os.Args[1] {
	case "import":
		runImport(os.Args[2:])
	case "seed":
		runSeed(os.Args[2:])
	case "migrate":
		runMigrate(os.Args[2:])
	case "help", "-h", "--help":
		usage()
	default:
		fmt.Fprintf(os.Stderr, "unknown command %q\n\n", os.Args[1])
		usage()
		os.Exit(2)
	}
}

func runImport(args []string) {
	fs := flag.NewFlagSet("import", flag.ExitOnError)
	sheets := fs.String("sheets", findDir("Sheets Dump"), "content CSV root")
	out := fs.String("out", filepath.Join(findDir("seeds"), "sql"), "generated SQL directory")
	check := fs.Bool("check", false, "fail if generated SQL is out of date instead of writing it")
	_ = fs.Parse(args)

	ds, err := csvimport.Load(*sheets)
	if err != nil {
		log.Fatalf("import failed: %v", err)
	}
	for _, w := range ds.Warnings {
		log.Printf("skipped %s", w)
	}
	log.Printf("loaded %d subjects, %d chapters | mcq %d | sudden_death %d | sort_it_out %d sets / %d items | match %d pairs | %d rows skipped",
		len(ds.Subjects), len(ds.Chapters), len(ds.MCQ), len(ds.SuddenDeath), len(ds.SortSets), ds.SortItemCount(), len(ds.Pairs), len(ds.Warnings))

	changed, err := csvimport.Write(*out, csvimport.Render(ds), *check)
	if err != nil {
		log.Fatalf("writing SQL: %v", err)
	}
	switch {
	case *check && len(changed) > 0:
		log.Fatalf("seeds out of date, run `make import`: %v", changed)
	case len(changed) == 0:
		log.Printf("%s is up to date", *out)
	default:
		log.Printf("wrote %s: %v", *out, changed)
	}
}

func runSeed(args []string) {
	fs := flag.NewFlagSet("seed", flag.ExitOnError)
	dbURL := fs.String("db", "", "PostgreSQL URL (default DB_URL / DATABASE_URL)")
	dir := fs.String("dir", filepath.Join(findDir("seeds"), "sql"), "seed SQL directory")
	_ = fs.Parse(args)

	conn := connect(*dbURL)
	defer conn.Close()
	if err := seeder.Apply(context.Background(), conn, *dir); err != nil {
		log.Fatalf("seed failed: %v", err)
	}
}

func runMigrate(args []string) {
	if len(args) == 0 {
		usage()
		os.Exit(2)
	}
	sub := args[0]
	fs := flag.NewFlagSet("migrate "+sub, flag.ExitOnError)
	dbURL := fs.String("db", "", "PostgreSQL URL (default DB_URL / DATABASE_URL)")
	dir := fs.String("dir", findDir("migrations"), "migrations directory")
	_ = fs.Parse(args[1:])

	conn := connect(*dbURL)
	defer conn.Close()
	ctx := context.Background()

	var err error
	switch sub {
	case "up":
		_, err = migrator.MigrateUp(ctx, conn, *dir)
	case "down":
		err = migrator.MigrateDown(ctx, conn, *dir)
	case "version", "status":
		err = migrator.MigrateVersion(ctx, conn, *dir)
	case "drop":
		err = migrator.MigrateDropAll(ctx, conn)
	case "reset":
		if err = migrator.MigrateDropAll(ctx, conn); err == nil {
			_, err = migrator.MigrateUp(ctx, conn, *dir)
		}
	default:
		fmt.Fprintf(os.Stderr, "unknown migrate sub-command %q\n", sub)
		os.Exit(2)
	}
	if err != nil {
		log.Fatalf("migrate %s failed: %v", sub, err)
	}
}

func connect(explicit string) *sql.DB {
	url := config.LoadDatabaseURL(explicit)
	if url == "" {
		log.Fatal("database URL required: set DB_URL or DATABASE_URL, or pass -db")
	}
	conn, err := db.Connect(url)
	if err != nil {
		log.Fatalf("database connection failed: %v", err)
	}
	return conn
}

func findDir(target string) string {
	for _, c := range []string{target, filepath.Join("..", target)} {
		if st, err := os.Stat(c); err == nil && st.IsDir() {
			return c
		}
	}
	return target
}

func usage() {
	fmt.Fprint(os.Stderr, `game-db - SkillVerse content & schema tool

  game-db import [-sheets "Sheets Dump"] [-out seeds/sql] [-check]
      Validate content CSVs and (re)generate seeds/sql/*.sql. -check fails on drift.
  game-db seed [-dir seeds/sql] [-db <url>]
      Apply every seeds/sql/*.sql file (idempotent MERGE).
  game-db migrate up|down|version|drop|reset [-dir migrations] [-db <url>]
      Schema migrations. drop/reset destroy ALL data in the public schema.

Env: DB_URL or DATABASE_URL
`)
}
