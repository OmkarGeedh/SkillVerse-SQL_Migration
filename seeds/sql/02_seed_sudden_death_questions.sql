-- Seeds: Sudden Death questions (45 items)

INSERT INTO mcq_questions (
    question_code, question_type, topic_id, prompt,
    option_a, option_b, option_c, option_d,
    correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sd_acc_001', 'sudden_death', 'accounting', 'Which account is debited when goods are purchased for cash?',
    'Purchases Account', 'Cash Account', '', '',
    'a', 1, 10, 'Think about which account records goods bought for resale.', 'Purchases Account is debited when goods are purchased for cash.'
),
(
    'sd_acc_002', 'sudden_death', 'accounting', 'What type of account is Cash Account?',
    'Real Account', 'Personal Account', '', '',
    'a', 1, 10, 'Tangible business assets are classified under this rule.', 'Cash Account is a Real Account since it represents a tangible asset of the business.'
),
(
    'sd_acc_003', 'sudden_death', 'accounting', 'Which golden rule states ''Debit the receiver, Credit the giver''?',
    'Real Account', 'Personal Account', '', '',
    'b', 1, 10, 'This rule applies to persons, firms, and institutions.', 'The golden rule ''Debit the receiver, Credit the giver'' applies to Personal Accounts.'
),
(
    'sd_acc_004', 'sudden_death', 'accounting', 'What is the primary book of original entry called?',
    'Journal', 'Ledger', '', '',
    'a', 1, 10, 'Transactions are recorded here chronologically first.', 'The Journal is the primary book of original entry where financial transactions are first recorded in chronological order.'
),
(
    'sd_acc_005', 'sudden_death', 'accounting', 'When rent is paid in cash, which account is credited?',
    'Rent Account', 'Cash Account', '', '',
    'b', 2, 10, 'Credit what goes out of the business.', 'When rent is paid in cash, cash goes out of the business, so Cash Account is credited.'
),
(
    'sd_acc_006', 'sudden_death', 'accounting', 'Depreciation charged on machinery is debited to which account?',
    'Depreciation Account', 'Machinery Account', '', '',
    'a', 2, 10, 'Debit all expenses and losses under the nominal rule.', 'Depreciation is an expense, so Depreciation Account is debited under the nominal rule.'
),
(
    'sd_acc_007', 'sudden_death', 'accounting', 'Which statement verifies the arithmetical accuracy of ledger accounts?',
    'Balance Sheet', 'Trial Balance', '', '',
    'b', 2, 10, 'It lists debit and credit totals before final accounts.', 'A Trial Balance is prepared to check and verify the arithmetical accuracy of ledger account balances.'
),
(
    'sd_acc_008', 'sudden_death', 'accounting', 'Goods returned by a customer are recorded in which book?',
    'Sales Returns Book', 'Purchases Returns Book', '', '',
    'a', 2, 10, 'Also known as the return inwards book.', 'Goods returned by customers are recorded in the Sales Returns Book (Return Inwards Book).'
),
(
    'sd_acc_009', 'sudden_death', 'accounting', 'An error of omission occurs when a transaction is:',
    'Recorded in the wrong subsidiary book', 'Completely or partially not recorded', '', '',
    'b', 3, 10, 'The transaction was forgotten or left out entirely.', 'An error of omission happens when a transaction is completely or partially omitted from entry in the accounting books.'
),
(
    'sd_acc_010', 'sudden_death', 'accounting', 'According to the Dual Aspect concept, Total Assets always equal:',
    'Total Liabilities plus Capital', 'Capital minus Liabilities', '', '',
    'a', 3, 10, 'This forms the fundamental accounting balance sheet equation.', 'Under the Dual Aspect concept, Total Assets = Total Liabilities + Capital.'
),
(
    'sd_mat_e01', 'sudden_death', 'maths', 'Rapid Math: 36 + 27 = ?',
    '63', '73', '', '',
    'a', 1, 10, 'Add 30 then subtract 3: 36 + 30 = 66, 66 - 3 = 63.', '36 + 27 = 63. Add 30 then subtract 3: 36 + 30 = 66, 66 - 3 = 63.'
),
(
    'sd_mat_e02', 'sudden_death', 'maths', 'Rapid Math: 54 - 18 = ?',
    '26', '36', '', '',
    'b', 1, 10, '54 - 20 = 34, then 34 + 2 = 36.', '54 - 18 = 36. 54 - 20 = 34, then 34 + 2 = 36.'
),
(
    'sd_mat_e03', 'sudden_death', 'maths', 'Rapid Math: 48 + 35 = ?',
    '83', '93', '', '',
    'a', 1, 10, '48 + 30 = 78, 78 + 5 = 83.', '48 + 35 = 83. 48 + 30 = 78, 78 + 5 = 83.'
),
(
    'sd_mat_e04', 'sudden_death', 'maths', 'Rapid Math: 72 - 29 = ?',
    '33', '43', '', '',
    'b', 1, 10, '72 - 30 = 42, 42 + 1 = 43.', '72 - 29 = 43. 72 - 30 = 42, 42 + 1 = 43.'
),
(
    'sd_mat_e05', 'sudden_death', 'maths', 'Rapid Math: 29 + 46 = ?',
    '75', '85', '', '',
    'a', 1, 10, '30 + 46 = 76, 76 - 1 = 75.', '29 + 46 = 75. 30 + 46 = 76, 76 - 1 = 75.'
),
(
    'sd_mat_e06', 'sudden_death', 'maths', 'Rapid Math: 81 - 34 = ?',
    '37', '47', '', '',
    'b', 1, 10, '81 - 30 = 51, 51 - 4 = 47.', '81 - 34 = 47. 81 - 30 = 51, 51 - 4 = 47.'
),
(
    'sd_mat_e07', 'sudden_death', 'maths', 'Rapid Math: 65 + 28 = ?',
    '93', '103', '', '',
    'a', 1, 10, '65 + 30 = 95, 95 - 2 = 93.', '65 + 28 = 93. 65 + 30 = 95, 95 - 2 = 93.'
),
(
    'sd_mat_e08', 'sudden_death', 'maths', 'Rapid Math: 93 - 47 = ?',
    '36', '46', '', '',
    'b', 1, 10, '93 - 50 = 43, 43 + 3 = 46.', '93 - 47 = 46. 93 - 50 = 43, 43 + 3 = 46.'
),
(
    'sd_mat_e09', 'sudden_death', 'maths', 'Rapid Math: 37 + 58 = ?',
    '95', '105', '', '',
    'a', 1, 10, '37 + 60 = 97, 97 - 2 = 95.', '37 + 58 = 95. 37 + 60 = 97, 97 - 2 = 95.'
),
(
    'sd_mat_e10', 'sudden_death', 'maths', 'Rapid Math: 64 - 38 = ?',
    '16', '26', '', '',
    'b', 1, 10, '64 - 40 = 24, 24 + 2 = 26.', '64 - 38 = 26. 64 - 40 = 24, 24 + 2 = 26.'
),
(
    'sd_mat_e11', 'sudden_death', 'maths', 'Rapid Math: 43 + 49 = ?',
    '92', '102', '', '',
    'a', 1, 10, '43 + 50 = 93, 93 - 1 = 92.', '43 + 49 = 92. 43 + 50 = 93, 93 - 1 = 92.'
),
(
    'sd_mat_e12', 'sudden_death', 'maths', 'Rapid Math: 85 - 27 = ?',
    '48', '58', '', '',
    'b', 1, 10, '85 - 30 = 55, 55 + 3 = 58.', '85 - 27 = 58. 85 - 30 = 55, 55 + 3 = 58.'
),
(
    'sd_mat_e13', 'sudden_death', 'maths', 'Rapid Math: 57 + 36 = ?',
    '93', '103', '', '',
    'a', 1, 10, '57 + 30 = 87, 87 + 6 = 93.', '57 + 36 = 93. 57 + 30 = 87, 87 + 6 = 93.'
),
(
    'sd_mat_e14', 'sudden_death', 'maths', 'Rapid Math: 76 - 49 = ?',
    '17', '27', '', '',
    'b', 1, 10, '76 - 50 = 26, 26 + 1 = 27.', '76 - 49 = 27. 76 - 50 = 26, 26 + 1 = 27.'
),
(
    'sd_mat_e15', 'sudden_death', 'maths', 'Rapid Math: 38 + 47 = ?',
    '85', '95', '', '',
    'a', 1, 10, '38 + 50 = 88, 88 - 3 = 85.', '38 + 47 = 85. 38 + 50 = 88, 88 - 3 = 85.'
),
(
    'sd_mat_m01', 'sudden_death', 'maths', 'Rapid Math: 15 × 6 = ?',
    '90', '100', '', '',
    'a', 2, 10, '15 × 2 = 30; 30 × 3 = 90.', '15 × 6 = 90. 15 × 2 = 30; 30 × 3 = 90.'
),
(
    'sd_mat_m02', 'sudden_death', 'maths', 'Rapid Math: 24 × 4 = ?',
    '86', '96', '', '',
    'b', 2, 10, 'Double 24 to 48, double 48 to 96.', '24 × 4 = 96. Double 24 to 48, double 48 to 96.'
),
(
    'sd_mat_m03', 'sudden_death', 'maths', 'Rapid Math: 17 × 5 = ?',
    '85', '95', '', '',
    'a', 2, 10, '(17 × 10) / 2 = 170 / 2 = 85.', '17 × 5 = 85. (17 × 10) / 2 = 170 / 2 = 85.'
),
(
    'sd_mat_m04', 'sudden_death', 'maths', 'Rapid Math: 35 × 3 = ?',
    '95', '105', '', '',
    'b', 2, 10, '30 × 3 = 90, 5 × 3 = 15. 90 + 15 = 105.', '35 × 3 = 105. 30 × 3 = 90, 5 × 3 = 15. 90 + 15 = 105.'
),
(
    'sd_mat_m05', 'sudden_death', 'maths', 'Rapid Math: 13 × 7 = ?',
    '91', '101', '', '',
    'a', 2, 10, '10 × 7 = 70, 3 × 7 = 21. 70 + 21 = 91.', '13 × 7 = 91. 10 × 7 = 70, 3 × 7 = 21. 70 + 21 = 91.'
),
(
    'sd_mat_m06', 'sudden_death', 'maths', 'Rapid Math: 26 × 4 = ?',
    '94', '104', '', '',
    'b', 2, 10, 'Double 26 to 52, double 52 to 104.', '26 × 4 = 104. Double 26 to 52, double 52 to 104.'
),
(
    'sd_mat_m07', 'sudden_death', 'maths', 'Rapid Math: 16 × 6 = ?',
    '96', '106', '', '',
    'a', 2, 10, '10 × 6 = 60, 6 × 6 = 36. 60 + 36 = 96.', '16 × 6 = 96. 10 × 6 = 60, 6 × 6 = 36. 60 + 36 = 96.'
),
(
    'sd_mat_m08', 'sudden_death', 'maths', 'Rapid Math: 45 × 3 = ?',
    '125', '135', '', '',
    'b', 2, 10, '40 × 3 = 120, 5 × 3 = 15. 120 + 15 = 135.', '45 × 3 = 135. 40 × 3 = 120, 5 × 3 = 15. 120 + 15 = 135.'
),
(
    'sd_mat_m09', 'sudden_death', 'maths', 'Rapid Math: 28 × 4 = ?',
    '112', '122', '', '',
    'a', 2, 10, 'Double 28 to 56, double 56 to 112.', '28 × 4 = 112. Double 28 to 56, double 56 to 112.'
),
(
    'sd_mat_m10', 'sudden_death', 'maths', 'Rapid Math: 19 × 5 = ?',
    '85', '95', '', '',
    'b', 2, 10, '20 × 5 = 100, minus 5 = 95.', '19 × 5 = 95. 20 × 5 = 100, minus 5 = 95.'
),
(
    'sd_mat_h01', 'sudden_death', 'maths', 'Rapid Math: 108 ÷ 6 = ?',
    '18', '28', '', '',
    'a', 3, 10, '60 ÷ 6 = 10, 48 ÷ 6 = 8. 10 + 8 = 18.', '108 ÷ 6 = 18. 60 ÷ 6 = 10, 48 ÷ 6 = 8. 10 + 8 = 18.'
),
(
    'sd_mat_h02', 'sudden_death', 'maths', 'Rapid Math: 128 ÷ 8 = ?',
    '6', '16', '', '',
    'b', 3, 10, 'Halve three times: 128 -> 64 -> 32 -> 16.', '128 ÷ 8 = 16. Halve three times: 128 -> 64 -> 32 -> 16.'
),
(
    'sd_mat_h03', 'sudden_death', 'maths', 'Rapid Math: 153 ÷ 9 = ?',
    '17', '27', '', '',
    'a', 3, 10, '90 ÷ 9 = 10, 63 ÷ 9 = 7. 10 + 7 = 17.', '153 ÷ 9 = 17. 90 ÷ 9 = 10, 63 ÷ 9 = 7. 10 + 7 = 17.'
),
(
    'sd_mat_h04', 'sudden_death', 'maths', 'Rapid Math: 126 ÷ 7 = ?',
    '8', '18', '', '',
    'b', 3, 10, '70 ÷ 7 = 10, 56 ÷ 7 = 8. 10 + 8 = 18.', '126 ÷ 7 = 18. 70 ÷ 7 = 10, 56 ÷ 7 = 8. 10 + 8 = 18.'
),
(
    'sd_mat_h05', 'sudden_death', 'maths', 'Rapid Math: 175 ÷ 5 = ?',
    '35', '45', '', '',
    'a', 3, 10, 'Double 175 = 350, divide by 10 = 35.', '175 ÷ 5 = 35. Double 175 = 350, divide by 10 = 35.'
),
(
    'sd_mat_h06', 'sudden_death', 'maths', 'Rapid Math: 425 + 318 = ?',
    '733', '743', '', '',
    'b', 3, 10, '425 + 300 = 725, 725 + 18 = 743.', '425 + 318 = 743. 425 + 300 = 725, 725 + 18 = 743.'
),
(
    'sd_mat_h07', 'sudden_death', 'maths', 'Rapid Math: 684 - 247 = ?',
    '437', '447', '', '',
    'a', 3, 10, '684 - 240 = 444, 444 - 7 = 437.', '684 - 247 = 437. 684 - 240 = 444, 444 - 7 = 437.'
),
(
    'sd_mat_h08', 'sudden_death', 'maths', 'Rapid Math: 539 + 284 = ?',
    '813', '823', '', '',
    'b', 3, 10, '539 + 300 = 839, 839 - 16 = 823.', '539 + 284 = 823. 539 + 300 = 839, 839 - 16 = 823.'
),
(
    'sd_mat_h09', 'sudden_death', 'maths', 'Rapid Math: 841 - 365 = ?',
    '476', '486', '', '',
    'a', 3, 10, '841 - 360 = 481, 481 - 5 = 476.', '841 - 365 = 476. 841 - 360 = 481, 481 - 5 = 476.'
),
(
    'sd_mat_h10', 'sudden_death', 'maths', 'Rapid Math: 376 + 458 = ?',
    '824', '834', '', '',
    'b', 3, 10, '376 + 460 = 836, 836 - 2 = 834.', '376 + 458 = 834. 376 + 460 = 836, 836 - 2 = 834.'
)
ON CONFLICT (question_code) DO UPDATE SET
    question_type = EXCLUDED.question_type,
    topic_id = EXCLUDED.topic_id,
    prompt = EXCLUDED.prompt,
    option_a = EXCLUDED.option_a,
    option_b = EXCLUDED.option_b,
    option_c = EXCLUDED.option_c,
    option_d = EXCLUDED.option_d,
    correct_option = EXCLUDED.correct_option,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

