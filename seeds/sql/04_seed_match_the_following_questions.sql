-- Seeds: Match The Following questions (10 items)

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

