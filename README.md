# SkillVerse-SQL_Migration

PostgreSQL schema migrations, data engineering ETL pipeline, and data quality suite for the SkillVerse platform.

---

## Commands

### 1. Build & Test
```bash
# Build the game-db binary into ./bin/game-db
make build

# Run unit tests with race detection
make test

# Format and lint Go code
make fmt
make fmt-check
```

### 2. Data Engineering & Pipelines
```bash
# Run end-to-end ETL pipeline (Extract -> DQ Gate -> Load -> Lineage Audit)
make pipeline-run

# Run Data Quality (DQ) test suite (dbt/Great Expectations style)
make dq

# Profile datasets (distributions, NLP metrics, difficulty spread, hint coverage)
make profile

# Export master dataset to CSV (Sheets Dump/questions_master.csv)
make export-csv

# Compile JSON seeds to idempotent SQL scripts (seeds/sql/ & migrations/)
make export-sql
```

### 3. Database Schema Migrations
```bash
# Apply all pending migrations (uses DB_URL / DATABASE_URL)
make migrate-up

# Roll back the most recent migration
make migrate-down

# Check applied vs pending migration status
make migrate-version
```

### 4. Database Seeding & Compatibility
```bash
# Validate seed files (syntax, integrity, keys)
make seed-validate

# Apply seeds directly to PostgreSQL (uses DB_URL / DATABASE_URL)
make seed
```

### 5. Docker Commands
```bash
# Build the migration Docker container image
make docker-build

# Run migrator container to migrate and seed PostgreSQL
make docker-sync

# Start local PostgreSQL in Docker and run migrator
make docker-up

# Stop all Docker services
make docker-down
```

---

## Direct CLI Usage (`game-db`)

```bash
# ETL Pipeline
./bin/game-db pipeline run -db "$DATABASE_URL"

# Data Quality & Profiling
./bin/game-db dq
./bin/game-db profile

# Exports
./bin/game-db export -format csv -out "Sheets Dump/questions_master.csv"
./bin/game-db export -format sql

# Migrations
./bin/game-db migrate up -db "$DATABASE_URL"
./bin/game-db migrate down -db "$DATABASE_URL"
./bin/game-db migrate version -db "$DATABASE_URL"
```
