-- Migration: 000004_create_pipeline_audit.up.sql
-- Description: Create data_pipeline_runs audit and lineage logging table

CREATE TABLE IF NOT EXISTS data_pipeline_runs (
    run_id VARCHAR(64) PRIMARY KEY,
    pipeline_name VARCHAR(100) NOT NULL,
    source_type VARCHAR(50) NOT NULL,
    records_processed INT NOT NULL DEFAULT 0,
    records_inserted INT NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL,
    duration_ms BIGINT NOT NULL,
    checksum VARCHAR(64),
    error_message TEXT,
    executed_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_pipeline_runs_status ON data_pipeline_runs (status);
CREATE INDEX IF NOT EXISTS idx_pipeline_runs_executed ON data_pipeline_runs (executed_at DESC);
