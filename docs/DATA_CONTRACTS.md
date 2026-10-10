# SkillVerse Data Contracts

Formal specification of data quality rules, ingestion schema contracts, and validation SLAs.

---

## 1. Questions Data Contract

Every question record ingested via JSON or CSV must adhere to the following contract rules:

### Schema Specification
```json
{
  "type": "object",
  "required": [
    "question_code",
    "question_type",
    "topic_id",
    "prompt",
    "option_a",
    "option_b",
    "correct_option",
    "difficulty",
    "points"
  ],
  "properties": {
    "question_code": {
      "type": "string",
      "minLength": 1,
      "description": "Unique business identifier"
    },
    "question_type": {
      "type": "string",
      "enum": ["mcq", "sudden_death"],
      "description": "Game mode type"
    },
    "topic_id": {
      "type": "string",
      "minLength": 1,
      "description": "Topic or subject key"
    },
    "prompt": {
      "type": "string",
      "minLength": 5,
      "description": "Question prompt text"
    },
    "option_a": { "type": "string", "minLength": 1 },
    "option_b": { "type": "string", "minLength": 1 },
    "option_c": { "type": "string" },
    "option_d": { "type": "string" },
    "correct_option": {
      "type": "string",
      "enum": ["A", "B", "C", "D"],
      "description": "Letter of the correct option"
    },
    "difficulty": {
      "type": "integer",
      "minimum": 1,
      "maximum": 5
    },
    "points": {
      "type": "integer",
      "minimum": 1
    },
    "hint": { "type": "string" },
    "explanation": { "type": "string" }
  }
}
```

### Business Invariants & Ingestion Rules

1. **Uniqueness**: `question_code` must be unique across the entire platform. Duplicate codes cause immediate pipeline failure.
2. **Sudden Death Mode Contract**:
   - `question_type` must be `"sudden_death"`.
   - `option_c` and `option_d` MUST be empty or null.
   - `correct_option` must be `"A"` or `"B"`.
3. **MCQ Mode Contract**:
   - `option_a`, `option_b`, `option_c`, `option_d` must be non-empty.
   - `correct_option` must be one of `"A"`, `"B"`, `"C"`, or `"D"`.
4. **Option Distinctness**: Within a single question, all provided options must have distinct text (e.g. `option_a != option_b`).
5. **Idempotence**: Re-ingesting an existing `question_code` must update attributes without altering surrogate primary keys.

---

## 2. Ingestion Format Contracts

### Supported Ingestion Formats
1. **JSON Seeds**: `seeds/questions/<topic>/*.json` with top-level `{"questions": [...]}` array.
2. **CSV / Sheets Dumps**: `Sheets Dump/*.csv` with standardized header row:
   ```csv
   question_code,question_type,topic_id,prompt,option_a,option_b,option_c,option_d,correct_option,difficulty,points,hint,explanation
   ```

### Quality Assurance Gate in CI/CD
In pull requests and automated deployments:
- `game-db dq`: Returns exit code `0` on 100% test pass; returns exit code `1` on any failure.
- `game-db profile`: Prints dataset distribution metrics to build logs for verification.
