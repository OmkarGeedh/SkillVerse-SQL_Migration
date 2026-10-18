-- Migration: 000006_seed_sort_it_out_chapter2.up.sql
-- Description: Seed 116 Sort It Out rapid-fire swipe questions for Chapter 2 (Sets SORT-001 to SORT-010)

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_sort001_01', 'accounting', 'real_personal', 'Pune Municipal Corp. A/c',
    'Real Account', 'Personal Account', 'b', 2, 5,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'A corporation is treated as an artificial person.'
),
(
    'sio_sort001_02', 'accounting', 'real_personal', 'Motor Car A/c',
    'Real Account', 'Personal Account', 'a', 1, 3,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'A motor car is a tangible business asset.'
),
(
    'sio_sort001_03', 'accounting', 'real_personal', 'Cash A/c',
    'Real Account', 'Personal Account', 'a', 1, 3,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Cash is a business asset represented by a real account.'
),
(
    'sio_sort001_04', 'accounting', 'real_personal', 'Sunita''s A/c',
    'Real Account', 'Personal Account', 'b', 1, 3,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'It records transactions relating to an individual person.'
),
(
    'sio_sort001_05', 'accounting', 'real_personal', 'Mahesh''s A/c',
    'Real Account', 'Personal Account', 'b', 1, 3,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'It records dealings with a named individual.'
),
(
    'sio_sort001_06', 'accounting', 'real_personal', 'Copyright A/c',
    'Real Account', 'Personal Account', 'a', 2, 5,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Copyright is an intangible asset.'
),
(
    'sio_sort001_07', 'accounting', 'real_personal', 'Goodwill A/c',
    'Real Account', 'Personal Account', 'a', 2, 5,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Goodwill is an intangible asset.'
),
(
    'sio_sort001_08', 'accounting', 'real_personal', 'Stock of Goods A/c',
    'Real Account', 'Personal Account', 'a', 2, 5,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Stock of goods is property owned by the business.'
),
(
    'sio_sort001_09', 'accounting', 'real_personal', 'Prepaid Wages A/c',
    'Real Account', 'Personal Account', 'b', 3, 10,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Prepaid items are representative personal accounts.'
),
(
    'sio_sort001_10', 'accounting', 'real_personal', 'Outstanding Rent A/c',
    'Real Account', 'Personal Account', 'b', 3, 10,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Outstanding items are treated as representative personal accounts.'
),
(
    'sio_sort001_11', 'accounting', 'real_personal', 'Bank of India A/c',
    'Real Account', 'Personal Account', 'b', 2, 5,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'It represents an organization treated as an artificial person.'
),
(
    'sio_sort001_12', 'accounting', 'real_personal', 'Machinery A/c',
    'Real Account', 'Personal Account', 'a', 1, 3,
    'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.',
    'Machinery is property owned by the business.'
),
(
    'sio_sort002_01', 'accounting', 'nominal_personal', 'Bank of Maharashtra A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'A bank is treated as an artificial person.'
),
(
    'sio_sort002_02', 'accounting', 'nominal_personal', 'Commission Received A/c',
    'Nominal Account', 'Personal Account', 'a', 2, 5,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Commission received is income.'
),
(
    'sio_sort002_03', 'accounting', 'nominal_personal', 'Loan A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'The loan account is classified as personal in the examples.'
),
(
    'sio_sort002_04', 'accounting', 'nominal_personal', 'Radhika Sports Club A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'An association is treated as an artificial person.'
),
(
    'sio_sort002_05', 'accounting', 'nominal_personal', 'Loss by Fire A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Losses are recorded in nominal accounts.'
),
(
    'sio_sort002_06', 'accounting', 'nominal_personal', 'Repairs A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Repairs are an expense.'
),
(
    'sio_sort002_07', 'accounting', 'nominal_personal', 'Discount Received A/c',
    'Nominal Account', 'Personal Account', 'a', 2, 5,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Discount received is a gain.'
),
(
    'sio_sort002_08', 'accounting', 'nominal_personal', 'Outstanding Salary A/c',
    'Nominal Account', 'Personal Account', 'b', 3, 10,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Outstanding items are representative personal accounts.'
),
(
    'sio_sort002_09', 'accounting', 'nominal_personal', 'Income Received in Advance A/c',
    'Nominal Account', 'Personal Account', 'b', 3, 10,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Income received in advance is a representative personal account.'
),
(
    'sio_sort002_10', 'accounting', 'nominal_personal', 'Stationery A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Stationery is an expense.'
),
(
    'sio_sort002_11', 'accounting', 'nominal_personal', 'Rohit''s A/c',
    'Nominal Account', 'Personal Account', 'b', 1, 3,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'It records transactions with a named individual.'
),
(
    'sio_sort002_12', 'accounting', 'nominal_personal', 'Wages A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3,
    'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.',
    'Wages are an expense.'
),
(
    'sio_sort003_01', 'accounting', 'nominal_real', 'Salary A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Salary is an expense.'
),
(
    'sio_sort003_02', 'accounting', 'nominal_real', 'Bad Debts A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Bad debts are treated as a loss.'
),
(
    'sio_sort003_03', 'accounting', 'nominal_real', 'Cash at Bank A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Cash at bank is a business asset.'
),
(
    'sio_sort003_04', 'accounting', 'nominal_real', 'Computer A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'A computer is a tangible asset.'
),
(
    'sio_sort003_05', 'accounting', 'nominal_real', 'Audit Fees A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Audit fees are an expense.'
),
(
    'sio_sort003_06', 'accounting', 'nominal_real', 'Depreciation A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Depreciation is treated as an expense.'
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

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_sort003_07', 'accounting', 'nominal_real', 'Sales A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Sales is recorded as income.'
),
(
    'sio_sort003_08', 'accounting', 'nominal_real', 'Patent A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'A patent is an intangible asset.'
),
(
    'sio_sort003_09', 'accounting', 'nominal_real', 'Trademark A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'A trademark is an intangible asset.'
),
(
    'sio_sort003_10', 'accounting', 'nominal_real', 'Interest Received A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Interest received is income.'
),
(
    'sio_sort003_11', 'accounting', 'nominal_real', 'Furniture A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'Furniture is tangible property.'
),
(
    'sio_sort003_12', 'accounting', 'nominal_real', 'Building A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3,
    'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.',
    'A building is tangible property.'
),
(
    'sio_sort004_01', 'accounting', 'artificial_natural', 'Vaibhav''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort004_02', 'accounting', 'artificial_natural', 'Siddhivinayak Trust A/c',
    'Artificial Person', 'Natural Person', 'a', 3, 10,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'A trust is an organization rather than an individual.'
),
(
    'sio_sort004_03', 'accounting', 'artificial_natural', 'Indian Railways A/c',
    'Artificial Person', 'Natural Person', 'a', 3, 10,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It represents an organization rather than an individual.'
),
(
    'sio_sort004_04', 'accounting', 'artificial_natural', 'Sunita''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort004_05', 'accounting', 'artificial_natural', 'Recreation Club A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'A club is an association treated as an artificial person.'
),
(
    'sio_sort004_06', 'accounting', 'artificial_natural', 'Rajesh''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort004_07', 'accounting', 'artificial_natural', 'Sumit''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort004_08', 'accounting', 'artificial_natural', 'Ashok''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort004_09', 'accounting', 'artificial_natural', 'ABC & Co. A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'A company is an organization created by law.'
),
(
    'sio_sort004_10', 'accounting', 'artificial_natural', 'Pune Municipal Corp. A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'A municipal corporation is an organization.'
),
(
    'sio_sort004_11', 'accounting', 'artificial_natural', 'Bank of India A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'A bank organization is treated as an artificial person.'
),
(
    'sio_sort004_12', 'accounting', 'artificial_natural', 'Sushma''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3,
    'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.',
    'It relates to an individual human being.'
),
(
    'sio_sort005_01', 'accounting', 'tangible_intangible', 'Copyright A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'Copyright is an intangible asset.'
),
(
    'sio_sort005_02', 'accounting', 'tangible_intangible', 'Computer A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'A computer is a physical asset.'
),
(
    'sio_sort005_03', 'accounting', 'tangible_intangible', 'Machinery A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'Machinery can be seen and touched.'
),
(
    'sio_sort005_04', 'accounting', 'tangible_intangible', 'Patent A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'A patent is an intangible asset.'
),
(
    'sio_sort005_05', 'accounting', 'tangible_intangible', 'Goodwill A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'Goodwill has monetary value but cannot be touched.'
),
(
    'sio_sort005_06', 'accounting', 'tangible_intangible', 'Trademark A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'A trademark cannot be physically touched.'
),
(
    'sio_sort005_07', 'accounting', 'tangible_intangible', 'Motor Car A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'A motor car can be seen and touched.'
),
(
    'sio_sort005_08', 'accounting', 'tangible_intangible', 'Stock of Goods A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3,
    'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.',
    'Goods in stock are physical property.'
),
(
    'sio_sort006_01', 'accounting', 'assets_liabilities', 'Machinery A/c',
    'Assets', 'Liabilities', 'a', 1, 3,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Machinery is property owned by the business.'
),
(
    'sio_sort006_02', 'accounting', 'assets_liabilities', 'Building A/c',
    'Assets', 'Liabilities', 'a', 1, 3,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'A building is a business asset.'
),
(
    'sio_sort006_03', 'accounting', 'assets_liabilities', 'Bills Payable',
    'Assets', 'Liabilities', 'b', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Bills payable are obligations of the business.'
),
(
    'sio_sort006_04', 'accounting', 'assets_liabilities', 'Bank Loan A/c',
    'Assets', 'Liabilities', 'b', 1, 3,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'A bank loan is an amount owed.'
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

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_sort006_05', 'accounting', 'assets_liabilities', 'Furniture A/c',
    'Assets', 'Liabilities', 'a', 1, 3,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Furniture is property owned by the business.'
),
(
    'sio_sort006_06', 'accounting', 'assets_liabilities', 'Sundry Debtors',
    'Assets', 'Liabilities', 'a', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Sundry debtors are amounts receivable by the business.'
),
(
    'sio_sort006_07', 'accounting', 'assets_liabilities', 'Rent Payable',
    'Assets', 'Liabilities', 'b', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Rent payable is an outstanding obligation.'
),
(
    'sio_sort006_08', 'accounting', 'assets_liabilities', 'Outstanding Expenses A/c',
    'Assets', 'Liabilities', 'b', 3, 10,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Outstanding expenses are classified as liabilities.'
),
(
    'sio_sort006_09', 'accounting', 'assets_liabilities', 'Bills Receivable',
    'Assets', 'Liabilities', 'a', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Bills receivable are classified as assets.'
),
(
    'sio_sort006_10', 'accounting', 'assets_liabilities', 'Bank Overdraft A/c',
    'Assets', 'Liabilities', 'b', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'A bank overdraft is classified as a liability.'
),
(
    'sio_sort006_11', 'accounting', 'assets_liabilities', 'Sundry Creditors',
    'Assets', 'Liabilities', 'b', 1, 3,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Sundry creditors are amounts owed by the business.'
),
(
    'sio_sort006_12', 'accounting', 'assets_liabilities', 'Goodwill A/c',
    'Assets', 'Liabilities', 'a', 2, 5,
    'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.',
    'Goodwill is listed as an asset.'
),
(
    'sio_sort007_01', 'accounting', 'revenues_expenses', 'Loss by Fire A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'A loss by fire is a loss.'
),
(
    'sio_sort007_02', 'accounting', 'revenues_expenses', 'Printing & Stationery',
    'Revenues and Gains', 'Expenses and Losses', 'b', 2, 5,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Printing and stationery are expenses.'
),
(
    'sio_sort007_03', 'accounting', 'revenues_expenses', 'Commission Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Commission received is revenue.'
),
(
    'sio_sort007_04', 'accounting', 'revenues_expenses', 'Audit Fees A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Audit fees are an expense.'
),
(
    'sio_sort007_05', 'accounting', 'revenues_expenses', 'Interest Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Interest received is income.'
),
(
    'sio_sort007_06', 'accounting', 'revenues_expenses', 'Sales A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Sales is recorded as income.'
),
(
    'sio_sort007_07', 'accounting', 'revenues_expenses', 'Repairs & Maintenance',
    'Revenues and Gains', 'Expenses and Losses', 'b', 2, 5,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Repairs and maintenance are expenses.'
),
(
    'sio_sort007_08', 'accounting', 'revenues_expenses', 'Dividend Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Dividend received is income.'
),
(
    'sio_sort007_09', 'accounting', 'revenues_expenses', 'Discount Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Discount received is a gain.'
),
(
    'sio_sort007_10', 'accounting', 'revenues_expenses', 'Wages A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Wages are an expense.'
),
(
    'sio_sort007_11', 'accounting', 'revenues_expenses', 'Electricity Bill',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'An electricity bill is an expense.'
),
(
    'sio_sort007_12', 'accounting', 'revenues_expenses', 'Rent Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.',
    'Rent received is income.'
),
(
    'sio_sort008_01', 'accounting', 'expenses_assets', 'Live Stock A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Livestock is listed among business assets.'
),
(
    'sio_sort008_02', 'accounting', 'expenses_assets', 'Carriage A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Carriage is listed as expenditure.'
),
(
    'sio_sort008_03', 'accounting', 'expenses_assets', 'Prepaid Rent A/c',
    'Expenses and Losses', 'Assets', 'b', 3, 10,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Prepaid rent is a resource paid for in advance.'
),
(
    'sio_sort008_04', 'accounting', 'expenses_assets', 'Freight A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Freight is listed as expenditure.'
),
(
    'sio_sort008_05', 'accounting', 'expenses_assets', 'Bad Debts A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Bad debts are a loss.'
),
(
    'sio_sort008_06', 'accounting', 'expenses_assets', 'Fixed Deposit A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'A fixed deposit is classified as an asset.'
),
(
    'sio_sort008_07', 'accounting', 'expenses_assets', 'Legal Expenses A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Legal expenses are expenditure.'
),
(
    'sio_sort008_08', 'accounting', 'expenses_assets', 'Cash at Bank',
    'Expenses and Losses', 'Assets', 'b', 1, 3,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Cash held at a bank is an asset.'
),
(
    'sio_sort008_09', 'accounting', 'expenses_assets', 'Insurance Premium A/c',
    'Expenses and Losses', 'Assets', 'a', 1, 3,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Insurance premium is an expense.'
),
(
    'sio_sort008_10', 'accounting', 'expenses_assets', 'Computer A/c',
    'Expenses and Losses', 'Assets', 'b', 1, 3,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'A computer is property owned by the business.'
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

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_sort008_11', 'accounting', 'expenses_assets', 'Salary A/c',
    'Expenses and Losses', 'Assets', 'a', 1, 3,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Salary is an expense.'
),
(
    'sio_sort008_12', 'accounting', 'expenses_assets', 'Copyright A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5,
    'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.',
    'Copyright is an intangible asset.'
),
(
    'sio_sort009_01', 'accounting', 'revenues_assets', 'Motor Car A/c',
    'Revenues and Gains', 'Assets', 'b', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'A motor car is a business asset.'
),
(
    'sio_sort009_02', 'accounting', 'revenues_assets', 'Land and Building',
    'Revenues and Gains', 'Assets', 'b', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Land and buildings are business assets.'
),
(
    'sio_sort009_03', 'accounting', 'revenues_assets', 'Discount Received',
    'Revenues and Gains', 'Assets', 'a', 2, 5,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Discount received is a gain.'
),
(
    'sio_sort009_04', 'accounting', 'revenues_assets', 'Rent Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Rent received is income.'
),
(
    'sio_sort009_05', 'accounting', 'revenues_assets', 'Premises A/c',
    'Revenues and Gains', 'Assets', 'b', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Premises are property owned by the business.'
),
(
    'sio_sort009_06', 'accounting', 'revenues_assets', 'Sundry Debtors',
    'Revenues and Gains', 'Assets', 'b', 2, 5,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Sundry debtors represent amounts receivable.'
),
(
    'sio_sort009_07', 'accounting', 'revenues_assets', 'Dividend Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Dividend received is income.'
),
(
    'sio_sort009_08', 'accounting', 'revenues_assets', 'Stock of Stationery',
    'Revenues and Gains', 'Assets', 'b', 3, 10,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Stock of stationery is property held by the business.'
),
(
    'sio_sort009_09', 'accounting', 'revenues_assets', 'Bills Receivable',
    'Revenues and Gains', 'Assets', 'b', 2, 5,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Bills receivable are classified as assets.'
),
(
    'sio_sort009_10', 'accounting', 'revenues_assets', 'Royalty A/c',
    'Revenues and Gains', 'Assets', 'a', 2, 5,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Royalty is listed as income.'
),
(
    'sio_sort009_11', 'accounting', 'revenues_assets', 'Commission Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Commission received is revenue.'
),
(
    'sio_sort009_12', 'accounting', 'revenues_assets', 'Interest on Fixed Deposit',
    'Revenues and Gains', 'Assets', 'a', 2, 5,
    'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.',
    'Interest on a fixed deposit is income.'
),
(
    'sio_sort010_01', 'accounting', 'liabilities_expenses', 'Outstanding Expenses A/c',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Outstanding expenses are obligations.'
),
(
    'sio_sort010_02', 'accounting', 'liabilities_expenses', 'Bank Overdraft A/c',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'A bank overdraft is classified as a liability.'
),
(
    'sio_sort010_03', 'accounting', 'liabilities_expenses', 'Electricity Bill',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'An electricity bill is an expense.'
),
(
    'sio_sort010_04', 'accounting', 'liabilities_expenses', 'Outstanding Rent',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Outstanding rent is an amount payable.'
),
(
    'sio_sort010_05', 'accounting', 'liabilities_expenses', 'Loss by Fire A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'A loss by fire is a loss.'
),
(
    'sio_sort010_06', 'accounting', 'liabilities_expenses', 'Discount Allowed',
    'Liabilities', 'Expenses and Losses', 'b', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Discount allowed is listed as expenditure.'
),
(
    'sio_sort010_07', 'accounting', 'liabilities_expenses', 'Depreciation A/c',
    'Liabilities', 'Expenses and Losses', 'b', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Depreciation is treated as an expense.'
),
(
    'sio_sort010_08', 'accounting', 'liabilities_expenses', 'Bills Payable',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Bills payable are amounts the business must pay.'
),
(
    'sio_sort010_09', 'accounting', 'liabilities_expenses', 'Creditors A/c',
    'Liabilities', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Creditors are amounts owed by the business.'
),
(
    'sio_sort010_10', 'accounting', 'liabilities_expenses', 'Wages A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Wages are an expense.'
),
(
    'sio_sort010_11', 'accounting', 'liabilities_expenses', 'Audit Fees A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'Audit fees are an expense.'
),
(
    'sio_sort010_12', 'accounting', 'liabilities_expenses', 'Bank Loan A/c',
    'Liabilities', 'Expenses and Losses', 'a', 1, 3,
    'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.',
    'A bank loan is an obligation.'
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
