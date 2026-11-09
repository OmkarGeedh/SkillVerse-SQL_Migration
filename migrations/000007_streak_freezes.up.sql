-- Streak freezes: protective items a player buys with gems. One is used up
-- automatically for each missed day, so a short break does not reset the streak.
-- The balance lives on the player's row (like spins); buying and using one is
-- done in a single statement by the backend, so the CHECK can never be violated.

ALTER TABLE clients ADD COLUMN streak_freezes integer NOT NULL DEFAULT 0 CHECK (streak_freezes >= 0);
