-- Reverses 000010. Destroys ad rewards, power-up tokens and their ledger rows,
-- and topic packs with their purchases (development/staging only).

DROP TABLE IF EXISTS ad_rewards;
DROP TABLE IF EXISTS power_up_uses;
DROP TABLE IF EXISTS client_power_ups;

DROP INDEX IF EXISTS uq_wallet_ledger_server_event;
DROP INDEX IF EXISTS idx_wallet_ledger_type_created;
DROP INDEX IF EXISTS idx_wallet_ledger_client_type_created;
DELETE FROM wallet_ledger WHERE currency IN ('fifty_fifty', 'add_time', 'skip');
ALTER TABLE wallet_ledger DROP CONSTRAINT IF EXISTS wallet_ledger_currency_check;
ALTER TABLE wallet_ledger ADD CONSTRAINT wallet_ledger_currency_check
    CHECK (currency IN ('coins', 'gems', 'experience'));

DROP INDEX IF EXISTS idx_play_purchases_client_product;
DROP TABLE IF EXISTS billing_product_subjects;

DELETE FROM play_purchases WHERE product_id IN (SELECT product_id FROM billing_products WHERE kind = 'non_consumable');
DELETE FROM billing_products WHERE kind = 'non_consumable';
ALTER TABLE billing_products DROP CONSTRAINT IF EXISTS billing_products_grant_check;
ALTER TABLE billing_products DROP CONSTRAINT IF EXISTS billing_products_kind_check;
ALTER TABLE billing_products
    ADD CONSTRAINT billing_products_kind_check CHECK (kind IN ('consumable', 'subscription')),
    ADD CONSTRAINT billing_products_check
        CHECK ((kind = 'consumable' AND coins + gems > 0) OR (kind = 'subscription' AND coins = 0 AND gems = 0));
