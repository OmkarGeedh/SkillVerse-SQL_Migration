# AGENTS.md - SkillVerse-SQL_Migration

PostgreSQL schema migration, data engineering ETL pipeline, and data quality repository for the SkillVerse platform.

## Architecture

- **`cmd/db/`**: CLI tool (`game-db`). Commands: `pipeline run`, `dq`, `profile`, `export`, `migrate`, `seed`.
- **`internal/pipeline/`**: ETL pipeline orchestrator, CSV/Sheets parser, batch upsert loader, and audit logger (`data_pipeline_runs`).
- **`internal/quality/`**: Data Quality & Contracts testing suite (uniqueness, not-null, enum domains, option integrity).
- **`internal/profile/`**: Statistical profiler (difficulty distribution, word/char length, hint/explanation coverage).
- **`migrations/`**: Sequenced migrations (`000001` - `000008`+) with paired `.up.sql` and `.down.sql`.
- **`seeds/`**: Authoring JSON files (`manifest.json`, `questions/`, `users/`).
- **`seeds/sql/`**: Auto-generated idempotent SQL seed scripts compiled from JSON.
- **`Sheets Dump/`**: CSV exports for Google Sheets & Excel content authoring workflows.
- **`docs/`**: [`DATA_ARCHITECTURE.md`](docs/DATA_ARCHITECTURE.md), [`DATA_DICTIONARY.md`](docs/DATA_DICTIONARY.md), [`DATA_CONTRACTS.md`](docs/DATA_CONTRACTS.md).

## Rules & Invariants

1. **Data Quality Gate**: Always run `make dq` to ensure all questions conform to data contracts before merging or deploying.
2. **Strict Multi-Artifact Synchronization (ALWAYS Keep All in Sync)**: Any data addition, update, or ingestion must atomically keep all layers synchronized:
   - **Raw Source CSVs**: Located in `Sheets Dump/`.
   - **JSON Catalogs**: Updated in `seeds/questions/`.
   - **Compiled SQL Seeds**: Synchronized in `seeds/sql/` via `make seed-export-sql`.
   - **Sequenced Migrations**: Idempotent `.up.sql` and `.down.sql` in `migrations/`.
   - **Live Database**: Applied via `make migrate-up`.
   - **Master Export & Tests**: Refreshed via `make export-csv` (`questions_master.csv`) and count assertions updated in `internal/seeder/seeder_test.go`.
   Never leave any single layer stale, uncompiled, or unapplied.
3. **Idempotence & Lineage**: All migrations and batch loads must be idempotent. Pipeline executions write audit entries into `data_pipeline_runs`.
4. **PostgreSQL as Source of Truth**: Migrations and pipelines target PostgreSQL directly (`make migrate-up`, `make pipeline-run`). Do not duplicate files into backend application code.
5. **Column Length Invariants**:
   - `question_code`: Must be **strictly <= 20 characters** across all question tables and `user_question_history` (e.g. `sio_acc_ch1_s001_01`).
   - `pair_type`: Must be **strictly <= 32 characters** in `sort_it_out_questions`.
6. **Bug Reporting & Unclean Data Policy**:
   - Always generate a Bug Report artifact for all unclean, malformed, or incomplete data encountered in raw datasets/Sheets dumps (e.g. missing `Hint` columns, invalid types, malformed options).
   - If unclean data can be cleaned, transformed, or corrected, **always ask for user permission before editing the data**.
7. **Seed Test Maintenance**: Whenever new seed questions are added, update the expected count assertion in `internal/seeder/seeder_test.go` and verify with `go test ./...`.
