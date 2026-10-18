-- Migration: 000002_create_profiles_and_wallet.down.sql
-- Description: Revert client_profiles, client_streak_activities, and wallet_ledger tables

DROP TABLE IF EXISTS wallet_ledger CASCADE;
DROP TABLE IF EXISTS client_streak_activities CASCADE;
DROP TABLE IF EXISTS client_profiles CASCADE;
