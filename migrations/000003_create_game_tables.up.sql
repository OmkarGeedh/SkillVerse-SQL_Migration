-- Migration: 000003_create_game_tables.up.sql
-- Description: Create dedicated question tables (mcq_questions, sort_it_out_questions, match_the_following_questions, match_pairs) and user_question_history

-- 1. MCQ questions table (for standard MCQ and Sudden Death modes)
CREATE TABLE IF NOT EXISTS mcq_questions (
    id VARCHAR(36) PRIMARY KEY DEFAULT gen_random_uuid()::text,
    question_code VARCHAR(64) UNIQUE NOT NULL,
    question_type VARCHAR(32) NOT NULL DEFAULT 'mcq',
    topic_id VARCHAR(64) NOT NULL,
    prompt TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL DEFAULT '',
    option_d TEXT NOT NULL DEFAULT '',
    correct_option VARCHAR(10) NOT NULL,
    difficulty INT NOT NULL DEFAULT 1,
    points INT NOT NULL DEFAULT 10,
    hint TEXT,
    explanation TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_mcq_questions_topic_id ON mcq_questions (topic_id);
CREATE INDEX IF NOT EXISTS idx_mcq_questions_topic_diff ON mcq_questions (topic_id, difficulty);
CREATE INDEX IF NOT EXISTS idx_mcq_questions_type ON mcq_questions (question_type);

-- 2. Sort It Out questions table
CREATE TABLE IF NOT EXISTS sort_it_out_questions (
    id VARCHAR(36) PRIMARY KEY DEFAULT gen_random_uuid()::text,
    question_code VARCHAR(64) UNIQUE NOT NULL,
    topic_id VARCHAR(64) NOT NULL,
    pair_type VARCHAR(64) NOT NULL,
    prompt TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    correct_option VARCHAR(10) NOT NULL,
    difficulty INT NOT NULL DEFAULT 1,
    points INT NOT NULL DEFAULT 10,
    hint TEXT,
    explanation TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_sort_it_out_topic_id ON sort_it_out_questions (topic_id);
CREATE INDEX IF NOT EXISTS idx_sort_it_out_topic_diff ON sort_it_out_questions (topic_id, difficulty);

-- 3. Match the Following questions table
CREATE TABLE IF NOT EXISTS match_the_following_questions (
    id VARCHAR(36) PRIMARY KEY DEFAULT gen_random_uuid()::text,
    question_code VARCHAR(64) UNIQUE NOT NULL,
    topic_id VARCHAR(64) NOT NULL,
    prompt TEXT NOT NULL,
    time_limit_sec INT NOT NULL DEFAULT 25,
    difficulty INT NOT NULL DEFAULT 1,
    points INT NOT NULL DEFAULT 40,
    hint TEXT,
    explanation TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_mtf_topic_id ON match_the_following_questions (topic_id);
CREATE INDEX IF NOT EXISTS idx_mtf_topic_diff ON match_the_following_questions (topic_id, difficulty);

-- 4. Match Pairs table
CREATE TABLE IF NOT EXISTS match_pairs (
    id VARCHAR(36) PRIMARY KEY DEFAULT gen_random_uuid()::text,
    question_id VARCHAR(36) NOT NULL REFERENCES match_the_following_questions(id) ON DELETE CASCADE,
    pair_order INT NOT NULL DEFAULT 1,
    left_text TEXT NOT NULL,
    right_text TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_match_pairs_question_id ON match_pairs (question_id);

-- 5. User question history table (immutable audit ledger of all answers submitted)
CREATE TABLE IF NOT EXISTS user_question_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id INT NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
    session_id UUID NOT NULL,
    game_mode VARCHAR(32) NOT NULL DEFAULT 'mcq',
    question_code VARCHAR(32) NOT NULL,
    selected_option VARCHAR(50) NOT NULL,
    is_correct BOOLEAN NOT NULL DEFAULT FALSE,
    time_taken_ms INT NOT NULL DEFAULT 0,
    points_awarded INT NOT NULL DEFAULT 0,
    coins_awarded INT NOT NULL DEFAULT 0,
    answered_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_uqh_client ON user_question_history(client_id);
CREATE INDEX IF NOT EXISTS idx_uqh_session ON user_question_history(session_id);
CREATE INDEX IF NOT EXISTS idx_uqh_session_question ON user_question_history(session_id, question_code);
CREATE INDEX IF NOT EXISTS idx_uqh_client_answered ON user_question_history(client_id, answered_at);
