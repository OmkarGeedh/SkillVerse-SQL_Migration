# SkillVerse Data Dictionary & Catalog

Comprehensive documentation of all database entities, data types, constraints, and business semantics.

---

## 1. Table: `questions`

Stores question definitions across all game modes (MCQ, Sudden Death, etc.).

| Column Name | Data Type | Nullable | Constraints / Defaults | Description | Business Meaning |
|-------------|-----------|----------|------------------------|-------------|------------------|
| `id` | `BIGSERIAL` | No | `PRIMARY KEY` | Auto-incrementing surrogate identifier | Internal database primary key |
| `question_code` | `VARCHAR(100)` | No | `UNIQUE` | Unique business code | Content catalog key (e.g., `ACC_MCQ_001`, `1`, `2`) |
| `question_type` | `VARCHAR(50)` | No | Default: `'mcq'` | Game mode type | Allowed: `'mcq'`, `'sudden_death'` |
| `topic_id` | `VARCHAR(100)` | No | Indexed | Identifier of subject/topic | Links question to curriculum (e.g. `'accounting'`) |
| `prompt` | `TEXT` | No | | The question text shown to the player | Question body |
| `option_a` | `TEXT` | No | | Option A text | First choice |
| `option_b` | `TEXT` | No | | Option B text | Second choice |
| `option_c` | `TEXT` | Yes | Default: `''` | Option C text (empty for Sudden Death) | Third choice |
| `option_d` | `TEXT` | Yes | Default: `''` | Option D text (empty for Sudden Death) | Fourth choice |
| `correct_option` | `VARCHAR(10)` | No | | Correct option letter (`'A'`, `'B'`, `'C'`, `'D'`) | Authoritative answer key |
| `difficulty` | `INT` | No | `CHECK (difficulty BETWEEN 1 AND 5)` | Difficulty tier (1 = Easy, 5 = Expert) | Dynamic match-making tier |
| `points` | `INT` | No | Default: `10` | Base points awarded for correct answer | Reward baseline |
| `hint` | `TEXT` | Yes | | Hint displayed when player uses power-up | Assistive hint |
| `explanation` | `TEXT` | Yes | | Pedagogical explanation after grading | Learning explanation |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Row creation timestamp | Audit |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Row modification timestamp | Audit |

---

## 2. Table: `data_pipeline_runs`

Audit log and lineage ledger for all automated ETL pipeline executions.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `run_id` | `VARCHAR(64)` | No | `PRIMARY KEY` | Unique pipeline run identifier (e.g. `run_1760000000`) |
| `pipeline_name` | `VARCHAR(100)` | No | | Name of executed ETL pipeline |
| `source_type` | `VARCHAR(50)` | No | | Source data format (`json`, `csv`, `hybrid_json_csv`) |
| `records_processed` | `INT` | No | Default: `0` | Total records scanned during ingestion |
| `records_inserted` | `INT` | No | Default: `0` | Total rows upserted into PostgreSQL |
| `status` | `VARCHAR(20)` | No | | Pipeline status (`SUCCESS`, `FAILED`) |
| `duration_ms` | `BIGINT` | No | | Total pipeline execution time in milliseconds |
| `checksum` | `VARCHAR(64)` | Yes | | SHA-256 fingerprint of the ingested dataset |
| `error_message` | `TEXT` | Yes | | Error diagnostics if pipeline failed |
| `executed_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Execution start timestamp |

---

## 3. Table: `clients`

Stores player user credentials and authentication status.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `BIGSERIAL` | No | `PRIMARY KEY` | User ID |
| `username` | `VARCHAR(50)` | No | `UNIQUE` | Unique user handle |
| `email` | `VARCHAR(255)`| No | `UNIQUE` | Player email address |
| `phone` | `VARCHAR(50)` | Yes | | Optional mobile number |
| `password` | `VARCHAR(255)`| No | | Bcrypt password hash + server pepper |
| `status` | `VARCHAR(20)` | No | Default: `'active'` | Account status (`'active'`, `'suspended'`) |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Signup timestamp |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Profile update timestamp |

---

## 4. Table: `client_profiles`

Stores gamification attributes, levels, streaks, and wallet balances.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `BIGSERIAL` | No | `PRIMARY KEY` | Profile ID |
| `client_id` | `BIGINT` | No | `FOREIGN KEY (clients.id)` | Reference to client account |
| `uuid` | `VARCHAR(64)` | No | `UNIQUE` | Public player UUID |
| `full_name` | `VARCHAR(100)`| Yes | | Display name |
| `coins` | `INT` | No | Default: `0` | In-game currency coins |
| `gems` | `INT` | No | Default: `0` | Premium currency gems |
| `experience` | `INT` | No | Default: `0` | XP points |
| `level` | `INT` | No | Default: `1` | Player tier level |
| `current_streak` | `INT` | No | Default: `0` | Consecutive days active |
| `highest_streak` | `INT` | No | Default: `0` | All-time highest consecutive days |
| `weekly_score` | `INT` | No | Default: `0` | Score accumulated in current leaderboard cycle |

---

## 5. Table: `schema_migrations`

Tracks executed DDL migrations to guarantee sequential, single-execution idempotency.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `version` | `VARCHAR(255)`| No | `PRIMARY KEY` | Migration file prefix (e.g. `000001`, `000005`) |
| `applied_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Timestamp when migration script was executed |
