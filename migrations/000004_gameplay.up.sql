-- Gameplay records written by the backend. question_code is intentionally not a
-- foreign key: history must survive content re-imports that retire a question.

-- One row per answered question (per pair for Match the Following).
CREATE TABLE user_question_history (
    session_id      uuid NOT NULL,
    question_code   question_code_t NOT NULL,
    client_id       integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    game_mode       game_mode_t NOT NULL,
    selected_option varchar(50) NOT NULL,
    is_correct      boolean NOT NULL DEFAULT false,
    time_taken_ms   integer NOT NULL DEFAULT 0 CHECK (time_taken_ms >= 0),
    points_awarded  integer NOT NULL DEFAULT 0,
    coins_awarded   integer NOT NULL DEFAULT 0,
    answered_at     timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (session_id, question_code)
);

CREATE INDEX idx_uqh_client_answered ON user_question_history (client_id, answered_at);

-- One row per finished game.
CREATE TABLE leaderboard_game_results (
    session_id   uuid PRIMARY KEY,
    client_id    integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    topic_id     varchar(32) NOT NULL,
    game_mode    game_mode_t NOT NULL,
    final_score  integer NOT NULL DEFAULT 0,
    completed_at timestamptz NOT NULL
);

-- Every leaderboard query is a completed_at window (optionally filtered by mode/subject)
-- summed per client: covering index => index-only scan.
CREATE INDEX idx_lgr_completed_covering
    ON leaderboard_game_results (completed_at)
    INCLUDE (client_id, final_score, game_mode, topic_id);
