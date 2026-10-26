-- Migration: 000009_seed_maths_questions.up.sql
-- Description: Seed 140 mental math questions across 4 games (MCQ, Sudden Death, Sort It Out, Match the Following) for topic 'maths'

-- 1. MCQ Questions (35 items)
INSERT INTO mcq_questions (
    question_code, question_type, topic_id, prompt,
    option_a, option_b, option_c, option_d,
    correct_option, difficulty, points, hint, explanation
) VALUES
(
    'mcq_mat_e01', 'mcq', 'maths', 'What is 24 + 35?',
    '39', '49', '59', '69',
    'c', 1, 10, 'Add tens first (20 + 30 = 50), then units (4 + 5 = 9).', '24 + 35 = 59. Add tens first (20 + 30 = 50), then units (4 + 5 = 9).'
),
(
    'mcq_mat_e02', 'mcq', 'maths', 'What is 47 + 28?',
    '73', '66', '75', '95',
    'c', 1, 10, 'Round 28 to 30: 47 + 30 = 77, then subtract 2 to get 75.', '47 + 28 = 75. Round 28 to 30: 47 + 30 = 77, then subtract 2 to get 75.'
),
(
    'mcq_mat_e03', 'mcq', 'maths', 'What is 63 - 29?',
    '33', '45', '44', '34',
    'd', 1, 10, 'Subtract 30 first: 63 - 30 = 33, then add 1 back = 34.', '63 - 29 = 34. Subtract 30 first: 63 - 30 = 33, then add 1 back = 34.'
),
(
    'mcq_mat_e04', 'mcq', 'maths', 'What is 85 - 37?',
    '57', '48', '43', '28',
    'b', 1, 10, 'Break down 37 into 35 and 2: 85 - 35 = 50, then 50 - 2 = 48.', '85 - 37 = 48. Break down 37 into 35 and 2: 85 - 35 = 50, then 50 - 2 = 48.'
),
(
    'mcq_mat_e05', 'mcq', 'maths', 'What is 56 + 19?',
    '75', '66', '86', '95',
    'a', 1, 10, 'Add 20 first: 56 + 20 = 76, then subtract 1 to get 75.', '56 + 19 = 75. Add 20 first: 56 + 20 = 76, then subtract 1 to get 75.'
),
(
    'mcq_mat_e06', 'mcq', 'maths', 'What is 92 - 45?',
    '27', '48', '36', '47',
    'd', 1, 10, '92 - 40 = 52, then 52 - 5 = 47.', '92 - 45 = 47. 92 - 40 = 52, then 52 - 5 = 47.'
),
(
    'mcq_mat_e07', 'mcq', 'maths', 'What is 38 + 44?',
    '87', '92', '71', '82',
    'd', 1, 10, '38 + 40 = 78, then 78 + 4 = 82.', '38 + 44 = 82. 38 + 40 = 78, then 78 + 4 = 82.'
),
(
    'mcq_mat_e08', 'mcq', 'maths', 'What is 71 - 28?',
    '48', '42', '43', '33',
    'c', 1, 10, 'Subtract 30 to get 41, then add 2 back = 43.', '71 - 28 = 43. Subtract 30 to get 41, then add 2 back = 43.'
),
(
    'mcq_mat_e09', 'mcq', 'maths', 'What is 53 + 39?',
    '92', '87', '102', '82',
    'a', 1, 10, '53 + 40 = 93, then 93 - 1 = 92.', '53 + 39 = 92. 53 + 40 = 93, then 93 - 1 = 92.'
),
(
    'mcq_mat_e10', 'mcq', 'maths', 'What is 84 - 56?',
    '28', '38', '18', '33',
    'a', 1, 10, '84 - 50 = 34, then 34 - 6 = 28.', '84 - 56 = 28. 84 - 50 = 34, then 34 - 6 = 28.'
),
(
    'mcq_mat_e11', 'mcq', 'maths', 'What is 29 + 67?',
    '101', '94', '96', '98',
    'c', 1, 10, 'Round 29 to 30: 30 + 67 = 97, then 97 - 1 = 96.', '29 + 67 = 96. Round 29 to 30: 30 + 67 = 97, then 97 - 1 = 96.'
),
(
    'mcq_mat_e12', 'mcq', 'maths', 'What is 65 - 38?',
    '7', '27', '22', '38',
    'b', 1, 10, '65 - 40 = 25, then 25 + 2 = 27.', '65 - 38 = 27. 65 - 40 = 25, then 25 + 2 = 27.'
),
(
    'mcq_mat_e13', 'mcq', 'maths', 'What is 46 + 48?',
    '74', '94', '96', '95',
    'b', 1, 10, 'Double 46 is 92, then add 2 more to reach 48 = 94.', '46 + 48 = 94. Double 46 is 92, then add 2 more to reach 48 = 94.'
),
(
    'mcq_mat_e14', 'mcq', 'maths', 'What is 90 - 34?',
    '45', '56', '66', '76',
    'b', 1, 10, '90 - 30 = 60, then 60 - 4 = 56.', '90 - 34 = 56. 90 - 30 = 60, then 60 - 4 = 56.'
),
(
    'mcq_mat_e15', 'mcq', 'maths', 'What is 37 + 55?',
    '90', '83', '93', '92',
    'd', 1, 10, '37 + 50 = 87, then 87 + 5 = 92.', '37 + 55 = 92. 37 + 50 = 87, then 87 + 5 = 92.'
),
(
    'mcq_mat_m01', 'mcq', 'maths', 'Evaluate: 14 × 6',
    '104', '84', '82', '86',
    'b', 2, 10, '10 × 6 = 60, and 4 × 6 = 24. 60 + 24 = 84.', '14 × 6 = 84. 10 × 6 = 60, and 4 × 6 = 24. 60 + 24 = 84.'
),
(
    'mcq_mat_m02', 'mcq', 'maths', 'Evaluate: 23 × 4',
    '97', '103', '87', '92',
    'd', 2, 10, '20 × 4 = 80, and 3 × 4 = 12. 80 + 12 = 92.', '23 × 4 = 92. 20 × 4 = 80, and 3 × 4 = 12. 80 + 12 = 92.'
),
(
    'mcq_mat_m03', 'mcq', 'maths', 'Evaluate: 18 × 5',
    '110', '89', '90', '101',
    'c', 2, 10, 'Multiply by 10 and halve it: (18 × 10) / 2 = 180 / 2 = 90.', '18 × 5 = 90. Multiply by 10 and halve it: (18 × 10) / 2 = 180 / 2 = 90.'
),
(
    'mcq_mat_m04', 'mcq', 'maths', 'Evaluate: 32 × 3',
    '91', '95', '96', '107',
    'c', 2, 10, '30 × 3 = 90, and 2 × 3 = 6. 90 + 6 = 96.', '32 × 3 = 96. 30 × 3 = 90, and 2 × 3 = 6. 90 + 6 = 96.'
),
(
    'mcq_mat_m05', 'mcq', 'maths', 'Evaluate: 16 × 7',
    '107', '102', '103', '112',
    'd', 2, 10, '10 × 7 = 70, and 6 × 7 = 42. 70 + 42 = 112.', '16 × 7 = 112. 10 × 7 = 70, and 6 × 7 = 42. 70 + 42 = 112.'
),
(
    'mcq_mat_m06', 'mcq', 'maths', 'Evaluate: 25 × 6',
    '151', '150', '170', '141',
    'b', 2, 10, '25 × 4 = 100, plus another 25 × 2 = 50. Total = 150.', '25 × 6 = 150. 25 × 4 = 100, plus another 25 × 2 = 50. Total = 150.'
),
(
    'mcq_mat_m07', 'mcq', 'maths', 'Evaluate: 19 × 4',
    '75', '96', '56', '76',
    'd', 2, 10, '20 × 4 = 80, minus 1 × 4 = 4. 80 - 4 = 76.', '19 × 4 = 76. 20 × 4 = 80, minus 1 × 4 = 4. 80 - 4 = 76.'
),
(
    'mcq_mat_m08', 'mcq', 'maths', 'Evaluate: 42 × 3',
    '117', '137', '121', '126',
    'd', 2, 10, '40 × 3 = 120, plus 2 × 3 = 6. 120 + 6 = 126.', '42 × 3 = 126. 40 × 3 = 120, plus 2 × 3 = 6. 120 + 6 = 126.'
),
(
    'mcq_mat_m09', 'mcq', 'maths', 'Evaluate: 28 × 5',
    '140', '149', '145', '131',
    'a', 2, 10, 'Half of 28 is 14, multiply by 10 = 140.', '28 × 5 = 140. Half of 28 is 14, multiply by 10 = 140.'
),
(
    'mcq_mat_m10', 'mcq', 'maths', 'Evaluate: 36 × 4',
    '135', '144', '133', '155',
    'b', 2, 10, 'Double 36 is 72, double 72 is 144.', '36 × 4 = 144. Double 36 is 72, double 72 is 144.'
),
(
    'mcq_mat_h01', 'mcq', 'maths', 'Solve: 96 ÷ 6',
    '14', '25', '18', '16',
    'd', 3, 10, '90 ÷ 6 = 15, and 6 ÷ 6 = 1. 15 + 1 = 16.', '96 ÷ 6 = 16. 90 ÷ 6 = 15, and 6 ÷ 6 = 1. 15 + 1 = 16.'
),
(
    'mcq_mat_h02', 'mcq', 'maths', 'Solve: 144 ÷ 8',
    '16', '38', '18', '8',
    'c', 3, 10, 'Halve three times: 144 -> 72 -> 36 -> 18.', '144 ÷ 8 = 18. Halve three times: 144 -> 72 -> 36 -> 18.'
),
(
    'mcq_mat_h03', 'mcq', 'maths', 'Solve: 135 ÷ 9',
    '35', '24', '15', '25',
    'c', 3, 10, '90 ÷ 9 = 10, and 45 ÷ 9 = 5. 10 + 5 = 15.', '135 ÷ 9 = 15. 90 ÷ 9 = 10, and 45 ÷ 9 = 5. 10 + 5 = 15.'
),
(
    'mcq_mat_h04', 'mcq', 'maths', 'Solve: 112 ÷ 7',
    '16', '5', '27', '11',
    'a', 3, 10, '70 ÷ 7 = 10, and 42 ÷ 7 = 6. 10 + 6 = 16.', '112 ÷ 7 = 16. 70 ÷ 7 = 10, and 42 ÷ 7 = 6. 10 + 6 = 16.'
),
(
    'mcq_mat_h05', 'mcq', 'maths', 'Solve: 168 ÷ 4',
    '41', '31', '42', '32',
    'c', 3, 10, '160 ÷ 4 = 40, and 8 ÷ 4 = 2. 40 + 2 = 42.', '168 ÷ 4 = 42. 160 ÷ 4 = 40, and 8 ÷ 4 = 2. 40 + 2 = 42.'
),
(
    'mcq_mat_h06', 'mcq', 'maths', 'Solve: 348 + 275',
    '624', '632', '623', '614',
    'c', 3, 10, '348 + 200 = 548, 548 + 70 = 618, 618 + 5 = 623.', '348 + 275 = 623. 348 + 200 = 548, 548 + 70 = 618, 618 + 5 = 623.'
),
(
    'mcq_mat_h07', 'mcq', 'maths', 'Solve: 724 - 386',
    '336', '348', '338', '343',
    'c', 3, 10, '724 - 300 = 424, 424 - 80 = 344, 344 - 6 = 338.', '724 - 386 = 338. 724 - 300 = 424, 424 - 80 = 344, 344 - 6 = 338.'
),
(
    'mcq_mat_h08', 'mcq', 'maths', 'Solve: 467 + 389',
    '847', '851', '856', '845',
    'c', 3, 10, '467 + 400 = 867, then 867 - 11 = 856.', '467 + 389 = 856. 467 + 400 = 867, then 867 - 11 = 856.'
),
(
    'mcq_mat_h09', 'mcq', 'maths', 'Solve: 852 - 478',
    '383', '385', '369', '374',
    'd', 3, 10, '852 - 500 = 352, then add back 22 = 374.', '852 - 478 = 374. 852 - 500 = 352, then add back 22 = 374.'
),
(
    'mcq_mat_h10', 'mcq', 'maths', 'Solve: 583 + 249',
    '832', '831', '827', '843',
    'a', 3, 10, '583 + 250 = 833, then 833 - 1 = 832.', '583 + 249 = 832. 583 + 250 = 833, then 833 - 1 = 832.'
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

-- 2. Sudden Death Questions (35 items in mcq_questions)
INSERT INTO mcq_questions (
    question_code, question_type, topic_id, prompt,
    option_a, option_b, option_c, option_d,
    correct_option, difficulty, points, hint, explanation
) VALUES
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

-- 3. Sort It Out Questions (35 items)
INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_mat_e01', 'maths', 'even_odd', '34 + 28',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '34 + 28 = 62, which is Even. Parity rule: Even + Even = Even (34 + 28 = 62).'
),
(
    'sio_mat_e02', 'maths', 'even_odd', '45 + 18',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '45 + 18 = 63, which is Odd. Parity rule: Odd + Even = Odd (45 + 18 = 63).'
),
(
    'sio_mat_e03', 'maths', 'even_odd', '76 - 32',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '76 - 32 = 44, which is Even. Parity rule: Even - Even = Even (76 - 32 = 44).'
),
(
    'sio_mat_e04', 'maths', 'even_odd', '87 - 42',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '87 - 42 = 45, which is Odd. Parity rule: Odd - Even = Odd (87 - 42 = 45).'
),
(
    'sio_mat_e05', 'maths', 'even_odd', '53 + 29',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '53 + 29 = 82, which is Even. Parity rule: Odd + Odd = Even (53 + 29 = 82).'
),
(
    'sio_mat_e06', 'maths', 'even_odd', '68 - 25',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '68 - 25 = 43, which is Odd. Parity rule: Even - Odd = Odd (68 - 25 = 43).'
),
(
    'sio_mat_e07', 'maths', 'even_odd', '26 + 44',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '26 + 44 = 70, which is Even. Parity rule: Even + Even = Even (26 + 44 = 70).'
),
(
    'sio_mat_e08', 'maths', 'even_odd', '91 - 34',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '91 - 34 = 57, which is Odd. Parity rule: Odd - Even = Odd (91 - 34 = 57).'
),
(
    'sio_mat_e09', 'maths', 'even_odd', '42 + 36',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '42 + 36 = 78, which is Even. Parity rule: Even + Even = Even (42 + 36 = 78).'
),
(
    'sio_mat_e10', 'maths', 'even_odd', '73 - 28',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '73 - 28 = 45, which is Odd. Parity rule: Odd - Even = Odd (73 - 28 = 45).'
),
(
    'sio_mat_e11', 'maths', 'even_odd', '58 + 26',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '58 + 26 = 84, which is Even. Parity rule: Even + Even = Even (58 + 26 = 84).'
),
(
    'sio_mat_e12', 'maths', 'even_odd', '85 - 32',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '85 - 32 = 53, which is Odd. Parity rule: Odd - Even = Odd (85 - 32 = 53).'
),
(
    'sio_mat_e13', 'maths', 'even_odd', '37 + 49',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '37 + 49 = 86, which is Even. Parity rule: Odd + Odd = Even (37 + 49 = 86).'
),
(
    'sio_mat_e14', 'maths', 'even_odd', '64 - 17',
    'Even', 'Odd', 'b', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '64 - 17 = 47, which is Odd. Parity rule: Even - Odd = Odd (64 - 17 = 47).'
),
(
    'sio_mat_e15', 'maths', 'even_odd', '48 + 32',
    'Even', 'Odd', 'a', 1, 10, 'Check the last digits or use parity rules (Even/Odd).', '48 + 32 = 80, which is Even. Parity rule: Even + Even = Even (48 + 32 = 80).'
),
(
    'sio_mat_m01', 'maths', 'even_odd', '14 × 5',
    'Even', 'Odd', 'a', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '14 × 5 = 70, which is Even. Parity rule: Even × Odd = Even (14 × 5 = 70).'
),
(
    'sio_mat_m02', 'maths', 'even_odd', '17 × 3',
    'Even', 'Odd', 'b', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '17 × 3 = 51, which is Odd. Parity rule: Odd × Odd = Odd (17 × 3 = 51).'
),
(
    'sio_mat_m03', 'maths', 'even_odd', '22 × 4',
    'Even', 'Odd', 'a', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '22 × 4 = 88, which is Even. Parity rule: Even × Even = Even (22 × 4 = 88).'
),
(
    'sio_mat_m04', 'maths', 'even_odd', '25 × 3',
    'Even', 'Odd', 'b', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '25 × 3 = 75, which is Odd. Parity rule: Odd × Odd = Odd (25 × 3 = 75).'
),
(
    'sio_mat_m05', 'maths', 'even_odd', '18 × 6',
    'Even', 'Odd', 'a', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '18 × 6 = 108, which is Even. Parity rule: Even × Even = Even (18 × 6 = 108).'
),
(
    'sio_mat_m06', 'maths', 'even_odd', '19 × 5',
    'Even', 'Odd', 'b', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '19 × 5 = 95, which is Odd. Parity rule: Odd × Odd = Odd (19 × 5 = 95).'
),
(
    'sio_mat_m07', 'maths', 'even_odd', '32 × 4',
    'Even', 'Odd', 'a', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '32 × 4 = 128, which is Even. Parity rule: Even × Even = Even (32 × 4 = 128).'
),
(
    'sio_mat_m08', 'maths', 'even_odd', '27 × 3',
    'Even', 'Odd', 'b', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '27 × 3 = 81, which is Odd. Parity rule: Odd × Odd = Odd (27 × 3 = 81).'
),
(
    'sio_mat_m09', 'maths', 'even_odd', '16 × 7',
    'Even', 'Odd', 'a', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '16 × 7 = 112, which is Even. Parity rule: Even × Odd = Even (16 × 7 = 112).'
),
(
    'sio_mat_m10', 'maths', 'even_odd', '23 × 5',
    'Even', 'Odd', 'b', 2, 10, 'Check the last digits or use parity rules (Even/Odd).', '23 × 5 = 115, which is Odd. Parity rule: Odd × Odd = Odd (23 × 5 = 115).'
),
(
    'sio_mat_h01', 'maths', 'even_odd', '120 ÷ 5',
    'Even', 'Odd', 'a', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '120 ÷ 5 = 24, which is Even. Parity rule: 120 ÷ 5 = 24 (Even).'
),
(
    'sio_mat_h02', 'maths', 'even_odd', '135 ÷ 9',
    'Even', 'Odd', 'b', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '135 ÷ 9 = 15, which is Odd. Parity rule: 135 ÷ 9 = 15 (Odd).'
),
(
    'sio_mat_h03', 'maths', 'even_odd', '144 ÷ 6',
    'Even', 'Odd', 'a', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '144 ÷ 6 = 24, which is Even. Parity rule: 144 ÷ 6 = 24 (Even).'
),
(
    'sio_mat_h04', 'maths', 'even_odd', '117 ÷ 9',
    'Even', 'Odd', 'b', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '117 ÷ 9 = 13, which is Odd. Parity rule: 117 ÷ 9 = 13 (Odd).'
),
(
    'sio_mat_h05', 'maths', 'even_odd', '168 ÷ 8',
    'Even', 'Odd', 'b', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '168 ÷ 8 = 21, which is Odd. Parity rule: 168 ÷ 8 = 21 (Odd).'
),
(
    'sio_mat_h06', 'maths', 'even_odd', '342 + 216',
    'Even', 'Odd', 'a', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '342 + 216 = 558, which is Even. Parity rule: Even + Even = Even (342 + 216 = 558).'
),
(
    'sio_mat_h07', 'maths', 'even_odd', '579 - 234',
    'Even', 'Odd', 'b', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '579 - 234 = 345, which is Odd. Parity rule: Odd - Even = Odd (579 - 234 = 345).'
),
(
    'sio_mat_h08', 'maths', 'even_odd', '468 + 154',
    'Even', 'Odd', 'a', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '468 + 154 = 622, which is Even. Parity rule: Even + Even = Even (468 + 154 = 622).'
),
(
    'sio_mat_h09', 'maths', 'even_odd', '785 - 342',
    'Even', 'Odd', 'b', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '785 - 342 = 443, which is Odd. Parity rule: Odd - Even = Odd (785 - 342 = 443).'
),
(
    'sio_mat_h10', 'maths', 'even_odd', '624 - 188',
    'Even', 'Odd', 'a', 3, 10, 'Check the last digits or use parity rules (Even/Odd).', '624 - 188 = 436, which is Even. Parity rule: Even - Even = Even (624 - 188 = 436).'
)
ON CONFLICT (question_code) DO UPDATE SET
    topic_id = EXCLUDED.topic_id,
    pair_type = EXCLUDED.pair_type,
    prompt = EXCLUDED.prompt,
    option_a = EXCLUDED.option_a,
    option_b = EXCLUDED.option_b,
    correct_option = EXCLUDED.correct_option,
    difficulty = EXCLUDED.difficulty,
    points = EXCLUDED.points,
    hint = EXCLUDED.hint,
    explanation = EXCLUDED.explanation,
    updated_at = CURRENT_TIMESTAMP;

-- 4. Match The Following Questions (35 items) & Match Pairs (140 pairs)
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

