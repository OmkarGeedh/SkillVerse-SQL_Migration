# SkillVerse Data Architecture

High-level data engineering architecture, pipeline stages, storage schemas, and downstream consumers.

---

## 1. End-to-End Pipeline Architecture

```mermaid
flowchart TD
    subgraph IngestionSources["1. Raw Data Sources"]
        JSON["JSON Authoring Seeds<br/>(seeds/questions/**/*.json)"]
        CSV["Sheets / CSV Dumps<br/>(Sheets Dump/*.csv)"]
        Users["Demo Users<br/>(seeds/users/*.json)"]
    end

    subgraph DataEngineeringLayer["2. Data Engineering & Quality Layer (game-db)"]
        Extract["Extractor<br/>(Multi-format Parser)"]
        DQGate["Data Quality Gate (DQ)<br/>- test_code_uniqueness<br/>- test_fields_not_null<br/>- test_option_integrity<br/>- test_bounds_and_domains<br/>- test_mode_contracts"]
        Profiler["Dataset Profiler<br/>- Difficulty breakdown<br/>- Mode & topic breakdown<br/>- Word/char NLP stats<br/>- Hint/explanation coverage"]
        Transformer["Transformer & Hasher<br/>- Whitespace normalization<br/>- SHA-256 Checksum"]
        Loader["Batch Upsert Loader<br/>(Dedicated Table Partitioning)"]
    end

    subgraph StorageLayer["3. Target Storage Layer (PostgreSQL 16)"]
        PG_MCQ["mcq_questions (MCQ & Sudden Death)"]
        PG_SIO["sort_it_out_questions (Swipe Game)"]
        PG_MTF["match_the_following_questions & match_pairs"]
        PG_U["clients, client_profiles & client_streak_activities"]
        PG_H["user_question_history & wallet_ledger"]
        PG_A["data_pipeline_runs (Audit & Lineage)"]
        PG_M["schema_migrations (DDL Versions)"]
    end

    subgraph Downstream["4. Downstream Consumers"]
        Backend["Go Gin API Server<br/>(GamifiedQuizApp_digitalHQ)"]
        Mobile["Flutter Mobile App<br/>(Gamified-learning)"]
        Analytics["Analytics / Leaderboard Engine"]
    end

    JSON --> Extract
    CSV --> Extract
    Users --> Extract

    Extract --> DQGate
    DQGate -->|Pass| Transformer
    DQGate -.->|Analysis| Profiler
    Transformer --> Loader

    Loader -->|Upsert MCQs| PG_MCQ
    Loader -->|Upsert Sort It Out| PG_SIO
    Loader -->|Upsert Matching Boards| PG_MTF
    Loader -->|Upsert Demo Accounts| PG_U
    Loader -->|Record Pipeline Run| PG_A

    PG_MCQ --> Backend
    PG_SIO --> Backend
    PG_MTF --> Backend
    PG_U --> Backend
    Backend --> Mobile
    PG_MCQ --> Analytics
```

---

## 2. Pipeline Execution Stages

1. **Extract**: Parses JSON authoring seeds and optional Sheets dumps (`ExtractAllSources`).
2. **Data Quality Gate**: Runs 11 validation checks before any database touch (`quality.RunDataQualitySuite`).
3. **Transform & Fingerprint**: Computes deterministic SHA-256 dataset checksum (`pipeline.ComputeChecksum`).
4. **Idempotent Partitioned Load**: Batch upserts questions into dedicated tables (`mcq_questions`, `sort_it_out_questions`, `match_the_following_questions`, `match_pairs`).
5. **Audit Ledger**: Commits pipeline lineage metrics and duration to `data_pipeline_runs`.
