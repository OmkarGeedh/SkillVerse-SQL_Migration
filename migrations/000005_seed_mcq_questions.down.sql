-- Migration: 000005_seed_mcq_questions.down.sql
-- Description: Revert quiz questions and demo user

DELETE FROM match_pairs;
DELETE FROM match_the_following_questions;
DELETE FROM sort_it_out_questions;
DELETE FROM mcq_questions;
DELETE FROM client_streak_activities WHERE client_id IN (SELECT id FROM clients WHERE email = 'player@example.com');
DELETE FROM client_profiles WHERE client_id IN (SELECT id FROM clients WHERE email = 'player@example.com');
DELETE FROM clients WHERE email = 'player@example.com';
