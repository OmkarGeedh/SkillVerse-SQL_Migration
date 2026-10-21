# Data Quality Bug Report: Missing Hint Column in Chapter 1 Sort It Out CSV

| Field | Details |
| :--- | :--- |
| **Bug ID** | `DQ-BUG-2026-10-001` |
| **Severity** | **Medium** (Non-blocking schema validation, Content Quality degradation) |
| **Component** | Content Ingestion & ETL / `Sheets Dump/11th csv/Sort it out/Accounts/Ch1.csv` |
| **Target Table** | `sort_it_out_questions` (`hint` column) |
| **Reporter** | Antigravity AI Agent & SkillVerse Data Quality Suite |
| **Date** | 2026-10-22 |
| **Status** | **Open / Documented** |

---

## 1. Executive Summary

During ingestion and seeding of `/SkillVerse-SQL_Migration/Sheets Dump/11th csv/Sort it out/Accounts/Ch1.csv`, automated Data Profiling detected a drop in overall platform **Hint Coverage** from **100.0%** to **77.0%** (281 / 365 questions). 

Unlike `mcq_questions` and Chapter 2 `sort_it_out_questions` (which provide pedagogical guidance hints), all 84 items in `Ch1.csv` completely lack a `Hint` column in the source CSV dump.

---

## 2. Source CSV Header Comparison

### Chapter 1 CSV (`Ch1.csv`):
```csv
S.No,Subject,Chapter,Set ID,Item Type,Bucket A,Bucket B,Item,Correct Bucket,Difficulty,Points,Explanation
```
*(12 columns, `Hint` is absent).*

### Expected Standard Content Schema:
```csv
question_code,question_type,topic_id,pair_type,prompt,option_a,option_b,correct_option,difficulty,points,hint,explanation
```

---

## 3. Affected Sets & Question Scope

A total of **84 questions** across **10 classification sets** are currently seeded with `hint = NULL`:

| Set ID | Classification Theme | Bucket A | Bucket B | Total Questions | Current Hint Status |
| :--- | :--- | :--- | :--- | :---: | :---: |
| `SORT-001` | Accounting Function | Book-keeping | Accountancy | 12 | `NULL` |
| `SORT-002` | Accounting Basis Example | Accrual Basis | Cash Basis | 8 | `NULL` |
| `SORT-003` | Transaction Type | Non-Monetary | Monetary | 8 | `NULL` |
| `SORT-004` | Transaction Timing | Cash Transaction | Credit Transaction | 8 | `NULL` |
| `SORT-005` | Expenditure | Capital Expenditure | Revenue Expenditure | 8 | `NULL` |
| `SORT-006` | Discount Type | Cash Discount | Trade Discount | 8 | `NULL` |
| `SORT-007` | Asset Type | Fixed Assets | Current Assets | 8 | `NULL` |
| `SORT-008` | Financial Position Item | Liabilities | Assets | 8 | `NULL` |
| `SORT-009` | Organisation Type | Not-for-Profit Concern | Trading Concern | 8 | `NULL` |
| `SORT-010` | Business Result | Profit | Loss | 8 | `NULL` |
| **Total** | | | | **84** | **100% NULL** |

---

## 4. Impact on Game Client & Platform Experience

1. **In-Game Lifeline / Hint Power-ups**: In the Flutter client (`Gamified-learning`), when users activate the "Hint" power-up on Chapter 1 Sort It Out questions, the UI will have no hint text to render.
2. **Data Completeness SLA**: Platform content quality guidelines stipulate 100% hint and explanation coverage for gamified learning retention.

---

## 5. Recommended Remediation Plan

1. **Option A (Upstream Content Fix - Preferred)**:
   - Request the content author/educator to add a `Hint` column to Google Sheets before exporting subsequent chapters (CH3–CH10).
   - Re-export `Ch1.csv` with 84 curated pedagogical hints.
2. **Option B (ETL Synthetic Hint Rule)**:
   - If human authors cannot provide hints for all raw sheets, generate synthetic hints per set at ingestion time, for example:
     - `SORT-001`: *"Recall: Book-keeping records day-to-day transactions; Accountancy prepares and analyzes financial statements."*
     - `SORT-005`: *"Consider whether this expenditure yields recurring short-term benefits or enduring asset capacity."*
