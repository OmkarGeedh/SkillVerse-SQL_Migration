-- Migration: 000004_create_pipeline_audit.down.sql
-- Description: Revert data_pipeline_runs table

DROP TABLE IF EXISTS data_pipeline_runs CASCADE;
