DROP TABLE IF EXISTS spin_results;
DROP TABLE IF EXISTS spin_ledger;
ALTER TABLE clients DROP COLUMN IF EXISTS spins;
DROP TABLE IF EXISTS spin_wheel_segments;
