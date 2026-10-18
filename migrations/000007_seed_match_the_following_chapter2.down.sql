-- Migration: 000007_seed_match_the_following_chapter2.down.sql
-- Description: Rollback Chapter 2 Match the Following questions and pairs

DELETE FROM match_pairs
WHERE question_id IN (
    SELECT id FROM match_the_following_questions
    WHERE question_code >= 'mtf_acc_011' AND question_code <= 'mtf_acc_025'
);

DELETE FROM match_the_following_questions
WHERE question_code >= 'mtf_acc_011' AND question_code <= 'mtf_acc_025';
