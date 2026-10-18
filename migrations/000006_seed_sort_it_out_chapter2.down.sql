-- Migration: 000006_seed_sort_it_out_chapter2.down.sql
-- Description: Rollback Chapter 2 Sort It Out questions

DELETE FROM sort_it_out_questions
WHERE question_code LIKE 'sio_sort%';
