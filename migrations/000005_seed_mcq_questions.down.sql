-- Migration: 000005_seed_mcq_questions.down.sql
-- Description: Revert 100 MCQ questions and demo user

DELETE FROM questions WHERE question_type = 'mcq';
DELETE FROM clients WHERE email = 'player@example.com';
