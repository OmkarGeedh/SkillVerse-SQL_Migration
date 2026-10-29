-- Game content, owned by `game-db seed`; the backend only reads it.
-- Every question row carries its subject code and chapter number directly, and its
-- question_code is the primary key, so there are no surrogate ids and no joins.
-- (subject, chapter_no) INCLUDE (question_code) makes code sampling an index-only scan.

-- Chapter titles live in subjects.chapters: {"1": "Journal", "2": "Ledger", ...}.
CREATE TABLE subjects (
    code       varchar(32) PRIMARY KEY CHECK (code ~ '^[a-z0-9_]+$'),  -- API topic_id
    short_code varchar(8)  NOT NULL UNIQUE CHECK (short_code ~ '^[a-z0-9]+$'),
    grade      smallint    NOT NULL CHECK (grade BETWEEN 1 AND 12),
    name       nonblank_t  NOT NULL,
    sort_order smallint    NOT NULL DEFAULT 0,
    chapters   jsonb       NOT NULL DEFAULT '{}' CHECK (jsonb_typeof(chapters) = 'object')
);

-- MCQ: four options.
CREATE TABLE mcq_questions (
    question_code  question_code_t PRIMARY KEY,
    subject        varchar(32) NOT NULL REFERENCES subjects (code) ON DELETE CASCADE,
    chapter_no     smallint NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    prompt         nonblank_t NOT NULL,
    option_a       nonblank_t NOT NULL,
    option_b       nonblank_t NOT NULL,
    option_c       nonblank_t NOT NULL,
    option_d       nonblank_t NOT NULL,
    correct_option char(1) NOT NULL CHECK (correct_option IN ('a', 'b', 'c', 'd')),
    difficulty     difficulty_t NOT NULL,
    hint           text,
    explanation    text,
    CHECK (option_a NOT IN (option_b, option_c, option_d)
       AND option_b NOT IN (option_c, option_d)
       AND option_c <> option_d)
);
CREATE INDEX idx_mcq_questions_chapter ON mcq_questions (subject, chapter_no) INCLUDE (question_code);

-- Sudden Death: two options, first wrong answer ends the run.
CREATE TABLE sudden_death_questions (
    question_code  question_code_t PRIMARY KEY,
    subject        varchar(32) NOT NULL REFERENCES subjects (code) ON DELETE CASCADE,
    chapter_no     smallint NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    prompt         nonblank_t NOT NULL,
    option_a       nonblank_t NOT NULL,
    option_b       nonblank_t NOT NULL,
    correct_option char(1) NOT NULL CHECK (correct_option IN ('a', 'b')),
    difficulty     difficulty_t NOT NULL,
    hint           text,
    explanation    text,
    CHECK (option_a <> option_b)
);
CREATE INDEX idx_sudden_death_questions_chapter ON sudden_death_questions (subject, chapter_no) INCLUDE (question_code);

-- Sort It Out: one row per item. Items of a game share a set_code, which fixes the
-- item type and the two buckets the player swipes between.
CREATE TABLE sort_it_out_questions (
    question_code  question_code_t PRIMARY KEY,
    subject        varchar(32) NOT NULL REFERENCES subjects (code) ON DELETE CASCADE,
    chapter_no     smallint NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    set_code       question_code_t NOT NULL,
    item_type      nonblank_t NOT NULL,
    bucket_a       nonblank_t NOT NULL,
    bucket_b       nonblank_t NOT NULL,
    prompt         nonblank_t NOT NULL,
    correct_bucket char(1) NOT NULL CHECK (correct_bucket IN ('a', 'b')),
    difficulty     difficulty_t NOT NULL,
    explanation    text,
    CHECK (bucket_a <> bucket_b)
);
CREATE INDEX idx_sort_it_out_questions_set ON sort_it_out_questions (subject, chapter_no, set_code) INCLUDE (question_code);

-- Match the Following: one row per left/right pair. The backend shuffles a chapter's
-- pairs into boards at game time, so there is no stored board.
CREATE TABLE match_pairs (
    question_code question_code_t PRIMARY KEY,
    subject       varchar(32) NOT NULL REFERENCES subjects (code) ON DELETE CASCADE,
    chapter_no    smallint NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    left_text     nonblank_t NOT NULL,
    right_text    nonblank_t NOT NULL,
    difficulty    difficulty_t NOT NULL
);
CREATE INDEX idx_match_pairs_chapter ON match_pairs (subject, chapter_no) INCLUDE (question_code);

-- Per subject/chapter/mode question counts for topic pickers and learning mode.
-- Chapters with no content in a mode have no row for it. Match counts pairs.
CREATE VIEW v_content_counts AS
WITH counts AS (
    SELECT subject, chapter_no, 'mcq'::game_mode_t AS game_mode, count(*) AS question_count
    FROM mcq_questions GROUP BY subject, chapter_no
    UNION ALL
    SELECT subject, chapter_no, 'sudden_death', count(*) FROM sudden_death_questions GROUP BY subject, chapter_no
    UNION ALL
    SELECT subject, chapter_no, 'sort_it_out', count(*) FROM sort_it_out_questions GROUP BY subject, chapter_no
    UNION ALL
    SELECT subject, chapter_no, 'match_the_following', count(*) FROM match_pairs GROUP BY subject, chapter_no
)
SELECT s.code AS topic_id, s.name AS subject_name, s.grade, s.sort_order,
       k.chapter_no, coalesce(s.chapters ->> k.chapter_no::text, 'Chapter ' || k.chapter_no) AS chapter_title,
       k.game_mode, k.question_count::int AS question_count
FROM counts k
JOIN subjects s ON s.code = k.subject;
