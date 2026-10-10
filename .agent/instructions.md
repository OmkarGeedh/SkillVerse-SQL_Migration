# SkillVerse-SQL_Migration - Data Engineering Instructions

Guidelines and invariant rules for data engineers modifying PostgreSQL migrations, content seeds, ETL pipelines, and the CLI tool.

## Key Rules & Invariants

1. **Dual JSON, CSV & SQL Synchronization**:
   - Master questions are authored in `seeds/questions/` (JSON) or dumped via Google Sheets in `Sheets Dump/` (CSV).
   - After modifying seeds, run `make export-sql` to update compiled SQL scripts.
   - Run `make export-csv` to refresh the master spreadsheet dump in `Sheets Dump/questions_master.csv`.

2. **Data Quality & Contract Enforcement (DQ)**:
   - Always verify data quality using `make dq` before committing.
   - All questions must adhere to [docs/DATA_CONTRACTS.md](file:///Users/omkargeedh/Developer/Gamified%20Quiz%20App/SkillVerse-SQL_Migration/docs/DATA_CONTRACTS.md).
   - Sudden Death questions must strictly satisfy the 2-option contract (`option_c` and `option_d` empty, `correct_option` in `[A, B]`).

3. **Idempotence & Audit Lineage**:
   - All migrations must use `CREATE TABLE IF NOT EXISTS` and `DROP TABLE IF EXISTS`.
   - All batch loads must use `INSERT INTO ... ON CONFLICT (...) DO UPDATE` or `DO NOTHING`.
   - ETL pipeline runs are tracked in the PostgreSQL audit table: `data_pipeline_runs`.

4. **PostgreSQL as Single Source of Truth**:
   - Migrations and ETL pipelines apply directly to PostgreSQL (`DATABASE_URL`).
   - Do NOT touch or duplicate files into backend application code (`GamifiedQuizApp_digitalHQ`).

## Common Commands

```bash
make build              # Build bin/game-db
make test               # Run unit tests (-race)
make pipeline-run       # Run end-to-end ETL pipeline with audit log
make dq                 # Run Data Quality test suite
make profile            # Profile dataset distributions and metrics
make export-csv         # Export master questions dataset to CSV
make export-sql         # Compile JSON seeds to SQL scripts
make migrate-up         # Apply migrations directly to PostgreSQL
make seed               # Seed data directly into PostgreSQL
make docker-build       # Build Docker image
make docker-sync        # Run migrator container
```
