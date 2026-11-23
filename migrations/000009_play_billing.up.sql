-- Google Play Billing: coin/gem packs (consumable in-app products) and the
-- Premium subscription. The backend is the only writer: it verifies every
-- purchase token with the Google Play Developer API before anything is granted.
--
-- Security rules the schema enforces:
--   * purchase_token is UNIQUE, so one paid purchase can be granted once, to one
--     player, however many times (or from however many accounts) it is sent.
--   * Granted amounts are copied onto the purchase row, so a refund takes back
--     exactly what was given even if the catalog changes later.
--   * The audit log never stores raw purchase tokens, only their SHA-256.

-- Catalog of what can be bought. Ids must match the product ids created in
-- Play Console (Monetize > Products). Prices live in Play, never here.
CREATE TABLE billing_products (
    product_id varchar(64) PRIMARY KEY CHECK (product_id ~ '^[a-z0-9_.]{1,64}$'),
    kind       varchar(20) NOT NULL CHECK (kind IN ('consumable', 'subscription')),
    title      varchar(80) NOT NULL,
    coins      integer NOT NULL DEFAULT 0 CHECK (coins >= 0 AND coins <= 1000000),
    gems       integer NOT NULL DEFAULT 0 CHECK (gems >= 0 AND gems <= 100000),
    active     boolean NOT NULL DEFAULT true,
    sort_order integer NOT NULL DEFAULT 0,
    -- A pack must give something; a subscription gives an entitlement, not currency.
    CHECK ((kind = 'consumable' AND coins + gems > 0) OR (kind = 'subscription' AND coins = 0 AND gems = 0))
);

-- One row per verified one-time purchase (coin/gem packs).
CREATE TABLE play_purchases (
    id             uuid PRIMARY KEY DEFAULT uuidv7(),
    client_id      integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    product_id     varchar(64) NOT NULL REFERENCES billing_products (product_id),
    purchase_token varchar(512) NOT NULL UNIQUE,
    order_id       varchar(64) NOT NULL DEFAULT '',
    quantity       integer NOT NULL DEFAULT 1 CHECK (quantity > 0),
    coins          integer NOT NULL DEFAULT 0 CHECK (coins >= 0),   -- what was granted
    gems           integer NOT NULL DEFAULT 0 CHECK (gems >= 0),
    state          varchar(20) NOT NULL DEFAULT 'granted' CHECK (state IN ('granted', 'revoked')),
    consumed       boolean NOT NULL DEFAULT false,                  -- consumed with Google
    test_purchase  boolean NOT NULL DEFAULT false,
    purchased_at   timestamptz NOT NULL,
    created_at     timestamptz NOT NULL DEFAULT now(),
    revoked_at     timestamptz
);

CREATE INDEX idx_play_purchases_client_created ON play_purchases (client_id, created_at DESC);
-- The sweeper retries consuming granted purchases Google has not confirmed yet.
CREATE INDEX idx_play_purchases_unconsumed ON play_purchases (created_at) WHERE NOT consumed AND state = 'granted';

-- One row per subscription purchase token. Renewals keep the same token; an
-- upgrade or resubscribe creates a new token whose linked_purchase_token points
-- at the old one, which is then marked 'superseded'.
CREATE TABLE client_subscriptions (
    purchase_token        varchar(512) PRIMARY KEY,
    client_id             integer NOT NULL REFERENCES clients (id) ON DELETE CASCADE,
    product_id            varchar(64) NOT NULL REFERENCES billing_products (product_id),
    linked_purchase_token varchar(512),
    status                varchar(20) NOT NULL CHECK (status IN (
                              'active', 'in_grace', 'on_hold', 'paused', 'canceled',
                              'expired', 'pending', 'revoked', 'superseded')),
    expires_at            timestamptz,
    auto_renewing         boolean NOT NULL DEFAULT false,
    acknowledged          boolean NOT NULL DEFAULT false,
    latest_order_id       varchar(64) NOT NULL DEFAULT '',
    test_purchase         boolean NOT NULL DEFAULT false,
    created_at            timestamptz NOT NULL DEFAULT now(),
    updated_at            timestamptz NOT NULL DEFAULT now()
);

-- "Is this player Premium?" reads the player's newest subscriptions.
CREATE INDEX idx_client_subscriptions_client_expires ON client_subscriptions (client_id, expires_at DESC);
CREATE INDEX idx_client_subscriptions_unacknowledged ON client_subscriptions (updated_at) WHERE NOT acknowledged;

-- Append-only record of every verify, grant, refund, rejection and notification.
-- A 'shortfall' result marks an account to review (refund larger than balance).
CREATE TABLE billing_audit (
    id                  bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id           integer REFERENCES clients (id) ON DELETE SET NULL,
    purchase_token_hash char(64) NOT NULL DEFAULT '',   -- hex SHA-256, never the token
    product_id          varchar(64) NOT NULL DEFAULT '',
    action              varchar(20) NOT NULL,           -- verify, grant, consume, refund, rtdn, ...
    result              varchar(20) NOT NULL,           -- ok, rejected, fraud, shortfall, error, ...
    reason              varchar(200) NOT NULL DEFAULT '',
    created_at          timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_billing_audit_client_created ON billing_audit (client_id, created_at DESC);
CREATE INDEX idx_billing_audit_token ON billing_audit (purchase_token_hash);
CREATE INDEX idx_billing_audit_result ON billing_audit (result, created_at DESC) WHERE result IN ('fraud', 'shortfall');

-- Pub/Sub can deliver a notification more than once; each message is handled once.
CREATE TABLE billing_rtdn_messages (
    message_id  varchar(100) PRIMARY KEY,
    received_at timestamptz NOT NULL DEFAULT now()
);
