-- API-shaped read model. The backend reads these views; it never needs to know
-- how subjects/chapters/sets are normalized underneath. `topic_id` = subjects.code.

CREATE VIEW v_mcq_questions AS
SELECT q.question_code, s.code AS topic_id, c.chapter_no,
       q.prompt, q.option_a, q.option_b, q.option_c, q.option_d, q.correct_option,
       q.difficulty, q.points, q.hint, q.explanation
FROM mcq_questions q
JOIN chapters c ON c.id = q.chapter_id
JOIN subjects s ON s.id = c.subject_id;

CREATE VIEW v_sudden_death_questions AS
SELECT q.question_code, s.code AS topic_id, c.chapter_no,
       q.prompt, q.option_a, q.option_b, q.correct_option,
       q.difficulty, q.points, q.hint, q.explanation
FROM sudden_death_questions q
JOIN chapters c ON c.id = q.chapter_id
JOIN subjects s ON s.id = c.subject_id;

CREATE VIEW v_sort_it_out_questions AS
SELECT i.question_code, s.code AS topic_id, c.chapter_no,
       st.set_code AS pair_type, st.item_type,
       i.prompt, st.bucket_a AS option_a, st.bucket_b AS option_b, i.correct_bucket AS correct_option,
       i.difficulty, i.points, i.explanation
FROM sort_it_out_items i
JOIN sort_it_out_sets st ON st.id = i.set_id
JOIN chapters c ON c.id = st.chapter_id
JOIN subjects s ON s.id = c.subject_id;

CREATE VIEW v_match_boards AS
SELECT b.id, b.question_code, s.code AS topic_id, c.chapter_no,
       b.prompt, b.difficulty, b.points, b.hint, b.explanation
FROM match_boards b
JOIN chapters c ON c.id = b.chapter_id
JOIN subjects s ON s.id = c.subject_id;

-- Per subject/chapter/mode question counts for topic pickers and learning mode.
-- Chapters with no content in a mode simply have no row for it.
CREATE VIEW v_content_counts AS
WITH counts AS (
    SELECT chapter_id, 'mcq'::game_mode_t AS game_mode, count(*) AS question_count
    FROM mcq_questions GROUP BY chapter_id
    UNION ALL
    SELECT chapter_id, 'sudden_death', count(*) FROM sudden_death_questions GROUP BY chapter_id
    UNION ALL
    SELECT st.chapter_id, 'sort_it_out', count(*)
    FROM sort_it_out_items i JOIN sort_it_out_sets st ON st.id = i.set_id GROUP BY st.chapter_id
    UNION ALL
    SELECT chapter_id, 'match_the_following', count(*) FROM match_boards GROUP BY chapter_id
)
SELECT s.code AS topic_id, s.name AS subject_name, s.grade, s.sort_order,
       c.chapter_no, c.title AS chapter_title,
       k.game_mode, k.question_count::int AS question_count
FROM counts k
JOIN chapters c ON c.id = k.chapter_id
JOIN subjects s ON s.id = c.subject_id;
