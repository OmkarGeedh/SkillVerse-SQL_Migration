# DQ-BUG-2026-10-002 — 11th CSV rows skipped by `game-db import`

**Found:** 2026-10-29, first import of `Sheets Dump/11th csv` into the rebuilt schema.
**Effect:** these rows/boards are not in the database until the source CSV is fixed. Nothing else is blocked.
**Fix:** correct the CSV, run `make import && make seed`. The source CSVs were not edited.

| File | Line | Problem |
|---|---|---|
| `MCQ/Accounts/11th_Accounts_CH3.csv` | 85 | Footer row "Total Questions & Points … 83 MCQs … 406" is not a question. Delete the row. |
| `MCQ/Economics/10_EconomicPlanning.csv` | 187 | Options A and D are both `RRB` (marked correct: D). |
| `MCQ/Maths 1/9_Differentiation.csv` | 222 (S.No 56) | Options A and B are both `8`. |
| `MCQ/Maths 1/9_Differentiation.csv` | 602 (S.No 151) | Options A and D are both `- \frac{3}{2}`. |
| `MCQ/Maths 2/6_PermutationsAndCombinations.csv` | 387 (S.No 386) | Options B and C are both `360` (marked correct: C). |
| `MCQ/Maths 2/6_PermutationsAndCombinations.csv` | 389 (S.No 388) | Options A and D are both `20160` (marked correct: A). |
| `Match the Following/Accounts/CH2.csv` | board MTF-001 | Right side repeats `Real Account` (Cash, Machinery). Players see two identical cards but only one is graded correct. Replace one pair. |
| `Match the Following/Accounts/CH9.csv` | board MTF-003 | Right side repeats `Current Liability` (Creditors, Bank Overdraft). Same problem. |

Line numbers are physical file lines (multi-line cells push them past the S.No).
