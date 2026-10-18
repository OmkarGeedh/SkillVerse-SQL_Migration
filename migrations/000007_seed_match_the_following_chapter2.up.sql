-- Migration: 000007_seed_match_the_following_chapter2.up.sql
-- Description: Seed 15 Match the Following board questions and 60 match pairs for Chapter 2

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_011', 'accounting', 'Match each Type of Personal Account with its Representative Example:', 25, 1, 40, 'Distinguish between human beings, legal entities/institutions, and accounts representing a group.', 'Sunita is a natural human person; Bank of Maharashtra is an artificial person created by law; Outstanding Salary represents employees due payments; Drawings is personal account of the owner.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_011');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_011'), 1, 'Natural Personal Account', 'Sunita''s A/c'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_011'), 2, 'Artificial Personal Account', 'Bank of Maharashtra A/c'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_011'), 3, 'Representative Personal Account', 'Outstanding Salary A/c'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_011'), 4, 'Proprietor Account', 'Drawings A/c');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_012', 'accounting', 'Match each Real Account Asset with its Precise Sub-Category:', 25, 1, 40, 'Consider physical tangibility and how quickly the asset converts to cash.', 'Motor Car has physical existence and long life; Copyright has no physical form but legal value; Stock is held for trade; Cash is the most liquid asset.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_012');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_012'), 1, 'Motor Car', 'Tangible Fixed Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_012'), 2, 'Copyright', 'Intangible Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_012'), 3, 'Stock in Trade', 'Tangible Current Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_012'), 4, 'Cash in Hand', 'Liquid Asset');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_013', 'accounting', 'Match each Transaction Type with its Defining Feature:', 25, 1, 40, 'Focus on the timing of cash settlement and whether currency is involved.', 'Cash transactions settle immediately; credit transactions create debtor/creditor relationships; non-cash transactions include depreciation or fire loss; barter trades goods directly.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_013');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_013'), 1, 'Cash Transaction', 'Immediate cash settlement'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_013'), 2, 'Credit Transaction', 'Payment postponed to future date'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_013'), 3, 'Non-Cash Transaction', 'Exchange without direct cash movement'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_013'), 4, 'Barter Transaction', 'Direct exchange of goods for goods');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_014', 'accounting', 'Match each Accounting Document / Voucher with its Commercial Function:', 25, 2, 40, 'Think about buyer-seller communications when buying, selling, or returning merchandise.', 'Cash memo records cash transactions; tax invoice bills credit sales; debit note debits the supplier account on purchase returns; credit note credits customer account on sales returns.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_014');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_014'), 1, 'Cash Memo', 'Proof of cash sale/purchase'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_014'), 2, 'Tax Invoice', 'Proof of credit sale/purchase'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_014'), 3, 'Debit Note', 'Sent when returning goods to supplier'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_014'), 4, 'Credit Note', 'Sent when receiving returned goods');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_015', 'accounting', 'Match each Accounting Equation Element with its Calculation / Formula:', 25, 1, 40, 'Use the fundamental dual-aspect equation: Assets = Liabilities + Capital.', 'The balance sheet equation balances resources (assets) against obligations (liabilities) and owner investments (capital).'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_015');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_015'), 1, 'Total Assets', 'Liabilities + Capital'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_015'), 2, 'Capital', 'Total Assets - Total Liabilities'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_015'), 3, 'Total Liabilities', 'Total Assets - Capital'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_015'), 4, 'Net Worth', 'Capital + Retained Profits - Drawings');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_016', 'accounting', 'Match each System / Basis of Accounting with its Underlying Principle:', 25, 2, 40, 'Compare strict cash timing versus period matching and single versus dual entry.', 'Cash basis waits for cash movements; accrual basis reflects economic events when incurred; single entry is incomplete; double entry systematically records both sides of every transaction.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_016');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_016'), 1, 'Cash Basis', 'Records revenue on cash realization'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_016'), 2, 'Accrual Basis', 'Matches revenues/expenses when earned/incurred'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_016'), 3, 'Single Entry System', 'Incomplete and unscientific records'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_016'), 4, 'Double Entry System', 'Dual aspect with equal debit and credit');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_017', 'accounting', 'Match each Term related to Solvency with its Definition:', 25, 1, 40, 'Examine financial capability to meet commercial liabilities and debt collection risks.', 'A solvent person can honor debts; an insolvent person cannot; bad debts are confirmed uncollectible; doubtful debts represent estimated recovery risk.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_017');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_017'), 1, 'Solvent Person', 'Assets exceed liabilities'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_017'), 2, 'Insolvent Person', 'Liabilities exceed assets'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_017'), 3, 'Bad Debts', 'Irrecoverable debt written off as loss'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_017'), 4, 'Doubtful Debts', 'Recovery uncertain at year end');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_018', 'accounting', 'Match each Branch of Accounting with its Primary Target Objective:', 25, 2, 40, 'Consider who consumes the information and for what purpose.', 'Financial accounting serves banks/investors; cost accounting guides factory/pricing managers; management accounting aids strategic planning; social accounting measures CSR.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_018');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_018'), 1, 'Financial Accounting', 'Historical reports for external stakeholders'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_018'), 2, 'Cost Accounting', 'Ascertaining unit cost and cost control'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_018'), 3, 'Management Accounting', 'Internal decision-making for leadership'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_018'), 4, 'Social Responsibility Accounting', 'Measuring community and environmental impact');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_019', 'accounting', 'Match each Subsidiary Book with the Nature of Entries it Contains:', 25, 2, 40, 'Remember that special journals handle high-volume routine transactions while Journal Proper catches the rest.', 'Purchases and Sales books record trade goods on credit; Cash book logs all liquid cash flows; Journal Proper handles adjustments and non-cash asset trades.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_019');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_019'), 1, 'Purchases Book', 'Credit purchases of trade goods only'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_019'), 2, 'Sales Book', 'Credit sales of trade goods only'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_019'), 3, 'Cash Book', 'All cash receipts and disbursements'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_019'), 4, 'Journal Proper', 'Opening, closing, and non-routine entries');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_020', 'accounting', 'Match each Accounting Standard (AS / Ind AS) with its Regulatory Subject:', 25, 3, 40, 'Standardized disclosure and valuation guidance issued by ICAI.', 'AS 1 mandates policy disclosure; AS 2 guides inventory cost vs NRV; AS 9 governs revenue timing; AS 10 governs fixed asset capitalization and depreciation.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_020');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_020'), 1, 'AS 1', 'Disclosure of Accounting Policies'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_020'), 2, 'AS 2', 'Valuation of Inventories'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_020'), 3, 'AS 9', 'Revenue Recognition'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_020'), 4, 'AS 10', 'Property, Plant and Equipment');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_021', 'accounting', 'Match each Account Balance Behavior with its Standard Ledger Classification:', 25, 1, 40, 'Recall the modern classification of accounts and ledger rules for increases/decreases.', 'Assets and expenses naturally hold debit balances; liabilities, revenues, and capital hold credit balances; increases follow the normal balance side.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_021');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_021'), 1, 'Normal Debit Balance', 'Assets, Expenses, and Losses'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_021'), 2, 'Normal Credit Balance', 'Liabilities, Capital, and Revenues'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_021'), 3, 'Increase via Debit', 'Tangible Assets and Operating Expenses'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_021'), 4, 'Increase via Credit', 'Sundry Creditors and Sales Incomes');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_022', 'accounting', 'Match each Golden Rule of Accounting with its Applicable Account Class:', 25, 1, 40, 'Link each traditional 3-part Golden Rule to Personal, Real, or Nominal accounts.', 'Personal accounts track receivers/givers; Real accounts track asset inflows/outflows; Nominal accounts track expenses and earnings.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_022');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_022'), 1, 'Debit receiver, Credit giver', 'Personal Accounts'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_022'), 2, 'Debit what comes in, Credit what goes out', 'Real Accounts'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_022'), 3, 'Debit expenses/losses, Credit incomes/gains', 'Nominal Accounts'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_022'), 4, 'Dual Aspect Balancing Rule', 'All Double Entry Transactions');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_023', 'accounting', 'Match each Discount Type with its Bookkeeping Recording Rule:', 25, 2, 40, 'Determine whether the concession appears explicitly as a ledger entry in financial accounts.', 'Trade discounts reduce catalogue prices without journal entry; cash and settlement discounts incentivize early liquidation and are explicitly ledger-posted.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_023');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_023'), 1, 'Trade Discount', 'Deducted from invoice, no ledger entry'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_023'), 2, 'Cash Discount', 'Separate ledger account in Cash Book'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_023'), 3, 'Quantity Rebate', 'Concession granted for bulk purchases'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_023'), 4, 'Settlement Allowance', 'Awarded for prompt cash settlement');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_024', 'accounting', 'Match each Commercial Entity Type with its Distinct Characteristic:', 25, 2, 40, 'Classification based on legal identity and institutional formation.', 'Sole traders are natural persons; companies and banks are artificial corporate persons; prepaid/outstanding accounts are representative; clubs are non-profit service bodies.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_024');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_024'), 1, 'Natural Person', 'Living human being trading as owner'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_024'), 2, 'Artificial Person', 'Body corporate created by law'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_024'), 3, 'Representative Person', 'Group account like Salaries Payable'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_024'), 4, 'Not-For-Profit Entity', 'Sports club or social welfare trust');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_025', 'accounting', 'Match each Trial Balance Error with its Trial Balance Detection Outcome:', 25, 3, 40, 'Check whether the error affects only one side or both debit and credit equally.', 'Trial balance only catches arithmetical one-sided errors; complete omissions, errors of principle, and compensating errors still leave debits equal to credits.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_025');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_025'), 1, 'Complete Omission', 'Trial Balance still agrees'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_025'), 2, 'One-sided Posting Error', 'Causes Trial Balance disagreement'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_025'), 3, 'Compensating Error', 'Errors neutralize, Trial Balance agrees'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_025'), 4, 'Error of Principle', 'Capital/revenue mixup, Trial Balance agrees');
