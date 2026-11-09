-- Product analytics: a small append-only log of what the app reports that the
-- server cannot see for itself (app opens, reminder choices, quitting a game
-- half way). Games, rewards and purchases are already in leaderboard_game_results
-- and wallet_ledger, and active days in client_activity_days, so they are not
-- repeated here. No personal data: a player id, an event name and a few small
-- details. Deleting a player deletes their events.

CREATE TABLE analytics_events (
    id          bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id   integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    name        varchar(40) NOT NULL,
    props       jsonb NOT NULL DEFAULT '{}'::jsonb,
    occurred_at timestamptz NOT NULL,                 -- when the app says it happened
    received_at timestamptz NOT NULL DEFAULT now()    -- when the server stored it
);

-- Reports count one event name over a time window, or one player's history.
CREATE INDEX idx_analytics_events_name_time ON analytics_events (name, occurred_at);
CREATE INDEX idx_analytics_events_client_time ON analytics_events (client_id, occurred_at);
