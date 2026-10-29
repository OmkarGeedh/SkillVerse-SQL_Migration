DROP VIEW IF EXISTS v_content_counts;

ALTER TABLE clients ADD COLUMN active_days date[] NOT NULL DEFAULT ARRAY[CURRENT_DATE];
UPDATE clients c SET active_days = coalesce(
    (SELECT array_agg(a.day ORDER BY a.day) FROM client_activity_days a WHERE a.client_id = c.id), '{}');
DROP TABLE IF EXISTS client_activity_days;

ALTER TABLE subjects ADD COLUMN chapters jsonb NOT NULL DEFAULT '{}' CHECK (jsonb_typeof(chapters) = 'object');
UPDATE subjects s SET chapters = coalesce(
    (SELECT jsonb_object_agg(c.chapter_no::text, c.title) FROM chapters c WHERE c.subject = s.code), '{}');

ALTER TABLE mcq_questions DROP CONSTRAINT IF EXISTS mcq_questions_subject_chapter_no_fkey;
ALTER TABLE sudden_death_questions DROP CONSTRAINT IF EXISTS sudden_death_questions_subject_chapter_no_fkey;
ALTER TABLE sort_it_out_questions DROP CONSTRAINT IF EXISTS sort_it_out_questions_subject_chapter_no_fkey;
ALTER TABLE match_pairs DROP CONSTRAINT IF EXISTS match_pairs_subject_chapter_no_fkey;
DROP TABLE IF EXISTS chapters;

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
