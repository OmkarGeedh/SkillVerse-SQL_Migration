-- Migration: 000008_seed_sort_it_out_chapter1.down.sql
-- Description: Rollback Chapter 1 Sort It Out questions

DELETE FROM sort_it_out_questions
WHERE question_code LIKE 'sio_acc_ch1_%';
