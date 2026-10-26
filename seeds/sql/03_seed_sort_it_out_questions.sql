-- Seeds: Sort It Out questions (265 items)

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_cd_001', 'accounting', 'credit_debit', 'An increase in Cash Account is recorded as a:',
    'Debit', 'Credit', 'a', 1, 10, 'Assets increase on the left side of the ledger.', 'Cash is an asset account. According to standard accounting rules, increases in assets are recorded as debits.'
),
(
    'sio_cd_002', 'accounting', 'credit_debit', 'An increase in Accounts Payable is recorded as a:',
    'Debit', 'Credit', 'b', 1, 10, 'Liabilities increase on the right side of the ledger.', 'Accounts Payable is a liability account. Increases in liabilities are recorded as credits.'
),
(
    'sio_cd_003', 'accounting', 'credit_debit', 'Rent Expense incurred and paid in cash is recorded as a:',
    'Debit', 'Credit', 'a', 1, 10, 'Expenses reduce equity and carry normal debit balances.', 'Rent Expense is an expense account. Increases in expenses are recorded as debits.'
),
(
    'sio_cd_004', 'accounting', 'credit_debit', 'Sales Revenue earned from customers is recorded as a:',
    'Debit', 'Credit', 'b', 1, 10, 'Revenues increase equity on the right side.', 'Sales Revenue is a revenue account that increases owner''s equity, so increases are credited.'
),
(
    'sio_cd_005', 'accounting', 'credit_debit', 'Owner draws cash for personal use. The Drawings account is:',
    'Debit', 'Credit', 'a', 2, 10, 'Drawings contra-account reduces equity and has a debit normal balance.', 'Drawings represent capital withdrawals by the owner and carry a normal debit balance.'
),
(
    'sio_cd_006', 'accounting', 'credit_debit', 'Capital contributed to the business by the proprietor is a:',
    'Debit', 'Credit', 'b', 1, 10, 'Equity contributions increase on the credit side.', 'Capital represents owner equity invested in the enterprise; increases in capital are credited.'
),
(
    'sio_cd_007', 'accounting', 'credit_debit', 'Purchase of Office Equipment for operations is recorded as a:',
    'Debit', 'Credit', 'a', 1, 10, 'Equipment is a tangible non-current asset.', 'Office Equipment is a fixed asset account. An increase in equipment is recorded as a debit.'
),
(
    'sio_cd_008', 'accounting', 'credit_debit', 'Obtaining a bank loan increases the Bank Loan account as a:',
    'Debit', 'Credit', 'b', 2, 10, 'Loans represent liabilities owed to financial institutions.', 'Bank Loan is a liability account. Borrowing funds increases the loan balance via a credit.'
),
(
    'sio_cd_009', 'accounting', 'credit_debit', 'Depreciation Expense recognized for the period is recorded as a:',
    'Debit', 'Credit', 'a', 2, 10, 'Depreciation is an operating expense.', 'Depreciation Expense is charged to the Income Statement and is recorded as a debit.'
),
(
    'sio_cd_010', 'accounting', 'credit_debit', 'Accumulated Depreciation contra-asset account normally carries a:',
    'Debit', 'Credit', 'b', 2, 10, 'Contra-assets offset the asset balance on the opposite side.', 'Accumulated Depreciation is a contra-asset account and carries a normal credit balance to offset asset cost.'
),
(
    'sio_al_001', 'accounting', 'asset_liability', 'Cash and Cash Equivalents in bank accounts:',
    'Asset', 'Liability', 'a', 1, 10, 'Highly liquid economic resource owned by the business.', 'Cash is a current asset representing funds available for immediate business transactions.'
),
(
    'sio_al_002', 'accounting', 'asset_liability', 'Accounts Payable owed to trade vendors for supplies:',
    'Asset', 'Liability', 'b', 1, 10, 'Money owed to outside suppliers for credit purchases.', 'Accounts Payable is a current liability representing obligations to pay suppliers within a short period.'
),
(
    'sio_al_003', 'accounting', 'asset_liability', 'Accounts Receivable due from clients for delivered goods:',
    'Asset', 'Liability', 'a', 1, 10, 'Future cash inflows expected from billed customers.', 'Accounts Receivable is a current asset representing claims for payment from clients for sales on credit.'
),
(
    'sio_al_004', 'accounting', 'asset_liability', 'Bank Overdraft balance on the company checking account:',
    'Asset', 'Liability', 'b', 2, 10, 'Negative bank balance owed to the financial institution.', 'A Bank Overdraft is a short-term liability representing funds borrowed from the bank beyond the account balance.'
),
(
    'sio_al_005', 'accounting', 'asset_liability', 'Patents and Trademarks providing legal rights and future revenues:',
    'Asset', 'Liability', 'a', 2, 10, 'Intangible economic resources owned by the firm.', 'Patents and trademarks are intangible non-current assets expected to generate economic benefits over multiple periods.'
),
(
    'sio_al_006', 'accounting', 'asset_liability', 'Unearned Revenue received in advance of performing services:',
    'Asset', 'Liability', 'b', 2, 10, 'An obligation to deliver goods or services in the future.', 'Unearned Revenue is a liability because the enterprise owes performance or a refund until the service is delivered.'
),
(
    'sio_al_007', 'accounting', 'asset_liability', 'Prepaid Rent paid 6 months in advance:',
    'Asset', 'Liability', 'a', 2, 10, 'A future economic benefit that has already been paid for.', 'Prepaid Rent is a current asset representing the right to occupy premises over future months.'
),
(
    'sio_al_008', 'accounting', 'asset_liability', 'Salaries Payable accrued at month-end for worked hours:',
    'Asset', 'Liability', 'b', 1, 10, 'An unpaid debt owed to employees for past labor.', 'Salaries Payable is a current liability representing wages earned by staff that have not yet been disbursed.'
),
(
    'sio_al_009', 'accounting', 'asset_liability', 'Merchandise Inventory held for sale in store:',
    'Asset', 'Liability', 'a', 1, 10, 'Goods held to be sold in normal business operations.', 'Merchandise Inventory is a current asset expected to be converted into cash through sales.'
),
(
    'sio_al_010', 'accounting', 'asset_liability', 'Long-Term Mortgage Note payable on warehouse real estate:',
    'Asset', 'Liability', 'b', 2, 10, 'A debt obligation with payments extending over multiple years.', 'A Mortgage Note is a non-current liability secured by real property that must be repaid over time.'
),
(
    'sio_tf_001', 'accounting', 'true_false', 'Under Accrual Accounting, revenue is recognized when earned, regardless of cash receipt.',
    'True', 'False', 'a', 1, 10, 'Think about the revenue recognition principle.', 'Under the accrual basis of accounting, revenue is recognized when goods or services are delivered, not when cash changes hands.'
),
(
    'sio_tf_002', 'accounting', 'true_false', 'A Trial Balance proves that no bookkeeping errors or omissions were made in the ledger.',
    'True', 'False', 'b', 2, 10, 'Errors of omission or principle don''t upset debit-credit equality.', 'A Trial Balance only proves mathematical equality of debits and credits. Errors of omission, commission, and principle can still exist.'
),
(
    'sio_tf_003', 'accounting', 'true_false', 'The accounting equation states that Total Assets = Total Liabilities + Owner''s Equity.',
    'True', 'False', 'a', 1, 10, 'This is the cornerstone equation of double-entry bookkeeping.', 'The fundamental accounting equation is Assets = Liabilities + Owner''s Equity, reflecting balance sheet equilibrium.'
),
(
    'sio_tf_004', 'accounting', 'true_false', 'Goodwill is classified as a tangible current asset on the Balance Sheet.',
    'True', 'False', 'b', 2, 10, 'Can you touch or physically hold Goodwill?', 'Goodwill is an intangible non-current asset that arises when a company acquires another business for more than its fair net asset value.'
),
(
    'sio_tf_005', 'accounting', 'true_false', 'The Prudence / Conservatism concept advises anticipating no profit but providing for all possible losses.',
    'True', 'False', 'a', 2, 10, 'A cautious approach to reporting financial performance and asset values.', 'The Conservatism principle ensures assets and income are not overstated and liabilities and expenses are not understated.'
),
(
    'sio_tf_006', 'accounting', 'true_false', 'Depreciation is recorded to show the current secondhand liquidation value of fixed assets.',
    'True', 'False', 'b', 2, 10, 'Is depreciation cost allocation or asset valuation?', 'Depreciation is the systematic allocation of the depreciable cost of an asset over its useful life, not a market valuation mechanism.'
),
(
    'sio_tf_007', 'accounting', 'true_false', 'Under double-entry bookkeeping, every financial transaction impacts at least two accounts.',
    'True', 'False', 'a', 1, 10, 'Every debit must have a corresponding credit.', 'The dual aspect concept requires that every transaction has equal and opposite debit and credit effects on at least two accounts.'
),
(
    'sio_tf_008', 'accounting', 'true_false', 'Cash Dividends paid to corporate stockholders are reported as operating expenses on the Income Statement.',
    'True', 'False', 'b', 2, 10, 'Dividends are a distribution of earned profits.', 'Dividends represent distributions of profits to shareholders from Retained Earnings, not operating expenses of the firm.'
),
(
    'sio_tf_009', 'accounting', 'true_false', 'The Going Concern assumption presumes an enterprise will continue operations for the foreseeable future.',
    'True', 'False', 'a', 1, 10, 'The business is assumed to not liquidate or drastically scale down.', 'Under the Going Concern assumption, financial statements are prepared assuming the entity will operate indefinitely unless evidence suggests otherwise.'
),
(
    'sio_tf_010', 'accounting', 'true_false', 'Drawings made by the business owner increase Owner''s Equity at the end of the fiscal year.',
    'True', 'False', 'b', 1, 10, 'When an owner withdraws money, does their stake in the business grow or shrink?', 'Drawings are withdrawals of cash or assets by the owner for personal use and directly reduce total Owner''s Equity.'
),
(
    'sio_sort001_01', 'accounting', 'real_personal', 'Pune Municipal Corp. A/c',
    'Real Account', 'Personal Account', 'b', 2, 5, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'A corporation is treated as an artificial person.'
),
(
    'sio_sort001_02', 'accounting', 'real_personal', 'Motor Car A/c',
    'Real Account', 'Personal Account', 'a', 1, 3, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'A motor car is a tangible business asset.'
),
(
    'sio_sort001_03', 'accounting', 'real_personal', 'Cash A/c',
    'Real Account', 'Personal Account', 'a', 1, 3, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Cash is a business asset represented by a real account.'
),
(
    'sio_sort001_04', 'accounting', 'real_personal', 'Sunita''s A/c',
    'Real Account', 'Personal Account', 'b', 1, 3, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'It records transactions relating to an individual person.'
),
(
    'sio_sort001_05', 'accounting', 'real_personal', 'Mahesh''s A/c',
    'Real Account', 'Personal Account', 'b', 1, 3, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'It records dealings with a named individual.'
),
(
    'sio_sort001_06', 'accounting', 'real_personal', 'Copyright A/c',
    'Real Account', 'Personal Account', 'a', 2, 5, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Copyright is an intangible asset.'
),
(
    'sio_sort001_07', 'accounting', 'real_personal', 'Goodwill A/c',
    'Real Account', 'Personal Account', 'a', 2, 5, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Goodwill is an intangible asset.'
),
(
    'sio_sort001_08', 'accounting', 'real_personal', 'Stock of Goods A/c',
    'Real Account', 'Personal Account', 'a', 2, 5, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Stock of goods is property owned by the business.'
),
(
    'sio_sort001_09', 'accounting', 'real_personal', 'Prepaid Wages A/c',
    'Real Account', 'Personal Account', 'b', 3, 10, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Prepaid items are representative personal accounts.'
),
(
    'sio_sort001_10', 'accounting', 'real_personal', 'Outstanding Rent A/c',
    'Real Account', 'Personal Account', 'b', 3, 10, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Outstanding items are treated as representative personal accounts.'
),
(
    'sio_sort001_11', 'accounting', 'real_personal', 'Bank of India A/c',
    'Real Account', 'Personal Account', 'b', 2, 5, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'It represents an organization treated as an artificial person.'
),
(
    'sio_sort001_12', 'accounting', 'real_personal', 'Machinery A/c',
    'Real Account', 'Personal Account', 'a', 1, 3, 'Recall: Real accounts represent business property/assets; Personal accounts represent individuals, firms, or institutions.', 'Machinery is property owned by the business.'
),
(
    'sio_sort002_01', 'accounting', 'nominal_personal', 'Bank of Maharashtra A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'A bank is treated as an artificial person.'
),
(
    'sio_sort002_02', 'accounting', 'nominal_personal', 'Commission Received A/c',
    'Nominal Account', 'Personal Account', 'a', 2, 5, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Commission received is income.'
),
(
    'sio_sort002_03', 'accounting', 'nominal_personal', 'Loan A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'The loan account is classified as personal in the examples.'
),
(
    'sio_sort002_04', 'accounting', 'nominal_personal', 'Radhika Sports Club A/c',
    'Nominal Account', 'Personal Account', 'b', 2, 5, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'An association is treated as an artificial person.'
),
(
    'sio_sort002_05', 'accounting', 'nominal_personal', 'Loss by Fire A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Losses are recorded in nominal accounts.'
),
(
    'sio_sort002_06', 'accounting', 'nominal_personal', 'Repairs A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Repairs are an expense.'
),
(
    'sio_sort002_07', 'accounting', 'nominal_personal', 'Discount Received A/c',
    'Nominal Account', 'Personal Account', 'a', 2, 5, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Discount received is a gain.'
),
(
    'sio_sort002_08', 'accounting', 'nominal_personal', 'Outstanding Salary A/c',
    'Nominal Account', 'Personal Account', 'b', 3, 10, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Outstanding items are representative personal accounts.'
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
    'sio_sort002_09', 'accounting', 'nominal_personal', 'Income Received in Advance A/c',
    'Nominal Account', 'Personal Account', 'b', 3, 10, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Income received in advance is a representative personal account.'
),
(
    'sio_sort002_10', 'accounting', 'nominal_personal', 'Stationery A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Stationery is an expense.'
),
(
    'sio_sort002_11', 'accounting', 'nominal_personal', 'Rohit''s A/c',
    'Nominal Account', 'Personal Account', 'b', 1, 3, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'It records transactions with a named individual.'
),
(
    'sio_sort002_12', 'accounting', 'nominal_personal', 'Wages A/c',
    'Nominal Account', 'Personal Account', 'a', 1, 3, 'Recall: Nominal accounts track expenses, losses, incomes, and gains; Personal accounts represent persons or institutions.', 'Wages are an expense.'
),
(
    'sio_sort003_01', 'accounting', 'nominal_real', 'Salary A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Salary is an expense.'
),
(
    'sio_sort003_02', 'accounting', 'nominal_real', 'Bad Debts A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Bad debts are treated as a loss.'
),
(
    'sio_sort003_03', 'accounting', 'nominal_real', 'Cash at Bank A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Cash at bank is a business asset.'
),
(
    'sio_sort003_04', 'accounting', 'nominal_real', 'Computer A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'A computer is a tangible asset.'
),
(
    'sio_sort003_05', 'accounting', 'nominal_real', 'Audit Fees A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Audit fees are an expense.'
),
(
    'sio_sort003_06', 'accounting', 'nominal_real', 'Depreciation A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Depreciation is treated as an expense.'
),
(
    'sio_sort003_07', 'accounting', 'nominal_real', 'Sales A/c',
    'Nominal Account', 'Real Account', 'a', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Sales is recorded as income.'
),
(
    'sio_sort003_08', 'accounting', 'nominal_real', 'Patent A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'A patent is an intangible asset.'
),
(
    'sio_sort003_09', 'accounting', 'nominal_real', 'Trademark A/c',
    'Nominal Account', 'Real Account', 'b', 2, 5, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'A trademark is an intangible asset.'
),
(
    'sio_sort003_10', 'accounting', 'nominal_real', 'Interest Received A/c',
    'Nominal Account', 'Real Account', 'a', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Interest received is income.'
),
(
    'sio_sort003_11', 'accounting', 'nominal_real', 'Furniture A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'Furniture is tangible property.'
),
(
    'sio_sort003_12', 'accounting', 'nominal_real', 'Building A/c',
    'Nominal Account', 'Real Account', 'b', 1, 3, 'Recall: Nominal accounts record expenses, losses, incomes, and gains; Real accounts represent properties and assets.', 'A building is tangible property.'
),
(
    'sio_sort004_01', 'accounting', 'artificial_natural', 'Vaibhav''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort004_02', 'accounting', 'artificial_natural', 'Siddhivinayak Trust A/c',
    'Artificial Person', 'Natural Person', 'a', 3, 10, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'A trust is an organization rather than an individual.'
),
(
    'sio_sort004_03', 'accounting', 'artificial_natural', 'Indian Railways A/c',
    'Artificial Person', 'Natural Person', 'a', 3, 10, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It represents an organization rather than an individual.'
),
(
    'sio_sort004_04', 'accounting', 'artificial_natural', 'Sunita''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort004_05', 'accounting', 'artificial_natural', 'Recreation Club A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'A club is an association treated as an artificial person.'
),
(
    'sio_sort004_06', 'accounting', 'artificial_natural', 'Rajesh''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort004_07', 'accounting', 'artificial_natural', 'Sumit''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort004_08', 'accounting', 'artificial_natural', 'Ashok''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort004_09', 'accounting', 'artificial_natural', 'ABC & Co. A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'A company is an organization created by law.'
),
(
    'sio_sort004_10', 'accounting', 'artificial_natural', 'Pune Municipal Corp. A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'A municipal corporation is an organization.'
),
(
    'sio_sort004_11', 'accounting', 'artificial_natural', 'Bank of India A/c',
    'Artificial Person', 'Natural Person', 'a', 2, 5, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'A bank organization is treated as an artificial person.'
),
(
    'sio_sort004_12', 'accounting', 'artificial_natural', 'Sushma''s A/c',
    'Artificial Person', 'Natural Person', 'b', 1, 3, 'Recall: Natural persons are living individual human beings; Artificial persons are entities recognized by law.', 'It relates to an individual human being.'
),
(
    'sio_sort005_01', 'accounting', 'tangible_intangible', 'Copyright A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'Copyright is an intangible asset.'
),
(
    'sio_sort005_02', 'accounting', 'tangible_intangible', 'Computer A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'A computer is a physical asset.'
),
(
    'sio_sort005_03', 'accounting', 'tangible_intangible', 'Machinery A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'Machinery can be seen and touched.'
),
(
    'sio_sort005_04', 'accounting', 'tangible_intangible', 'Patent A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'A patent is an intangible asset.'
),
(
    'sio_sort005_05', 'accounting', 'tangible_intangible', 'Goodwill A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'Goodwill has monetary value but cannot be touched.'
),
(
    'sio_sort005_06', 'accounting', 'tangible_intangible', 'Trademark A/c',
    'Tangible Real Account', 'Intangible Real Account', 'b', 2, 5, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'A trademark cannot be physically touched.'
),
(
    'sio_sort005_07', 'accounting', 'tangible_intangible', 'Motor Car A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'A motor car can be seen and touched.'
),
(
    'sio_sort005_08', 'accounting', 'tangible_intangible', 'Stock of Goods A/c',
    'Tangible Real Account', 'Intangible Real Account', 'a', 1, 3, 'Recall: Tangible real accounts have physical existence (can be touched); Intangible real accounts have monetary value without physical form.', 'Goods in stock are physical property.'
),
(
    'sio_sort006_01', 'accounting', 'assets_liabilities', 'Machinery A/c',
    'Assets', 'Liabilities', 'a', 1, 3, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Machinery is property owned by the business.'
),
(
    'sio_sort006_02', 'accounting', 'assets_liabilities', 'Building A/c',
    'Assets', 'Liabilities', 'a', 1, 3, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'A building is a business asset.'
),
(
    'sio_sort006_03', 'accounting', 'assets_liabilities', 'Bills Payable',
    'Assets', 'Liabilities', 'b', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Bills payable are obligations of the business.'
),
(
    'sio_sort006_04', 'accounting', 'assets_liabilities', 'Bank Loan A/c',
    'Assets', 'Liabilities', 'b', 1, 3, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'A bank loan is an amount owed.'
),
(
    'sio_sort006_05', 'accounting', 'assets_liabilities', 'Furniture A/c',
    'Assets', 'Liabilities', 'a', 1, 3, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Furniture is property owned by the business.'
),
(
    'sio_sort006_06', 'accounting', 'assets_liabilities', 'Sundry Debtors',
    'Assets', 'Liabilities', 'a', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Sundry debtors are amounts receivable by the business.'
),
(
    'sio_sort006_07', 'accounting', 'assets_liabilities', 'Rent Payable',
    'Assets', 'Liabilities', 'b', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Rent payable is an outstanding obligation.'
),
(
    'sio_sort006_08', 'accounting', 'assets_liabilities', 'Outstanding Expenses A/c',
    'Assets', 'Liabilities', 'b', 3, 10, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Outstanding expenses are classified as liabilities.'
),
(
    'sio_sort006_09', 'accounting', 'assets_liabilities', 'Bills Receivable',
    'Assets', 'Liabilities', 'a', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Bills receivable are classified as assets.'
),
(
    'sio_sort006_10', 'accounting', 'assets_liabilities', 'Bank Overdraft A/c',
    'Assets', 'Liabilities', 'b', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'A bank overdraft is classified as a liability.'
),
(
    'sio_sort006_11', 'accounting', 'assets_liabilities', 'Sundry Creditors',
    'Assets', 'Liabilities', 'b', 1, 3, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Sundry creditors are amounts owed by the business.'
),
(
    'sio_sort006_12', 'accounting', 'assets_liabilities', 'Goodwill A/c',
    'Assets', 'Liabilities', 'a', 2, 5, 'Recall: Assets are properties and receivables owned by the business; Liabilities are amounts and debts owed to outsiders.', 'Goodwill is listed as an asset.'
),
(
    'sio_sort007_01', 'accounting', 'revenues_expenses', 'Loss by Fire A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'A loss by fire is a loss.'
),
(
    'sio_sort007_02', 'accounting', 'revenues_expenses', 'Printing & Stationery',
    'Revenues and Gains', 'Expenses and Losses', 'b', 2, 5, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Printing and stationery are expenses.'
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
    'sio_sort007_03', 'accounting', 'revenues_expenses', 'Commission Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Commission received is revenue.'
),
(
    'sio_sort007_04', 'accounting', 'revenues_expenses', 'Audit Fees A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Audit fees are an expense.'
),
(
    'sio_sort007_05', 'accounting', 'revenues_expenses', 'Interest Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Interest received is income.'
),
(
    'sio_sort007_06', 'accounting', 'revenues_expenses', 'Sales A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 2, 5, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Sales is recorded as income.'
),
(
    'sio_sort007_07', 'accounting', 'revenues_expenses', 'Repairs & Maintenance',
    'Revenues and Gains', 'Expenses and Losses', 'b', 2, 5, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Repairs and maintenance are expenses.'
),
(
    'sio_sort007_08', 'accounting', 'revenues_expenses', 'Dividend Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Dividend received is income.'
),
(
    'sio_sort007_09', 'accounting', 'revenues_expenses', 'Discount Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 2, 5, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Discount received is a gain.'
),
(
    'sio_sort007_10', 'accounting', 'revenues_expenses', 'Wages A/c',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Wages are an expense.'
),
(
    'sio_sort007_11', 'accounting', 'revenues_expenses', 'Electricity Bill',
    'Revenues and Gains', 'Expenses and Losses', 'b', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'An electricity bill is an expense.'
),
(
    'sio_sort007_12', 'accounting', 'revenues_expenses', 'Rent Received A/c',
    'Revenues and Gains', 'Expenses and Losses', 'a', 1, 3, 'Recall: Revenues and gains are earnings or financial concessions; Expenses and losses are operating costs or damages.', 'Rent received is income.'
),
(
    'sio_sort008_01', 'accounting', 'expenses_assets', 'Live Stock A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Livestock is listed among business assets.'
),
(
    'sio_sort008_02', 'accounting', 'expenses_assets', 'Carriage A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Carriage is listed as expenditure.'
),
(
    'sio_sort008_03', 'accounting', 'expenses_assets', 'Prepaid Rent A/c',
    'Expenses and Losses', 'Assets', 'b', 3, 10, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Prepaid rent is a resource paid for in advance.'
),
(
    'sio_sort008_04', 'accounting', 'expenses_assets', 'Freight A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Freight is listed as expenditure.'
),
(
    'sio_sort008_05', 'accounting', 'expenses_assets', 'Bad Debts A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Bad debts are a loss.'
),
(
    'sio_sort008_06', 'accounting', 'expenses_assets', 'Fixed Deposit A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'A fixed deposit is classified as an asset.'
),
(
    'sio_sort008_07', 'accounting', 'expenses_assets', 'Legal Expenses A/c',
    'Expenses and Losses', 'Assets', 'a', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Legal expenses are expenditure.'
),
(
    'sio_sort008_08', 'accounting', 'expenses_assets', 'Cash at Bank',
    'Expenses and Losses', 'Assets', 'b', 1, 3, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Cash held at a bank is an asset.'
),
(
    'sio_sort008_09', 'accounting', 'expenses_assets', 'Insurance Premium A/c',
    'Expenses and Losses', 'Assets', 'a', 1, 3, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Insurance premium is an expense.'
),
(
    'sio_sort008_10', 'accounting', 'expenses_assets', 'Computer A/c',
    'Expenses and Losses', 'Assets', 'b', 1, 3, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'A computer is property owned by the business.'
),
(
    'sio_sort008_11', 'accounting', 'expenses_assets', 'Salary A/c',
    'Expenses and Losses', 'Assets', 'a', 1, 3, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Salary is an expense.'
),
(
    'sio_sort008_12', 'accounting', 'expenses_assets', 'Copyright A/c',
    'Expenses and Losses', 'Assets', 'b', 2, 5, 'Recall: Expenses/losses represent revenue disbursements or write-offs; Assets represent property or resources owned.', 'Copyright is an intangible asset.'
),
(
    'sio_sort009_01', 'accounting', 'revenues_assets', 'Motor Car A/c',
    'Revenues and Gains', 'Assets', 'b', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'A motor car is a business asset.'
),
(
    'sio_sort009_02', 'accounting', 'revenues_assets', 'Land and Building',
    'Revenues and Gains', 'Assets', 'b', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Land and buildings are business assets.'
),
(
    'sio_sort009_03', 'accounting', 'revenues_assets', 'Discount Received',
    'Revenues and Gains', 'Assets', 'a', 2, 5, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Discount received is a gain.'
),
(
    'sio_sort009_04', 'accounting', 'revenues_assets', 'Rent Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Rent received is income.'
),
(
    'sio_sort009_05', 'accounting', 'revenues_assets', 'Premises A/c',
    'Revenues and Gains', 'Assets', 'b', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Premises are property owned by the business.'
),
(
    'sio_sort009_06', 'accounting', 'revenues_assets', 'Sundry Debtors',
    'Revenues and Gains', 'Assets', 'b', 2, 5, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Sundry debtors represent amounts receivable.'
),
(
    'sio_sort009_07', 'accounting', 'revenues_assets', 'Dividend Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Dividend received is income.'
),
(
    'sio_sort009_08', 'accounting', 'revenues_assets', 'Stock of Stationery',
    'Revenues and Gains', 'Assets', 'b', 3, 10, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Stock of stationery is property held by the business.'
),
(
    'sio_sort009_09', 'accounting', 'revenues_assets', 'Bills Receivable',
    'Revenues and Gains', 'Assets', 'b', 2, 5, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Bills receivable are classified as assets.'
),
(
    'sio_sort009_10', 'accounting', 'revenues_assets', 'Royalty A/c',
    'Revenues and Gains', 'Assets', 'a', 2, 5, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Royalty is listed as income.'
),
(
    'sio_sort009_11', 'accounting', 'revenues_assets', 'Commission Received A/c',
    'Revenues and Gains', 'Assets', 'a', 1, 3, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Commission received is revenue.'
),
(
    'sio_sort009_12', 'accounting', 'revenues_assets', 'Interest on Fixed Deposit',
    'Revenues and Gains', 'Assets', 'a', 2, 5, 'Recall: Revenues and gains represent earned returns or income; Assets are tangible or intangible properties owned.', 'Interest on a fixed deposit is income.'
),
(
    'sio_sort010_01', 'accounting', 'liabilities_expenses', 'Outstanding Expenses A/c',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Outstanding expenses are obligations.'
),
(
    'sio_sort010_02', 'accounting', 'liabilities_expenses', 'Bank Overdraft A/c',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'A bank overdraft is classified as a liability.'
),
(
    'sio_sort010_03', 'accounting', 'liabilities_expenses', 'Electricity Bill',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'An electricity bill is an expense.'
),
(
    'sio_sort010_04', 'accounting', 'liabilities_expenses', 'Outstanding Rent',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Outstanding rent is an amount payable.'
),
(
    'sio_sort010_05', 'accounting', 'liabilities_expenses', 'Loss by Fire A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'A loss by fire is a loss.'
),
(
    'sio_sort010_06', 'accounting', 'liabilities_expenses', 'Discount Allowed',
    'Liabilities', 'Expenses and Losses', 'b', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Discount allowed is listed as expenditure.'
),
(
    'sio_sort010_07', 'accounting', 'liabilities_expenses', 'Depreciation A/c',
    'Liabilities', 'Expenses and Losses', 'b', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Depreciation is treated as an expense.'
),
(
    'sio_sort010_08', 'accounting', 'liabilities_expenses', 'Bills Payable',
    'Liabilities', 'Expenses and Losses', 'a', 2, 5, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Bills payable are amounts the business must pay.'
),
(
    'sio_sort010_09', 'accounting', 'liabilities_expenses', 'Creditors A/c',
    'Liabilities', 'Expenses and Losses', 'a', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Creditors are amounts owed by the business.'
),
(
    'sio_sort010_10', 'accounting', 'liabilities_expenses', 'Wages A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Wages are an expense.'
),
(
    'sio_sort010_11', 'accounting', 'liabilities_expenses', 'Audit Fees A/c',
    'Liabilities', 'Expenses and Losses', 'b', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'Audit fees are an expense.'
),
(
    'sio_sort010_12', 'accounting', 'liabilities_expenses', 'Bank Loan A/c',
    'Liabilities', 'Expenses and Losses', 'a', 1, 3, 'Recall: Liabilities are debts or claims payable to outside parties; Expenses and losses are operational expenditures.', 'A bank loan is an obligation.'
),
(
    'sio_acc_ch1_s001_01', 'accounting', 'bookkeeping_accountancy', 'Annual details',
    'Book-keeping', 'Accountancy', 'b', 3, 10, NULL, 'Accountancy provides details for the entire year.'
),
(
    'sio_acc_ch1_s001_02', 'accounting', 'bookkeeping_accountancy', 'Business decisions',
    'Book-keeping', 'Accountancy', 'b', 3, 10, NULL, 'Accountancy information supports critical management decisions.'
),
(
    'sio_acc_ch1_s001_03', 'accounting', 'bookkeeping_accountancy', 'Profit and Loss A/c',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL, 'Profit and Loss Account is an outcome of accountancy.'
),
(
    'sio_acc_ch1_s001_04', 'accounting', 'bookkeeping_accountancy', 'Recording day-to-day transactions',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL, 'Recording daily business transactions is the primary function of book-keeping.'
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
    'sio_acc_ch1_s001_05', 'accounting', 'bookkeeping_accountancy', 'Analysis and interpretation',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL, 'Accountancy includes analysing and interpreting financial data.'
),
(
    'sio_acc_ch1_s001_06', 'accounting', 'bookkeeping_accountancy', 'Daily details',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL, 'Book-keeping provides day-to-day details of transactions.'
),
(
    'sio_acc_ch1_s001_07', 'accounting', 'bookkeeping_accountancy', 'Financial statements',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL, 'Accountancy prepares financial statements to communicate financial information.'
),
(
    'sio_acc_ch1_s001_08', 'accounting', 'bookkeeping_accountancy', 'Primary stage',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL, 'Book-keeping is the primary stage of the accounting process.'
),
(
    'sio_acc_ch1_s001_09', 'accounting', 'bookkeeping_accountancy', 'Junior staff',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL, 'Junior staff are responsible for maintaining book-keeping records.'
),
(
    'sio_acc_ch1_s001_10', 'accounting', 'bookkeeping_accountancy', 'Journal and Ledger',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL, 'Book-keeping primarily produces journal and ledger records.'
),
(
    'sio_acc_ch1_s001_11', 'accounting', 'bookkeeping_accountancy', 'Senior staff',
    'Book-keeping', 'Accountancy', 'b', 2, 5, NULL, 'Senior staff are responsible for keeping accounts at the accountancy stage.'
),
(
    'sio_acc_ch1_s001_12', 'accounting', 'bookkeeping_accountancy', 'No analytical skill',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL, 'Book-keeping does not require analytical skill.'
),
(
    'sio_acc_ch1_s002_01', 'accounting', 'accrual_cash', 'Expenses payable',
    'Accrual Basis', 'Cash Basis', 'a', 3, 10, NULL, 'Accrual basis includes expenses incurred but not yet paid.'
),
(
    'sio_acc_ch1_s002_02', 'accounting', 'accrual_cash', 'Receipts on collection',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL, 'Cash basis records actual cash receipts.'
),
(
    'sio_acc_ch1_s002_03', 'accounting', 'accrual_cash', 'Income earned unpaid',
    'Accrual Basis', 'Cash Basis', 'a', 2, 5, NULL, 'Accrual basis records income when earned even if cash is not received.'
),
(
    'sio_acc_ch1_s002_04', 'accounting', 'accrual_cash', 'Revenue accrued',
    'Accrual Basis', 'Cash Basis', 'a', 3, 10, NULL, 'Accrual basis recognises revenue when it is earned or accrued.'
),
(
    'sio_acc_ch1_s002_05', 'accounting', 'accrual_cash', 'Payments on settlement',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL, 'Cash basis records actual cash payments.'
),
(
    'sio_acc_ch1_s002_06', 'accounting', 'accrual_cash', 'Income received',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL, 'Cash basis records revenue when cash is received.'
),
(
    'sio_acc_ch1_s002_07', 'accounting', 'accrual_cash', 'Expense incurred unpaid',
    'Accrual Basis', 'Cash Basis', 'a', 2, 5, NULL, 'Accrual basis records expenses when incurred even if unpaid.'
),
(
    'sio_acc_ch1_s002_08', 'accounting', 'accrual_cash', 'Expense paid',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL, 'Cash basis records expenses when cash is paid.'
),
(
    'sio_acc_ch1_s003_01', 'accounting', 'nonmonetary_monetary', 'Credit sale',
    'Non-Monetary', 'Monetary', 'b', 2, 5, NULL, 'A credit sale involves money or money’s worth payable later.'
),
(
    'sio_acc_ch1_s003_02', 'accounting', 'nonmonetary_monetary', 'Machinery on credit',
    'Non-Monetary', 'Monetary', 'b', 3, 10, NULL, 'A credit sale of machinery involves money’s worth.'
),
(
    'sio_acc_ch1_s003_03', 'accounting', 'nonmonetary_monetary', 'Management efficiency',
    'Non-Monetary', 'Monetary', 'a', 3, 10, NULL, 'Management efficiency is not recorded under money measurement when it cannot be expressed in money.'
),
(
    'sio_acc_ch1_s003_04', 'accounting', 'nonmonetary_monetary', 'Workplace conditions',
    'Non-Monetary', 'Monetary', 'a', 3, 10, NULL, 'Workplace conditions cannot be expressed in monetary terms.'
),
(
    'sio_acc_ch1_s003_05', 'accounting', 'nonmonetary_monetary', 'Salary payment',
    'Non-Monetary', 'Monetary', 'b', 1, 3, NULL, 'A salary payment involves an exchange of money.'
),
(
    'sio_acc_ch1_s003_06', 'accounting', 'nonmonetary_monetary', 'Barter exchange',
    'Non-Monetary', 'Monetary', 'a', 1, 3, NULL, 'Barter exchanges one thing for another without money or money’s worth.'
),
(
    'sio_acc_ch1_s003_07', 'accounting', 'nonmonetary_monetary', 'Goods for goods',
    'Non-Monetary', 'Monetary', 'a', 1, 3, NULL, 'Exchanging goods directly for other goods is a barter transaction.'
),
(
    'sio_acc_ch1_s003_08', 'accounting', 'nonmonetary_monetary', 'Immediate goods purchase',
    'Non-Monetary', 'Monetary', 'b', 1, 3, NULL, 'A cash purchase directly involves money.'
),
(
    'sio_acc_ch1_s004_01', 'accounting', 'cash_credit', 'Receipt at later date',
    'Cash Transaction', 'Credit Transaction', 'b', 3, 10, NULL, 'A credit transaction may be settled after the transaction date.'
),
(
    'sio_acc_ch1_s004_02', 'accounting', 'cash_credit', 'Payment next month',
    'Cash Transaction', 'Credit Transaction', 'b', 2, 5, NULL, 'Payment deferred until a later date is characteristic of a credit transaction.'
),
(
    'sio_acc_ch1_s004_03', 'accounting', 'cash_credit', 'Immediate receipt',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL, 'A cash transaction involves immediate receipt of cash.'
),
(
    'sio_acc_ch1_s004_04', 'accounting', 'cash_credit', 'Payment at purchase',
    'Cash Transaction', 'Credit Transaction', 'a', 2, 5, NULL, 'Payment made at the time of purchase makes the transaction a cash transaction.'
),
(
    'sio_acc_ch1_s004_05', 'accounting', 'cash_credit', 'Machinery sold on credit',
    'Cash Transaction', 'Credit Transaction', 'b', 2, 5, NULL, 'The machinery payment is received at a later date in a credit transaction.'
),
(
    'sio_acc_ch1_s004_06', 'accounting', 'cash_credit', 'Goods purchase paid immediately',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL, 'A cash purchase involves immediate payment.'
),
(
    'sio_acc_ch1_s004_07', 'accounting', 'cash_credit', 'Goods sold on credit',
    'Cash Transaction', 'Credit Transaction', 'b', 1, 3, NULL, 'A credit sale does not involve immediate cash receipt.'
),
(
    'sio_acc_ch1_s004_08', 'accounting', 'cash_credit', 'Salary paid',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL, 'Salary paid immediately is a cash transaction.'
),
(
    'sio_acc_ch1_s005_01', 'accounting', 'capital_revenue_expenditure', 'Computer purchase',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL, 'Purchasing a computer provides a long-term business benefit.'
),
(
    'sio_acc_ch1_s005_02', 'accounting', 'capital_revenue_expenditure', 'Salary paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL, 'Salary is a routine operating expense with short-term benefit.'
),
(
    'sio_acc_ch1_s005_03', 'accounting', 'capital_revenue_expenditure', 'Purchase of machinery',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL, 'Machinery is a fixed asset acquired through capital expenditure.'
),
(
    'sio_acc_ch1_s005_04', 'accounting', 'capital_revenue_expenditure', 'Building extension',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL, 'Extending a building increases the value of a fixed asset.'
),
(
    'sio_acc_ch1_s005_05', 'accounting', 'capital_revenue_expenditure', 'Wages paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL, 'Wages are normal operating expenses.'
),
(
    'sio_acc_ch1_s005_06', 'accounting', 'capital_revenue_expenditure', 'Fixed asset improvement',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 2, 5, NULL, 'Spending to increase a fixed asset’s value is capital expenditure.'
),
(
    'sio_acc_ch1_s005_07', 'accounting', 'capital_revenue_expenditure', 'Rent paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL, 'Rent is a normal day-to-day operating expense.'
),
(
    'sio_acc_ch1_s005_08', 'accounting', 'capital_revenue_expenditure', 'Daily operating costs',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 3, 10, NULL, 'Routine costs with immediate or short-term benefit are revenue expenditure.'
),
(
    'sio_acc_ch1_s006_01', 'accounting', 'cash_trade_discount', 'Spot payment allowance',
    'Cash Discount', 'Trade Discount', 'a', 3, 10, NULL, 'Cash discount may be given for spot payment.'
),
(
    'sio_acc_ch1_s006_02', 'accounting', 'cash_trade_discount', 'Net goods value',
    'Cash Discount', 'Trade Discount', 'b', 2, 5, NULL, 'Goods are recorded at their value after deducting trade discount.'
),
(
    'sio_acc_ch1_s006_03', 'accounting', 'cash_trade_discount', 'Prompt payment concession',
    'Cash Discount', 'Trade Discount', 'a', 1, 3, NULL, 'Cash discount encourages prompt payment.'
),
(
    'sio_acc_ch1_s006_04', 'accounting', 'cash_trade_discount', 'Appears in accounts',
    'Cash Discount', 'Trade Discount', 'a', 2, 5, NULL, 'Cash discount appears in the books of accounts.'
),
(
    'sio_acc_ch1_s006_05', 'accounting', 'cash_trade_discount', 'List price reduction',
    'Cash Discount', 'Trade Discount', 'b', 1, 3, NULL, 'Trade discount reduces the list price used to calculate the recorded net value.'
),
(
    'sio_acc_ch1_s006_06', 'accounting', 'cash_trade_discount', 'Catalogue price allowance',
    'Cash Discount', 'Trade Discount', 'b', 1, 3, NULL, 'Trade discount is allowed on the catalogue or list price of goods.'
),
(
    'sio_acc_ch1_s006_07', 'accounting', 'cash_trade_discount', 'Deduction when paid',
    'Cash Discount', 'Trade Discount', 'a', 1, 3, NULL, 'Cash discount is deducted from the final amount due at receipt.'
),
(
    'sio_acc_ch1_s006_08', 'accounting', 'cash_trade_discount', 'Not separately recorded',
    'Cash Discount', 'Trade Discount', 'b', 2, 5, NULL, 'Trade discount does not appear separately in the books of accounts.'
),
(
    'sio_acc_ch1_s007_01', 'accounting', 'fixed_current_assets', 'Cash at bank',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL, 'Cash at bank is a current asset readily available for use.'
),
(
    'sio_acc_ch1_s007_02', 'accounting', 'fixed_current_assets', 'Bills receivable',
    'Fixed Assets', 'Current Assets', 'b', 2, 5, NULL, 'Bills receivable are classified as current assets.'
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
    'sio_acc_ch1_s007_03', 'accounting', 'fixed_current_assets', 'Plant and machinery',
    'Fixed Assets', 'Current Assets', 'a', 1, 3, NULL, 'Plant and machinery are fixed assets providing long-term benefit.'
),
(
    'sio_acc_ch1_s007_04', 'accounting', 'fixed_current_assets', 'Debtors',
    'Fixed Assets', 'Current Assets', 'b', 2, 5, NULL, 'Debtors are listed among current assets.'
),
(
    'sio_acc_ch1_s007_05', 'accounting', 'fixed_current_assets', 'Land and building',
    'Fixed Assets', 'Current Assets', 'a', 1, 3, NULL, 'Land and building provide long-term benefit to the business.'
),
(
    'sio_acc_ch1_s007_06', 'accounting', 'fixed_current_assets', 'Stock',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL, 'Stock is held for the operating year and is a current asset.'
),
(
    'sio_acc_ch1_s007_07', 'accounting', 'fixed_current_assets', 'Goodwill',
    'Fixed Assets', 'Current Assets', 'a', 3, 10, NULL, 'Goodwill is identified as an intangible fixed asset.'
),
(
    'sio_acc_ch1_s007_08', 'accounting', 'fixed_current_assets', 'Cash in hand',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL, 'Cash in hand can be used immediately and is a current asset.'
),
(
    'sio_acc_ch1_s008_01', 'accounting', 'liabilities_assets', 'Outstanding expenses',
    'Liabilities', 'Assets', 'a', 3, 10, NULL, 'Outstanding expenses are amounts due from the business to others.'
),
(
    'sio_acc_ch1_s008_02', 'accounting', 'liabilities_assets', 'Loan taken',
    'Liabilities', 'Assets', 'a', 1, 3, NULL, 'A loan taken is an amount payable by the business.'
),
(
    'sio_acc_ch1_s008_03', 'accounting', 'liabilities_assets', 'Patents',
    'Liabilities', 'Assets', 'b', 2, 5, NULL, 'Patents are rights with monetary value and are assets.'
),
(
    'sio_acc_ch1_s008_04', 'accounting', 'liabilities_assets', 'Land',
    'Liabilities', 'Assets', 'b', 1, 3, NULL, 'Land owned by the business has monetary value and is an asset.'
),
(
    'sio_acc_ch1_s008_05', 'accounting', 'liabilities_assets', 'Creditors',
    'Liabilities', 'Assets', 'a', 1, 3, NULL, 'Creditors are parties to whom the business owes money.'
),
(
    'sio_acc_ch1_s008_06', 'accounting', 'liabilities_assets', 'Goodwill',
    'Liabilities', 'Assets', 'b', 1, 3, NULL, 'Goodwill is an intangible asset of the business.'
),
(
    'sio_acc_ch1_s008_07', 'accounting', 'liabilities_assets', 'Bank overdraft',
    'Liabilities', 'Assets', 'a', 2, 5, NULL, 'A bank overdraft is an amount payable by the business.'
),
(
    'sio_acc_ch1_s008_08', 'accounting', 'liabilities_assets', 'Cash at bank',
    'Liabilities', 'Assets', 'b', 1, 3, NULL, 'Cash at bank is a resource owned by the business.'
),
(
    'sio_acc_ch1_s009_01', 'accounting', 'npo_trading', 'Profit-making business',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL, 'A trading concern is established to earn profit.'
),
(
    'sio_acc_ch1_s009_02', 'accounting', 'npo_trading', 'Goods sold for profit',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL, 'A trading concern sells goods with the objective of earning profit.'
),
(
    'sio_acc_ch1_s009_03', 'accounting', 'npo_trading', 'Service to society',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 3, 10, NULL, 'A not-for-profit concern is established to render services to society.'
),
(
    'sio_acc_ch1_s009_04', 'accounting', 'npo_trading', 'Sports club',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL, 'A sports club is given as an example of a not-for-profit concern.'
),
(
    'sio_acc_ch1_s009_05', 'accounting', 'npo_trading', 'Commercial organisation',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL, 'A trading concern is also called a commercial organisation.'
),
(
    'sio_acc_ch1_s009_06', 'accounting', 'npo_trading', 'Retail goods business',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 2, 5, NULL, 'A business established to earn profit by selling goods is a trading concern.'
),
(
    'sio_acc_ch1_s009_07', 'accounting', 'npo_trading', 'Charity organisation',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL, 'A charity organisation serves a useful social purpose rather than seeking profit.'
),
(
    'sio_acc_ch1_s009_08', 'accounting', 'npo_trading', 'School',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL, 'Schools are listed as examples of not-for-profit concerns.'
),
(
    'sio_acc_ch1_s010_01', 'accounting', 'profit_loss', 'Capital increases',
    'Profit', 'Loss', 'a', 1, 3, NULL, 'Profit increases the capital of the business.'
),
(
    'sio_acc_ch1_s010_02', 'accounting', 'profit_loss', 'Capital decreases',
    'Profit', 'Loss', 'b', 1, 3, NULL, 'Loss decreases the capital of the business.'
),
(
    'sio_acc_ch1_s010_03', 'accounting', 'profit_loss', 'Sale ₹50,000; expenses ₹60,000',
    'Profit', 'Loss', 'b', 3, 10, NULL, 'The stated expenses exceed the sale amount, resulting in a loss.'
),
(
    'sio_acc_ch1_s010_04', 'accounting', 'profit_loss', 'Cost exceeds selling price',
    'Profit', 'Loss', 'b', 1, 3, NULL, 'Loss occurs when the cost price is greater than the selling price.'
),
(
    'sio_acc_ch1_s010_05', 'accounting', 'profit_loss', 'Selling price exceeds cost',
    'Profit', 'Loss', 'a', 1, 3, NULL, 'Profit occurs when the selling price is greater than the cost price.'
),
(
    'sio_acc_ch1_s010_06', 'accounting', 'profit_loss', 'Income exceeds expenses',
    'Profit', 'Loss', 'a', 2, 5, NULL, 'A surplus of income over expenses indicates profit.'
),
(
    'sio_acc_ch1_s010_07', 'accounting', 'profit_loss', 'Sale ₹50,000; expenses ₹30,000',
    'Profit', 'Loss', 'a', 2, 5, NULL, 'The sale amount exceeds the stated expenses, leaving a profit.'
),
(
    'sio_acc_ch1_s010_08', 'accounting', 'profit_loss', 'Expenses exceed income',
    'Profit', 'Loss', 'b', 2, 5, NULL, 'When expenses exceed income, the business incurs a loss.'
),
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

