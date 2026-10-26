-- Migration: 000009_seed_maths_questions.down.sql
-- Description: Rollback 140 mental math questions for topic 'maths'

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE topic_id = 'maths');
DELETE FROM match_the_following_questions WHERE topic_id = 'maths';
DELETE FROM sort_it_out_questions WHERE topic_id = 'maths';
DELETE FROM mcq_questions WHERE topic_id = 'maths';
