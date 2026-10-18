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
      "enum": ["mcq", "sudden_death", "sort_it_out", "match_the_following"],
      "description": "Game mode type"
    },
    "topic_id": {
      "type": "string",
      "minLength": 1,
      "description": "Topic or subject key"
    },
    "pair_type": {
      "type": "string",
      "description": "Classification pair type for sort_it_out (e.g. credit_debit, asset_liability)"
    },
    "prompt": {
      "type": "string",
      "minLength": 2,
      "description": "Question prompt text"
    },
    "option_a": { "type": "string" },
    "option_b": { "type": "string" },
    "option_c": { "type": "string" },
    "option_d": { "type": "string" },
    "correct_option": {
      "type": "string",
      "description": "Letter of the correct option ('a', 'b', 'c', 'd')"
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
    "explanation": { "type": "string" },
    "match_pairs": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["left_text", "right_text"],
        "properties": {
          "pair_order": { "type": "integer" },
          "left_text": { "type": "string", "minLength": 1 },
          "right_text": { "type": "string", "minLength": 1 }
        }
      }
    }
  }
}
```

---

## 2. Invariant Rules per Game Mode

1. **MCQ (`mcq`)**:
   - `option_a`, `option_b`, `option_c`, `option_d` must be non-empty and unique.
   - `correct_option` must be one of `['a', 'b', 'c', 'd']`.

2. **Sudden Death (`sudden_death`)**:
   - Strictly 2 options (`option_a`, `option_b`).
   - `option_c` and `option_d` must be empty strings.
   - `correct_option` must be `'a'` or `'b'`.

3. **Sort It Out (`sort_it_out`)**:
   - Binary swipe swipe classification with `pair_type` defined.
   - Strictly 2 options (`option_a`, `option_b`).
   - `option_c` and `option_d` must be empty strings.
   - `correct_option` must be `'a'` or `'b'`.

4. **Match The Following (`match_the_following`)**:
   - Minimum 2 matching pairs in `match_pairs`.
   - Each pair must have valid `left_text` and `right_text`.
