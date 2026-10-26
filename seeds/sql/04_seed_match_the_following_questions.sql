-- Seeds: Match The Following questions (60 items)

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_001', 'accounting', 'Match each Account with its Nature/Classification:', 25, 1, 40, 'Recall the three traditional categories: Personal, Real, and Nominal accounts.', 'Cash and Machinery are assets (Real Accounts), Salary is an expense (Nominal Account), and Ram''s A/c represents an individual person (Personal Account).'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_001');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_001'), 1, 'Cash', 'Real Account'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_001'), 2, 'Salary', 'Nominal Account'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_001'), 3, 'Ram''s A/c', 'Personal Account'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_001'), 4, 'Machinery', 'Real Account');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_002', 'accounting', 'Match each Financial Statement with its Core Purpose:', 25, 1, 40, 'Consider the primary financial insight each statement delivers to stakeholders.', 'Balance Sheet reflects financial position, Profit & Loss shows net profit or loss, Cash Flow tracks cash inflows and outflows, and Trial Balance checks arithmetical accuracy of ledger postings.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_002');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_002'), 1, 'Balance Sheet', 'Financial Position'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_002'), 2, 'Profit & Loss', 'Net Profit/Loss'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_002'), 3, 'Cash Flow', 'Inflows & Outflows'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_002'), 4, 'Trial Balance', 'Arithmetical Accuracy');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_003', 'accounting', 'Match each Asset with its Accounting Category:', 25, 1, 40, 'Classify by physical existence, liquidity, and operational lifespan.', 'Goodwill has no physical form (Intangible), Stock turns to cash in under a year (Current), Building lasts multiple periods (Fixed), and Preliminary Expenses represent unwritten-off fictitious items.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_003');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_003'), 1, 'Goodwill', 'Intangible Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_003'), 2, 'Stock/Inventory', 'Current Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_003'), 3, 'Building', 'Fixed Asset'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_003'), 4, 'Preliminary Expenses', 'Fictitious Asset');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_004', 'accounting', 'Match each Liability / Equity item with its Balance Sheet Classification:', 25, 1, 40, 'Differentiate between short-term obligations, long-term borrowings, and equity ownership.', 'Creditors and Bank Overdraft are short-term liabilities payable within a year, Debentures are long-term borrowings, and Share Capital represents shareholders'' equity.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_004');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_004'), 1, 'Creditors', 'Current Liability'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_004'), 2, 'Debentures', 'Long-term Liability'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_004'), 3, 'Bank Overdraft', 'Current Liability'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_004'), 4, 'Share Capital', 'Shareholders'' Equity');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_005', 'accounting', 'Match each Fundamental Accounting Concept with its Definition:', 25, 2, 40, 'These core GAAP conventions guide the valuation and reporting of accounts.', 'Dual Aspect dictates total Debits must equal Credits, Going Concern presumes indefinite entity life, Money Measurement only records events quantifiable in money, and Conservatism anticipates potential losses.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_005');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_005'), 1, 'Dual Aspect', 'Debit equals Credit'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_005'), 2, 'Going Concern', 'Indefinite Life'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_005'), 3, 'Money Measurement', 'Financial Terms Only'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_005'), 4, 'Conservatism', 'Anticipate Losses');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_006', 'accounting', 'Match each Golden Rule / Concept with its Core Principle:', 25, 1, 40, 'Recall the classic double-entry rules for personal, real, and nominal accounts.', 'Personal Account: Debit the receiver, Credit the giver. Real Account: Debit what comes in, Credit what goes out. Nominal Account: Debit all expenses, Credit all incomes. Capital represents a liability of the business entity to its proprietor.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_006');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_006'), 1, 'Personal Account', 'Debit receiver Credit giver'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_006'), 2, 'Real Account', 'Debit what comes in Credit what goes out'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_006'), 3, 'Nominal Account', 'Debit expenses Credit incomes'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_006'), 4, 'Capital', 'Liability to the business');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_007', 'accounting', 'Match each Banking Term / Instrument with its Description:', 25, 1, 40, 'Identify typical commercial banking instruments and records.', 'A cheque is a negotiable instrument, passbook is a bank-issued copy of customer''s account, overdraft is an approved credit line facility, and ATM stands for Automated Teller Machine.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_007');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_007'), 1, 'Cheque', 'Negotiable Instrument'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_007'), 2, 'Passbook', 'Bank Statement'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_007'), 3, 'Overdraft', 'Credit facility'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_007'), 4, 'ATM', 'Automated Teller Machine');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_008', 'accounting', 'Match each Type of Accounting Error with its Characteristic:', 25, 2, 40, 'Consider how trial balance errors arise in recording, posting, and classification.', 'Error of Omission means a transaction was left out completely, Error of Commission involves clerical mistakes like wrong amounts or cast errors, Error of Principle misapplies capital/revenue distinctions, and Compensating Errors offset each other.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_008');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_008'), 1, 'Error of Omission', 'Completely left out'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_008'), 2, 'Error of Commission', 'Wrong amount entered'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_008'), 3, 'Error of Principle', 'Capital treated as Revenue'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_008'), 4, 'Compensating Error', 'One error offsets another');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_009', 'accounting', 'Match each Form of Business Organization with its Key Attribute:', 25, 1, 40, 'Look at ownership structure, legal status, and mutual association requirements.', 'Sole Proprietorship is run by a single owner, Partnership requires a minimum of 2 partners, a Company is an incorporated separate legal entity, and Cooperatives are voluntary associations for mutual help.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_009');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_009'), 1, 'Sole Proprietorship', 'Single Owner'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_009'), 2, 'Partnership', 'Minimum 2 Partners'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_009'), 3, 'Company', 'Separate Legal Entity'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_009'), 4, 'Cooperative', 'Mutual Help');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_acc_010', 'accounting', 'Match each Depreciation Method with its Distinguishing Trait:', 25, 2, 40, 'Examine how depreciation expense is allocated across the asset''s useful life.', 'Straight Line charges equal amounts each year, Written Down Value charges decreasing amounts on book value, Sinking Fund accumulates investments to replace the asset, and Annuity Method includes interest on capital outlay.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_010');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_010'), 1, 'Straight Line', 'Equal annual charge'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_010'), 2, 'Written Down Value', 'Decreasing annual charge'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_010'), 3, 'Sinking Fund', 'Asset replacement fund'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_acc_010'), 4, 'Annuity Method', 'Interest on investment considered');

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

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e01', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '24 + 15 = 39; 48 - 16 = 32; 37 + 22 = 59; 65 - 18 = 47.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e01');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e01'), 1, '24 + 15', '39'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e01'), 2, '48 - 16', '32'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e01'), 3, '37 + 22', '59'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e01'), 4, '65 - 18', '47');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e02', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '32 + 19 = 51; 76 - 23 = 53; 45 + 16 = 61; 92 - 35 = 57.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e02');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e02'), 1, '32 + 19', '51'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e02'), 2, '76 - 23', '53'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e02'), 3, '45 + 16', '61'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e02'), 4, '92 - 35', '57');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e03', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '29 + 25 = 54; 63 - 19 = 44; 52 + 17 = 69; 90 - 26 = 64.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e03');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e03'), 1, '29 + 25', '54'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e03'), 2, '63 - 19', '44'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e03'), 3, '52 + 17', '69'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e03'), 4, '90 - 26', '64');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e04', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '38 + 14 = 52; 82 - 27 = 55; 41 + 33 = 74; 77 - 34 = 43.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e04');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e04'), 1, '38 + 14', '52'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e04'), 2, '82 - 27', '55'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e04'), 3, '41 + 33', '74'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e04'), 4, '77 - 34', '43');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e05', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '46 + 18 = 64; 69 - 24 = 45; 28 + 37 = 65; 85 - 29 = 56.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e05');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e05'), 1, '46 + 18', '64'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e05'), 2, '69 - 24', '45'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e05'), 3, '28 + 37', '65'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e05'), 4, '85 - 29', '56');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e06', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '53 + 21 = 74; 71 - 32 = 39; 36 + 29 = 65; 94 - 38 = 56.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e06');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e06'), 1, '53 + 21', '74'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e06'), 2, '71 - 32', '39'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e06'), 3, '36 + 29', '65'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e06'), 4, '94 - 38', '56');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e07', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '19 + 35 = 54; 86 - 41 = 45; 47 + 26 = 73; 66 - 17 = 49.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e07');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e07'), 1, '19 + 35', '54'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e07'), 2, '86 - 41', '45'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e07'), 3, '47 + 26', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e07'), 4, '66 - 17', '49');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e08', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '34 + 28 = 62; 95 - 37 = 58; 25 + 48 = 73; 73 - 26 = 47.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e08');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e08'), 1, '34 + 28', '62'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e08'), 2, '95 - 37', '58'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e08'), 3, '25 + 48', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e08'), 4, '73 - 26', '47');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e09', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '42 + 29 = 71; 84 - 36 = 48; 39 + 33 = 72; 67 - 15 = 52.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e09');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e09'), 1, '42 + 29', '71'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e09'), 2, '84 - 36', '48'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e09'), 3, '39 + 33', '72'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e09'), 4, '67 - 15', '52');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e10', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '55 + 18 = 73; 79 - 28 = 51; 31 + 44 = 75; 91 - 45 = 46.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e10');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e10'), 1, '55 + 18', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e10'), 2, '79 - 28', '51'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e10'), 3, '31 + 44', '75'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e10'), 4, '91 - 45', '46');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e11', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '27 + 36 = 63; 83 - 35 = 48; 49 + 24 = 73; 70 - 28 = 42.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e11');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e11'), 1, '27 + 36', '63'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e11'), 2, '83 - 35', '48'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e11'), 3, '49 + 24', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e11'), 4, '70 - 28', '42');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e12', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '36 + 37 = 73; 92 - 44 = 48; 58 + 19 = 77; 64 - 25 = 39.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e12');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e12'), 1, '36 + 37', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e12'), 2, '92 - 44', '48'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e12'), 3, '58 + 19', '77'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e12'), 4, '64 - 25', '39');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e13', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '44 + 27 = 71; 76 - 29 = 47; 23 + 58 = 81; 89 - 37 = 52.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e13');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e13'), 1, '44 + 27', '71'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e13'), 2, '76 - 29', '47'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e13'), 3, '23 + 58', '81'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e13'), 4, '89 - 37', '52');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e14', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '51 + 29 = 80; 87 - 39 = 48; 35 + 46 = 81; 68 - 34 = 34.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e14');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e14'), 1, '51 + 29', '80'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e14'), 2, '87 - 39', '48'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e14'), 3, '35 + 46', '81'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e14'), 4, '68 - 34', '34');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_e15', 'maths', 'Match each addition/subtraction problem with its correct numerical answer:', 25, 1, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '39 + 38 = 77; 93 - 46 = 47; 48 + 25 = 73; 75 - 38 = 37.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e15');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e15'), 1, '39 + 38', '77'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e15'), 2, '93 - 46', '47'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e15'), 3, '48 + 25', '73'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_e15'), 4, '75 - 38', '37');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m01', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '14 × 3 = 42; 25 × 2 = 50; 16 × 4 = 64; 18 × 5 = 90.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m01');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m01'), 1, '14 × 3', '42'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m01'), 2, '25 × 2', '50'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m01'), 3, '16 × 4', '64'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m01'), 4, '18 × 5', '90');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m02', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '12 × 6 = 72; 22 × 3 = 66; 15 × 5 = 75; 19 × 4 = 76.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m02');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m02'), 1, '12 × 6', '72'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m02'), 2, '22 × 3', '66'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m02'), 3, '15 × 5', '75'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m02'), 4, '19 × 4', '76');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m03', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '13 × 4 = 52; 24 × 3 = 72; 17 × 5 = 85; 28 × 2 = 56.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m03');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m03'), 1, '13 × 4', '52'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m03'), 2, '24 × 3', '72'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m03'), 3, '17 × 5', '85'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m03'), 4, '28 × 2', '56');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m04', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '15 × 4 = 60; 21 × 4 = 84; 14 × 5 = 70; 32 × 3 = 96.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m04');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m04'), 1, '15 × 4', '60'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m04'), 2, '21 × 4', '84'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m04'), 3, '14 × 5', '70'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m04'), 4, '32 × 3', '96');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m05', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '18 × 3 = 54; 26 × 2 = 52; 16 × 5 = 80; 23 × 4 = 92.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m05');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m05'), 1, '18 × 3', '54'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m05'), 2, '26 × 2', '52'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m05'), 3, '16 × 5', '80'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m05'), 4, '23 × 4', '92');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m06', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '19 × 3 = 57; 35 × 2 = 70; 14 × 6 = 84; 25 × 4 = 100.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m06');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m06'), 1, '19 × 3', '57'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m06'), 2, '35 × 2', '70'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m06'), 3, '14 × 6', '84'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m06'), 4, '25 × 4', '100');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m07', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '16 × 3 = 48; 27 × 2 = 54; 13 × 6 = 78; 22 × 5 = 110.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m07');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m07'), 1, '16 × 3', '48'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m07'), 2, '27 × 2', '54'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m07'), 3, '13 × 6', '78'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m07'), 4, '22 × 5', '110');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m08', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '17 × 4 = 68; 31 × 3 = 93; 15 × 6 = 90; 24 × 4 = 96.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m08');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m08'), 1, '17 × 4', '68'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m08'), 2, '31 × 3', '93'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m08'), 3, '15 × 6', '90'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m08'), 4, '24 × 4', '96');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m09', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '18 × 4 = 72; 28 × 3 = 84; 13 × 7 = 91; 35 × 3 = 105.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m09');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m09'), 1, '18 × 4', '72'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m09'), 2, '28 × 3', '84'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m09'), 3, '13 × 7', '91'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m09'), 4, '35 × 3', '105');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_m10', 'maths', 'Match each multiplication expression with its correct numerical answer:', 25, 2, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '19 × 5 = 95; 23 × 3 = 69; 16 × 6 = 96; 42 × 2 = 84.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m10');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m10'), 1, '19 × 5', '95'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m10'), 2, '23 × 3', '69'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m10'), 3, '16 × 6', '96'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_m10'), 4, '42 × 2', '84');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h01', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '96 ÷ 4 = 24; 125 ÷ 5 = 25; 230 + 145 = 375; 580 - 230 = 350.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h01');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h01'), 1, '96 ÷ 4', '24'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h01'), 2, '125 ÷ 5', '25'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h01'), 3, '230 + 145', '375'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h01'), 4, '580 - 230', '350');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h02', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '144 ÷ 6 = 24; 180 ÷ 9 = 20; 340 + 185 = 525; 690 - 275 = 415.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h02');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h02'), 1, '144 ÷ 6', '24'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h02'), 2, '180 ÷ 9', '20'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h02'), 3, '340 + 185', '525'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h02'), 4, '690 - 275', '415');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h03', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '112 ÷ 8 = 14; 175 ÷ 7 = 25; 415 + 165 = 580; 740 - 315 = 425.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h03');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h03'), 1, '112 ÷ 8', '14'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h03'), 2, '175 ÷ 7', '25'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h03'), 3, '415 + 165', '580'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h03'), 4, '740 - 315', '425');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h04', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '108 ÷ 9 = 12; 168 ÷ 6 = 28; 275 + 250 = 525; 820 - 395 = 425.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h04');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h04'), 1, '108 ÷ 9', '12'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h04'), 2, '168 ÷ 6', '28'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h04'), 3, '275 + 250', '525'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h04'), 4, '820 - 395', '425');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h05', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '132 ÷ 6 = 22; 150 ÷ 5 = 30; 380 + 245 = 625; 650 - 285 = 365.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h05');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h05'), 1, '132 ÷ 6', '22'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h05'), 2, '150 ÷ 5', '30'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h05'), 3, '380 + 245', '625'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h05'), 4, '650 - 285', '365');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h06', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '126 ÷ 7 = 18; 192 ÷ 8 = 24; 450 + 175 = 625; 710 - 290 = 420.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h06');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h06'), 1, '126 ÷ 7', '18'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h06'), 2, '192 ÷ 8', '24'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h06'), 3, '450 + 175', '625'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h06'), 4, '710 - 290', '420');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h07', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '135 ÷ 9 = 15; 160 ÷ 5 = 32; 325 + 295 = 620; 850 - 380 = 470.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h07');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h07'), 1, '135 ÷ 9', '15'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h07'), 2, '160 ÷ 5', '32'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h07'), 3, '325 + 295', '620'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h07'), 4, '850 - 380', '470');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h08', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '117 ÷ 9 = 13; 184 ÷ 8 = 23; 490 + 160 = 650; 900 - 425 = 475.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h08');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h08'), 1, '117 ÷ 9', '13'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h08'), 2, '184 ÷ 8', '23'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h08'), 3, '490 + 160', '650'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h08'), 4, '900 - 425', '475');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h09', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '156 ÷ 6 = 26; 140 ÷ 4 = 35; 260 + 355 = 615; 780 - 345 = 435.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h09');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h09'), 1, '156 ÷ 6', '26'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h09'), 2, '140 ÷ 4', '35'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h09'), 3, '260 + 355', '615'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h09'), 4, '780 - 345', '435');

INSERT INTO match_the_following_questions (
    question_code, topic_id, prompt, time_limit_sec, difficulty, points, hint, explanation
) VALUES (
    'mtf_mat_h10', 'maths', 'Match each arithmetic expression with its correct numerical answer:', 25, 3, 40, 'Solve each arithmetic operation individually, then pair with the matching solution.', '128 ÷ 8 = 16; 162 ÷ 9 = 18; 515 + 225 = 740; 860 - 415 = 445.'
) ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    time_limit_sec = EXCLUDED.time_limit_sec,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

DELETE FROM match_pairs WHERE question_id IN (SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h10');
INSERT INTO match_pairs (question_id, pair_order, left_text, right_text) VALUES
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h10'), 1, '128 ÷ 8', '16'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h10'), 2, '162 ÷ 9', '18'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h10'), 3, '515 + 225', '740'),
((SELECT id FROM match_the_following_questions WHERE question_code = 'mtf_mat_h10'), 4, '860 - 415', '445');

