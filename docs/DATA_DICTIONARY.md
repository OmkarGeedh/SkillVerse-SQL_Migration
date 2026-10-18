# SkillVerse Data Dictionary & Catalog

Comprehensive documentation of all database entities, data types, constraints, and business semantics.

---

## 1. Table: `mcq_questions`

Stores multiple-choice questions for standard MCQ and Sudden Death game modes.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description | Business Meaning |
|-------------|-----------|----------|------------------------|-------------|------------------|
| `id` | `VARCHAR(36)` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | Surrogate UUID identifier | Unique question primary key |
| `question_code` | `VARCHAR(64)` | No | `UNIQUE` | Unique business code | Content catalog key (e.g. `1`, `sd_acc_001`) |
| `question_type` | `VARCHAR(32)` | No | Default: `'mcq'` | Game mode type | Allowed: `'mcq'`, `'sudden_death'` |
| `topic_id` | `VARCHAR(64)` | No | Indexed | Identifier of subject/topic | Links question to curriculum (e.g. `'accounting'`) |
| `prompt` | `TEXT` | No | | The question text shown to the player | Question body |
| `option_a` | `TEXT` | No | | Option A text | First choice |
| `option_b` | `TEXT` | No | | Option B text | Second choice |
| `option_c` | `TEXT` | Yes | Default: `''` | Option C text (empty for Sudden Death) | Third choice |
| `option_d` | `TEXT` | Yes | Default: `''` | Option D text (empty for Sudden Death) | Fourth choice |
| `correct_option` | `VARCHAR(10)` | No | | Correct option letter (`'a'`, `'b'`, `'c'`, `'d'`) | Authoritative answer key |
| `difficulty` | `INT` | No | Default: `1` | Difficulty tier (1 = Easy, 2 = Medium, 3 = Hard) | Dynamic match-making tier |
| `points` | `INT` | No | Default: `10` | Base points awarded for correct answer | Reward baseline |
| `hint` | `TEXT` | Yes | | Hint displayed when player uses power-up | Assistive hint |
| `explanation` | `TEXT` | Yes | | Pedagogical explanation after grading | Learning explanation |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Row creation timestamp | Audit |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Row modification timestamp | Audit |

---

## 2. Table: `sort_it_out_questions`

Stores binary rapid-fire swipe classification questions (Debit vs. Credit, True vs. False, Asset vs. Liability).

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `VARCHAR(36)` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | Unique question primary key |
| `question_code` | `VARCHAR(64)` | No | `UNIQUE` | Unique business code (e.g. `sio_cd_001`) |
| `topic_id` | `VARCHAR(64)` | No | Indexed | Identifier of topic (e.g. `'accounting'`) |
| `pair_type` | `VARCHAR(64)` | No | | Classification domain (`credit_debit`, `asset_liability`, `true_false`) |
| `prompt` | `TEXT` | No | | Statement to categorize |
| `option_a` | `TEXT` | No | | First category bucket (e.g. `'Debit'`) |
| `option_b` | `TEXT` | No | | Second category bucket (e.g. `'Credit'`) |
| `correct_option` | `VARCHAR(10)` | No | | Correct bucket letter (`'a'` or `'b'`) |
| `difficulty` | `INT` | No | Default: `1` | Difficulty tier (1 - 3) |
| `points` | `INT` | No | Default: `10` | Score points |
| `hint` | `TEXT` | Yes | | Assistive hint |
| `explanation` | `TEXT` | Yes | | Pedagogical explanation |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |

---

## 3. Table: `match_the_following_questions`

Stores column matching puzzle boards.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `VARCHAR(36)` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | Unique puzzle board primary key |
| `question_code` | `VARCHAR(64)` | No | `UNIQUE` | Unique board identifier (e.g. `mtf_acc_001`) |
| `topic_id` | `VARCHAR(64)` | No | Indexed | Curriculum topic ID |
| `prompt` | `TEXT` | No | | Instruction prompt |
| `time_limit_sec` | `INT` | No | Default: `25` | Countdown timer for completing match board |
| `difficulty` | `INT` | No | Default: `1` | Difficulty rating |
| `points` | `INT` | No | Default: `40` | Total reward points for full board match |
| `hint` | `TEXT` | Yes | | Hint text |
| `explanation` | `TEXT` | Yes | | Full explanation |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |

---

## 4. Table: `match_pairs`

Stores individual left-to-right matching item pairs belonging to a `match_the_following_questions` board.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `VARCHAR(36)` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | Pair identifier |
| `question_id` | `VARCHAR(36)` | No | `REFERENCES match_the_following_questions(id) ON DELETE CASCADE` | Parent puzzle board |
| `pair_order` | `INT` | No | Default: `1` | Order / index of pair |
| `left_text` | `TEXT` | No | | Item shown on the left column |
| `right_text` | `TEXT` | No | | Corresponding matching item on the right column |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |

---

## 5. Table: `clients`

Stores player authentication credentials.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `SERIAL` | No | `PRIMARY KEY` | User ID |
| `username` | `VARCHAR(100)`| No | `UNIQUE` | Unique user handle |
| `email` | `VARCHAR(255)`| No | `UNIQUE` | Player email address |
| `phone` | `VARCHAR(20)` | Yes | `UNIQUE` | Optional mobile number |
| `password` | `VARCHAR(255)`| No | | Bcrypt password hash |
| `status` | `VARCHAR(20)` | No | Default: `'active'` | Account status |
| `refresh_token`| `VARCHAR(512)`| Yes | | Hashed JWT refresh token |
| `created_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Creation timestamp |
| `updated_at` | `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Update timestamp |

---

## 6. Table: `client_profiles`

Player gaming profile, progression metrics, streak status, and academic context.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `SERIAL` | No | `PRIMARY KEY` | Profile ID |
| `client_id` | `INT` | No | `UNIQUE REFERENCES clients(id) ON DELETE CASCADE` | Associated player ID |
| `uuid` | `VARCHAR(64)` | No | `UNIQUE` | Public UUID |
| `full_name` | `VARCHAR(100)`| No | | Player display name |
| `avatar_id` | `VARCHAR(50)` | No | Default: `'user'` | Selected avatar preset |
| `avatar_url`| `VARCHAR(255)`| Yes | | Custom avatar URL |
| `class` | `VARCHAR(50)` | Yes | | Academic grade / class |
| `board` | `VARCHAR(100)`| Yes | | Education board (CBSE, ICSE, etc.) |
| `subjects` | `TEXT` | Yes | Default: `'[]'` | Enrolled subjects JSON array |
| `is_onboarded`| `BOOLEAN` | No | Default: `FALSE` | Onboarding completion flag |
| `coins` | `INT` | No | Default: `100` | In-game currency balance |
| `gems` | `INT` | No | Default: `10` | Premium currency balance |
| `experience`| `INT` | No | Default: `0` | Cumulative XP earned |
| `level` | `INT` | No | Default: `1` | Current player level |
| `current_streak`| `INT` | No | Default: `1` | Consecutive days active streak |
| `highest_streak`| `INT` | No | Default: `1` | All-time highest streak |
| `last_active_date`| `DATE` | Yes | | Last date player participated |
| `weekly_score` | `INT` | No | Default: `0`, Indexed | Authoritative weekly leaderboard score |
| `created_at`| `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |
| `updated_at`| `TIMESTAMPTZ`| No | Default: `CURRENT_TIMESTAMP` | Audit |

---

## 7. Table: `client_streak_activities`

Daily streak activity check-in log.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `SERIAL` | No | `PRIMARY KEY` | Record ID |
| `client_id` | `INT` | No | `REFERENCES clients(id) ON DELETE CASCADE` | Associated player |
| `activity_date` | `VARCHAR(10)` | No | Format: `YYYY-MM-DD` | Date of activity |
| `completed` | `BOOLEAN` | No | Default: `TRUE` | Activity completion flag |
| `created_at` | `TIMESTAMPTZ` | No | Default: `CURRENT_TIMESTAMP` | Check-in timestamp |

---

## 8. Table: `user_question_history`

Immutable audit ledger of every question answered across all game modes.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `UUID` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | History record ID |
| `client_id` | `INT` | No | `REFERENCES clients(id) ON DELETE CASCADE` | Answering player |
| `session_id` | `UUID` | No | Indexed | Ephemeral Redis session ID |
| `game_mode` | `VARCHAR(32)` | No | Default: `'mcq'` | Game mode (`mcq`, `sudden_death`, `sort_it_out`, `match_the_following`) |
| `question_code`| `VARCHAR(32)` | No | | Answered question code |
| `selected_option`| `VARCHAR(50)` | No | | Option chosen by player |
| `is_correct` | `BOOLEAN` | No | Default: `FALSE` | Grading result |
| `time_taken_ms`| `INT` | No | Default: `0` | Reaction time in milliseconds |
| `points_awarded`| `INT` | No | Default: `0` | Points given |
| `coins_awarded` | `INT` | No | Default: `0` | Coins earned |
| `answered_at` | `TIMESTAMPTZ` | No | Default: `CURRENT_TIMESTAMP` | Submission timestamp |

---

## 9. Table: `wallet_ledger`

Append-only financial transaction ledger.

| Column Name | Data Type | Nullable | Constraints / Defaults | Description |
|-------------|-----------|----------|------------------------|-------------|
| `id` | `UUID` | No | `PRIMARY KEY`, Default `gen_random_uuid()` | Ledger transaction ID |
| `client_id` | `INT` | No | `REFERENCES clients(id) ON DELETE CASCADE` | Player wallet |
| `transaction_type` | `VARCHAR(50)` | No | | Type (e.g. `quiz_reward`, `power_up_purchase`) |
| `direction` | `VARCHAR(10)` | No | Default: `'credit'` | `'credit'` or `'debit'` |
| `amount` | `INT` | No | | Transaction value |
| `currency` | `VARCHAR(20)` | No | | Currency (`coins`, `gems`, `experience`) |
| `balance_after` | `INT` | No | Default: `0` | Wallet balance after transaction |
| `reference_id` | `VARCHAR(64)` | Yes | | Associated game session or order ID |
| `created_at` | `TIMESTAMPTZ` | No | Default: `CURRENT_TIMESTAMP` | Transaction timestamp |

---

## 10. Table: `data_pipeline_runs`

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
