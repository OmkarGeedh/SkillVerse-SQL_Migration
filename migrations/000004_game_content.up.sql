-- One table per game. Content is fully owned by `game-db seed`; the backend only reads it.
-- Each question table indexes (chapter_id) INCLUDE (question_code) so code sampling
-- for a subject/chapter is an index-only scan.

-- MCQ: four options.
CREATE TABLE mcq_questions (
    id             integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_code  question_code_t NOT NULL UNIQUE,
    chapter_id     smallint NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    prompt         nonblank_t NOT NULL,
    option_a       nonblank_t NOT NULL,
    option_b       nonblank_t NOT NULL,
    option_c       nonblank_t NOT NULL,
    option_d       nonblank_t NOT NULL,
    correct_option char(1) NOT NULL CHECK (correct_option IN ('a', 'b', 'c', 'd')),
    difficulty     difficulty_t NOT NULL,
    points         points_t NOT NULL,
    hint           text,
    explanation    text,
    CHECK (option_a NOT IN (option_b, option_c, option_d)
       AND option_b NOT IN (option_c, option_d)
       AND option_c <> option_d)
);
CREATE INDEX idx_mcq_questions_chapter ON mcq_questions (chapter_id) INCLUDE (question_code);

-- Sudden Death: two options, first wrong answer ends the run.
CREATE TABLE sudden_death_questions (
    id             integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_code  question_code_t NOT NULL UNIQUE,
    chapter_id     smallint NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    prompt         nonblank_t NOT NULL,
    option_a       nonblank_t NOT NULL,
    option_b       nonblank_t NOT NULL,
    correct_option char(1) NOT NULL CHECK (correct_option IN ('a', 'b')),
    difficulty     difficulty_t NOT NULL,
    points         points_t NOT NULL,
    hint           text,
    explanation    text,
    CHECK (option_a <> option_b)
);
CREATE INDEX idx_sudden_death_questions_chapter ON sudden_death_questions (chapter_id) INCLUDE (question_code);

-- Sort It Out: a set defines the two buckets once; items are swiped into one of them.
CREATE TABLE sort_it_out_sets (
    id         integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    set_code   question_code_t NOT NULL UNIQUE,
    chapter_id smallint NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    item_type  nonblank_t NOT NULL,
    bucket_a   nonblank_t NOT NULL,
    bucket_b   nonblank_t NOT NULL,
    CHECK (bucket_a <> bucket_b)
);
CREATE INDEX idx_sort_it_out_sets_chapter ON sort_it_out_sets (chapter_id);

CREATE TABLE sort_it_out_items (
    id             integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_code  question_code_t NOT NULL UNIQUE,
    set_id         integer NOT NULL REFERENCES sort_it_out_sets (id) ON DELETE CASCADE,
    prompt         nonblank_t NOT NULL,
    correct_bucket char(1) NOT NULL CHECK (correct_bucket IN ('a', 'b')),
    difficulty     difficulty_t NOT NULL,
    points         points_t NOT NULL,
    explanation    text
);
CREATE INDEX idx_sort_it_out_items_set ON sort_it_out_items (set_id) INCLUDE (question_code);

-- Match the Following: a board with N ordered left/right pairs.
CREATE TABLE match_boards (
    id            integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_code question_code_t NOT NULL UNIQUE,
    chapter_id    smallint NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    prompt        nonblank_t NOT NULL,
    difficulty    difficulty_t NOT NULL,
    points        points_t NOT NULL,
    hint          text,
    explanation   text
);
CREATE INDEX idx_match_boards_chapter ON match_boards (chapter_id) INCLUDE (question_code);

CREATE TABLE match_pairs (
    board_id   integer  NOT NULL REFERENCES match_boards (id) ON DELETE CASCADE,
    pair_order smallint NOT NULL CHECK (pair_order >= 1),
    left_text  nonblank_t NOT NULL,
    right_text nonblank_t NOT NULL,
    PRIMARY KEY (board_id, pair_order)
);
