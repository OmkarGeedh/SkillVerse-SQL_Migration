-- Spin wheel: weighted segments (odds as integer parts per million), earned-spin
-- balance, an idempotent spin ledger and the stored result of every spin.

CREATE TABLE spin_wheel_segments (
    segment_code varchar(20) PRIMARY KEY,
    currency     varchar(20) NOT NULL CHECK (currency IN ('coins', 'gems')),
    amount       integer NOT NULL CHECK (amount > 0 AND amount <= 100000),
    weight_ppm   integer NOT NULL CHECK (weight_ppm > 0 AND weight_ppm <= 1000000),  -- 5000 = 0.5%
    is_jackpot   boolean NOT NULL DEFAULT false,
    sort_order   integer NOT NULL DEFAULT 0,
    active       boolean NOT NULL DEFAULT true
);

ALTER TABLE clients ADD COLUMN spins integer NOT NULL DEFAULT 0 CHECK (spins >= 0);

-- Append-only. UNIQUE makes every grant idempotent (e.g. one grant per game session).
CREATE TABLE spin_ledger (
    id           uuid PRIMARY KEY DEFAULT uuidv7(),
    client_id    integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    delta        integer NOT NULL CHECK (delta <> 0),
    reason       varchar(50) NOT NULL,
    reference_id varchar(64) NOT NULL,
    created_at   timestamptz NOT NULL DEFAULT now(),
    UNIQUE (client_id, reason, reference_id)
);

-- One row per spin; amount/currency are the values paid at the time of the win.
CREATE TABLE spin_results (
    id              uuid PRIMARY KEY DEFAULT uuidv7(),
    client_id       integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    idempotency_key varchar(64) NOT NULL,
    segment_code    varchar(20) NOT NULL REFERENCES spin_wheel_segments (segment_code),
    currency        varchar(20) NOT NULL CHECK (currency IN ('coins', 'gems')),
    amount          integer NOT NULL CHECK (amount > 0),
    created_at      timestamptz NOT NULL DEFAULT now(),
    UNIQUE (client_id, idempotency_key)
);

CREATE INDEX idx_spin_results_segment ON spin_results (segment_code);
