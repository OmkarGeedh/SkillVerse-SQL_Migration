-- Migration: 000004_create_game_sessions_and_wallet.down.sql
-- Description: Drop wallet_ledger, user_question_history, game_sessions, streak_activities, and client_profiles

DROP TABLE IF EXISTS wallet_ledger CASCADE;
DROP TABLE IF EXISTS user_question_history CASCADE;
DROP TABLE IF EXISTS game_sessions CASCADE;
DROP TABLE IF EXISTS client_streak_activities CASCADE;
DROP TABLE IF EXISTS client_profiles CASCADE;
