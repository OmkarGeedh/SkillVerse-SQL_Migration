# AGENTS.md - SkillVerse-SQL_Migration

PostgreSQL schema migration, data engineering ETL pipeline, and data quality repository for the SkillVerse platform.

## Architecture

- **`cmd/db/`**: CLI tool (`game-db`). Commands: `pipeline run`, `dq`, `profile`, `export`, `migrate`, `seed`.
- **`internal/pipeline/`**: ETL pipeline orchestrator, CSV/Sheets parser, batch upsert loader, and audit logger (`data_pipeline_runs`).
- **`internal/quality/`**: Data Quality & Contracts testing suite (uniqueness, not-null, enum domains, option integrity).
- **`internal/profile/`**: Statistical profiler (difficulty distribution, word/char length, hint/explanation coverage).
- **`migrations/`**: Sequenced migrations (`000001` - `000005`) with paired `.up.sql` and `.down.sql`.
- **`seeds/`**: Authoring JSON files (`manifest.json`, `questions/`, `users/`).
- **`seeds/sql/`**: Auto-generated idempotent SQL seed scripts compiled from JSON.
- **`Sheets Dump/`**: CSV exports for Google Sheets & Excel content authoring workflows.
- **`docs/`**: [`DATA_ARCHITECTURE.md`](docs/DATA_ARCHITECTURE.md), [`DATA_DICTIONARY.md`](docs/DATA_DICTIONARY.md), [`DATA_CONTRACTS.md`](docs/DATA_CONTRACTS.md).

## Rules & Invariants

1. **Data Quality Gate**: Always run `make dq` to ensure all questions conform to data contracts before merging or deploying.
2. **Always Keep JSON, CSV and SQL in Sync**: When authoring questions in JSON or CSV, run `make export-sql` and `make export-csv` to refresh compiled artifacts.
3. **Idempotence & Lineage**: All migrations and batch loads must be idempotent. Pipeline executions write audit entries into `data_pipeline_runs`.
4. **PostgreSQL as Source of Truth**: Migrations and pipelines target PostgreSQL directly (`make migrate-up`, `make pipeline-run`). Do not duplicate files into backend application code.
