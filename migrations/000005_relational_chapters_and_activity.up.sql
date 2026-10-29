-- Replace the jsonb chapter map and the active_days array with relational tables.
-- Natural keys only: a chapter is (subject, chapter_no); an activity day is (client_id, day).

CREATE TABLE chapters (
    subject    varchar(32) NOT NULL REFERENCES subjects (code) ON DELETE CASCADE,
    chapter_no smallint    NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    title      nonblank_t  NOT NULL,
    PRIMARY KEY (subject, chapter_no)
);

INSERT INTO chapters (subject, chapter_no, title)
SELECT s.code, c.key::smallint, c.value
FROM subjects s, jsonb_each_text(s.chapters) AS c;

-- Every question belongs to a real chapter. The (subject, chapter_no) prefix of each
-- table's chapter index already serves these foreign keys.
ALTER TABLE mcq_questions
    ADD FOREIGN KEY (subject, chapter_no) REFERENCES chapters (subject, chapter_no) ON DELETE CASCADE;
ALTER TABLE sudden_death_questions
    ADD FOREIGN KEY (subject, chapter_no) REFERENCES chapters (subject, chapter_no) ON DELETE CASCADE;
ALTER TABLE sort_it_out_questions
    ADD FOREIGN KEY (subject, chapter_no) REFERENCES chapters (subject, chapter_no) ON DELETE CASCADE;
ALTER TABLE match_pairs
    ADD FOREIGN KEY (subject, chapter_no) REFERENCES chapters (subject, chapter_no) ON DELETE CASCADE;

-- One row per day a player finished a game (drives the 7-day streak strip).
CREATE TABLE client_activity_days (
    client_id integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    day       date    NOT NULL,
    PRIMARY KEY (client_id, day)
);

INSERT INTO client_activity_days (client_id, day)
SELECT c.id, d FROM clients c, unnest(c.active_days) AS d
ON CONFLICT DO NOTHING;

DROP VIEW v_content_counts;
ALTER TABLE subjects DROP COLUMN chapters;
ALTER TABLE clients DROP COLUMN active_days;

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
       c.chapter_no, c.title AS chapter_title,
       k.game_mode, k.question_count::int AS question_count
FROM counts k
JOIN chapters c ON c.subject = k.subject AND c.chapter_no = k.chapter_no
JOIN subjects s ON s.code = c.subject;
