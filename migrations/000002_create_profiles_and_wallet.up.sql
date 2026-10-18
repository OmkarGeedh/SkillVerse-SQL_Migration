-- Migration: 000002_create_profiles_and_wallet.up.sql
-- Description: Create client_profiles, client_streak_activities, and wallet_ledger tables

CREATE TABLE IF NOT EXISTS client_profiles (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL UNIQUE REFERENCES clients(id) ON DELETE CASCADE,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    avatar_id VARCHAR(50) NOT NULL DEFAULT 'user',
    avatar_url VARCHAR(255),
    class VARCHAR(50),
    board VARCHAR(100),
    subjects TEXT DEFAULT '[]',
    is_onboarded BOOLEAN NOT NULL DEFAULT FALSE,
    coins INT NOT NULL DEFAULT 100,
    gems INT NOT NULL DEFAULT 10,
    experience INT NOT NULL DEFAULT 0,
    level INT NOT NULL DEFAULT 1,
    current_streak INT NOT NULL DEFAULT 1,
    highest_streak INT NOT NULL DEFAULT 1,
    last_active_date DATE,
    weekly_score INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_client_profiles_onboarded ON client_profiles(is_onboarded);
CREATE INDEX IF NOT EXISTS idx_client_profiles_weekly_score ON client_profiles(weekly_score DESC);

CREATE TABLE IF NOT EXISTS client_streak_activities (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
    activity_date VARCHAR(10) NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_client_streak_activity UNIQUE (client_id, activity_date)
);

CREATE INDEX IF NOT EXISTS idx_client_streak_activities_client_id ON client_streak_activities(client_id);

CREATE TABLE IF NOT EXISTS wallet_ledger (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id INT NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
    transaction_type VARCHAR(50) NOT NULL,
    direction VARCHAR(10) NOT NULL DEFAULT 'credit',
    amount INT NOT NULL,
    currency VARCHAR(20) NOT NULL,
    balance_after INT NOT NULL DEFAULT 0,
    reference_id VARCHAR(64),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_wallet_ledger_client ON wallet_ledger(client_id);
CREATE INDEX IF NOT EXISTS idx_wallet_ledger_client_created ON wallet_ledger(client_id, created_at);
