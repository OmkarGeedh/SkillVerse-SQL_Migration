-- Migration: 000003_create_game_tables.down.sql
-- Description: Revert dedicated question tables and user_question_history

DROP TABLE IF EXISTS user_question_history CASCADE;
DROP TABLE IF EXISTS match_pairs CASCADE;
DROP TABLE IF EXISTS match_the_following_questions CASCADE;
DROP TABLE IF EXISTS sort_it_out_questions CASCADE;
DROP TABLE IF EXISTS mcq_questions CASCADE;
