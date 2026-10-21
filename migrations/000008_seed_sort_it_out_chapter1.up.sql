-- Migration: 000008_seed_sort_it_out_chapter1.up.sql
-- Description: Seed 84 Sort It Out rapid-fire swipe questions for Chapter 1 (Sets SORT-001 to SORT-010)

INSERT INTO sort_it_out_questions (
    question_code, topic_id, pair_type, prompt,
    option_a, option_b, correct_option, difficulty, points, hint, explanation
) VALUES
(
    'sio_acc_ch1_s001_01', 'accounting', 'bookkeeping_accountancy', 'Annual details',
    'Book-keeping', 'Accountancy', 'b', 3, 10, NULL,
    'Accountancy provides details for the entire year.'
),
(
    'sio_acc_ch1_s001_02', 'accounting', 'bookkeeping_accountancy', 'Business decisions',
    'Book-keeping', 'Accountancy', 'b', 3, 10, NULL,
    'Accountancy information supports critical management decisions.'
),
(
    'sio_acc_ch1_s001_03', 'accounting', 'bookkeeping_accountancy', 'Profit and Loss A/c',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL,
    'Profit and Loss Account is an outcome of accountancy.'
),
(
    'sio_acc_ch1_s001_04', 'accounting', 'bookkeeping_accountancy', 'Recording day-to-day transactions',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL,
    'Recording daily business transactions is the primary function of book-keeping.'
),
(
    'sio_acc_ch1_s001_05', 'accounting', 'bookkeeping_accountancy', 'Analysis and interpretation',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL,
    'Accountancy includes analysing and interpreting financial data.'
),
(
    'sio_acc_ch1_s001_06', 'accounting', 'bookkeeping_accountancy', 'Daily details',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL,
    'Book-keeping provides day-to-day details of transactions.'
),
(
    'sio_acc_ch1_s001_07', 'accounting', 'bookkeeping_accountancy', 'Financial statements',
    'Book-keeping', 'Accountancy', 'b', 1, 3, NULL,
    'Accountancy prepares financial statements to communicate financial information.'
),
(
    'sio_acc_ch1_s001_08', 'accounting', 'bookkeeping_accountancy', 'Primary stage',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL,
    'Book-keeping is the primary stage of the accounting process.'
),
(
    'sio_acc_ch1_s001_09', 'accounting', 'bookkeeping_accountancy', 'Junior staff',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL,
    'Junior staff are responsible for maintaining book-keeping records.'
),
(
    'sio_acc_ch1_s001_10', 'accounting', 'bookkeeping_accountancy', 'Journal and Ledger',
    'Book-keeping', 'Accountancy', 'a', 1, 3, NULL,
    'Book-keeping primarily produces journal and ledger records.'
),
(
    'sio_acc_ch1_s001_11', 'accounting', 'bookkeeping_accountancy', 'Senior staff',
    'Book-keeping', 'Accountancy', 'b', 2, 5, NULL,
    'Senior staff are responsible for keeping accounts at the accountancy stage.'
),
(
    'sio_acc_ch1_s001_12', 'accounting', 'bookkeeping_accountancy', 'No analytical skill',
    'Book-keeping', 'Accountancy', 'a', 2, 5, NULL,
    'Book-keeping does not require analytical skill.'
),
(
    'sio_acc_ch1_s002_01', 'accounting', 'accrual_cash', 'Expenses payable',
    'Accrual Basis', 'Cash Basis', 'a', 3, 10, NULL,
    'Accrual basis includes expenses incurred but not yet paid.'
),
(
    'sio_acc_ch1_s002_02', 'accounting', 'accrual_cash', 'Receipts on collection',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL,
    'Cash basis records actual cash receipts.'
),
(
    'sio_acc_ch1_s002_03', 'accounting', 'accrual_cash', 'Income earned unpaid',
    'Accrual Basis', 'Cash Basis', 'a', 2, 5, NULL,
    'Accrual basis records income when earned even if cash is not received.'
),
(
    'sio_acc_ch1_s002_04', 'accounting', 'accrual_cash', 'Revenue accrued',
    'Accrual Basis', 'Cash Basis', 'a', 3, 10, NULL,
    'Accrual basis recognises revenue when it is earned or accrued.'
),
(
    'sio_acc_ch1_s002_05', 'accounting', 'accrual_cash', 'Payments on settlement',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL,
    'Cash basis records actual cash payments.'
),
(
    'sio_acc_ch1_s002_06', 'accounting', 'accrual_cash', 'Income received',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL,
    'Cash basis records revenue when cash is received.'
),
(
    'sio_acc_ch1_s002_07', 'accounting', 'accrual_cash', 'Expense incurred unpaid',
    'Accrual Basis', 'Cash Basis', 'a', 2, 5, NULL,
    'Accrual basis records expenses when incurred even if unpaid.'
),
(
    'sio_acc_ch1_s002_08', 'accounting', 'accrual_cash', 'Expense paid',
    'Accrual Basis', 'Cash Basis', 'b', 1, 3, NULL,
    'Cash basis records expenses when cash is paid.'
),
(
    'sio_acc_ch1_s003_01', 'accounting', 'nonmonetary_monetary', 'Credit sale',
    'Non-Monetary', 'Monetary', 'b', 2, 5, NULL,
    'A credit sale involves money or money’s worth payable later.'
),
(
    'sio_acc_ch1_s003_02', 'accounting', 'nonmonetary_monetary', 'Machinery on credit',
    'Non-Monetary', 'Monetary', 'b', 3, 10, NULL,
    'A credit sale of machinery involves money’s worth.'
),
(
    'sio_acc_ch1_s003_03', 'accounting', 'nonmonetary_monetary', 'Management efficiency',
    'Non-Monetary', 'Monetary', 'a', 3, 10, NULL,
    'Management efficiency is not recorded under money measurement when it cannot be expressed in money.'
),
(
    'sio_acc_ch1_s003_04', 'accounting', 'nonmonetary_monetary', 'Workplace conditions',
    'Non-Monetary', 'Monetary', 'a', 3, 10, NULL,
    'Workplace conditions cannot be expressed in monetary terms.'
),
(
    'sio_acc_ch1_s003_05', 'accounting', 'nonmonetary_monetary', 'Salary payment',
    'Non-Monetary', 'Monetary', 'b', 1, 3, NULL,
    'A salary payment involves an exchange of money.'
),
(
    'sio_acc_ch1_s003_06', 'accounting', 'nonmonetary_monetary', 'Barter exchange',
    'Non-Monetary', 'Monetary', 'a', 1, 3, NULL,
    'Barter exchanges one thing for another without money or money’s worth.'
),
(
    'sio_acc_ch1_s003_07', 'accounting', 'nonmonetary_monetary', 'Goods for goods',
    'Non-Monetary', 'Monetary', 'a', 1, 3, NULL,
    'Exchanging goods directly for other goods is a barter transaction.'
),
(
    'sio_acc_ch1_s003_08', 'accounting', 'nonmonetary_monetary', 'Immediate goods purchase',
    'Non-Monetary', 'Monetary', 'b', 1, 3, NULL,
    'A cash purchase directly involves money.'
),
(
    'sio_acc_ch1_s004_01', 'accounting', 'cash_credit', 'Receipt at later date',
    'Cash Transaction', 'Credit Transaction', 'b', 3, 10, NULL,
    'A credit transaction may be settled after the transaction date.'
),
(
    'sio_acc_ch1_s004_02', 'accounting', 'cash_credit', 'Payment next month',
    'Cash Transaction', 'Credit Transaction', 'b', 2, 5, NULL,
    'Payment deferred until a later date is characteristic of a credit transaction.'
),
(
    'sio_acc_ch1_s004_03', 'accounting', 'cash_credit', 'Immediate receipt',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL,
    'A cash transaction involves immediate receipt of cash.'
),
(
    'sio_acc_ch1_s004_04', 'accounting', 'cash_credit', 'Payment at purchase',
    'Cash Transaction', 'Credit Transaction', 'a', 2, 5, NULL,
    'Payment made at the time of purchase makes the transaction a cash transaction.'
),
(
    'sio_acc_ch1_s004_05', 'accounting', 'cash_credit', 'Machinery sold on credit',
    'Cash Transaction', 'Credit Transaction', 'b', 2, 5, NULL,
    'The machinery payment is received at a later date in a credit transaction.'
),
(
    'sio_acc_ch1_s004_06', 'accounting', 'cash_credit', 'Goods purchase paid immediately',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL,
    'A cash purchase involves immediate payment.'
),
(
    'sio_acc_ch1_s004_07', 'accounting', 'cash_credit', 'Goods sold on credit',
    'Cash Transaction', 'Credit Transaction', 'b', 1, 3, NULL,
    'A credit sale does not involve immediate cash receipt.'
),
(
    'sio_acc_ch1_s004_08', 'accounting', 'cash_credit', 'Salary paid',
    'Cash Transaction', 'Credit Transaction', 'a', 1, 3, NULL,
    'Salary paid immediately is a cash transaction.'
),
(
    'sio_acc_ch1_s005_01', 'accounting', 'capital_revenue_expenditure', 'Computer purchase',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL,
    'Purchasing a computer provides a long-term business benefit.'
),
(
    'sio_acc_ch1_s005_02', 'accounting', 'capital_revenue_expenditure', 'Salary paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL,
    'Salary is a routine operating expense with short-term benefit.'
),
(
    'sio_acc_ch1_s005_03', 'accounting', 'capital_revenue_expenditure', 'Purchase of machinery',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL,
    'Machinery is a fixed asset acquired through capital expenditure.'
),
(
    'sio_acc_ch1_s005_04', 'accounting', 'capital_revenue_expenditure', 'Building extension',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 1, 3, NULL,
    'Extending a building increases the value of a fixed asset.'
),
(
    'sio_acc_ch1_s005_05', 'accounting', 'capital_revenue_expenditure', 'Wages paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL,
    'Wages are normal operating expenses.'
),
(
    'sio_acc_ch1_s005_06', 'accounting', 'capital_revenue_expenditure', 'Fixed asset improvement',
    'Capital Expenditure', 'Revenue Expenditure', 'a', 2, 5, NULL,
    'Spending to increase a fixed asset’s value is capital expenditure.'
),
(
    'sio_acc_ch1_s005_07', 'accounting', 'capital_revenue_expenditure', 'Rent paid',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 1, 3, NULL,
    'Rent is a normal day-to-day operating expense.'
),
(
    'sio_acc_ch1_s005_08', 'accounting', 'capital_revenue_expenditure', 'Daily operating costs',
    'Capital Expenditure', 'Revenue Expenditure', 'b', 3, 10, NULL,
    'Routine costs with immediate or short-term benefit are revenue expenditure.'
),
(
    'sio_acc_ch1_s006_01', 'accounting', 'cash_trade_discount', 'Spot payment allowance',
    'Cash Discount', 'Trade Discount', 'a', 3, 10, NULL,
    'Cash discount may be given for spot payment.'
),
(
    'sio_acc_ch1_s006_02', 'accounting', 'cash_trade_discount', 'Net goods value',
    'Cash Discount', 'Trade Discount', 'b', 2, 5, NULL,
    'Goods are recorded at their value after deducting trade discount.'
),
(
    'sio_acc_ch1_s006_03', 'accounting', 'cash_trade_discount', 'Prompt payment concession',
    'Cash Discount', 'Trade Discount', 'a', 1, 3, NULL,
    'Cash discount encourages prompt payment.'
),
(
    'sio_acc_ch1_s006_04', 'accounting', 'cash_trade_discount', 'Appears in accounts',
    'Cash Discount', 'Trade Discount', 'a', 2, 5, NULL,
    'Cash discount appears in the books of accounts.'
),
(
    'sio_acc_ch1_s006_05', 'accounting', 'cash_trade_discount', 'List price reduction',
    'Cash Discount', 'Trade Discount', 'b', 1, 3, NULL,
    'Trade discount reduces the list price used to calculate the recorded net value.'
),
(
    'sio_acc_ch1_s006_06', 'accounting', 'cash_trade_discount', 'Catalogue price allowance',
    'Cash Discount', 'Trade Discount', 'b', 1, 3, NULL,
    'Trade discount is allowed on the catalogue or list price of goods.'
),
(
    'sio_acc_ch1_s006_07', 'accounting', 'cash_trade_discount', 'Deduction when paid',
    'Cash Discount', 'Trade Discount', 'a', 1, 3, NULL,
    'Cash discount is deducted from the final amount due at receipt.'
),
(
    'sio_acc_ch1_s006_08', 'accounting', 'cash_trade_discount', 'Not separately recorded',
    'Cash Discount', 'Trade Discount', 'b', 2, 5, NULL,
    'Trade discount does not appear separately in the books of accounts.'
),
(
    'sio_acc_ch1_s007_01', 'accounting', 'fixed_current_assets', 'Cash at bank',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL,
    'Cash at bank is a current asset readily available for use.'
),
(
    'sio_acc_ch1_s007_02', 'accounting', 'fixed_current_assets', 'Bills receivable',
    'Fixed Assets', 'Current Assets', 'b', 2, 5, NULL,
    'Bills receivable are classified as current assets.'
),
(
    'sio_acc_ch1_s007_03', 'accounting', 'fixed_current_assets', 'Plant and machinery',
    'Fixed Assets', 'Current Assets', 'a', 1, 3, NULL,
    'Plant and machinery are fixed assets providing long-term benefit.'
),
(
    'sio_acc_ch1_s007_04', 'accounting', 'fixed_current_assets', 'Debtors',
    'Fixed Assets', 'Current Assets', 'b', 2, 5, NULL,
    'Debtors are listed among current assets.'
),
(
    'sio_acc_ch1_s007_05', 'accounting', 'fixed_current_assets', 'Land and building',
    'Fixed Assets', 'Current Assets', 'a', 1, 3, NULL,
    'Land and building provide long-term benefit to the business.'
),
(
    'sio_acc_ch1_s007_06', 'accounting', 'fixed_current_assets', 'Stock',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL,
    'Stock is held for the operating year and is a current asset.'
),
(
    'sio_acc_ch1_s007_07', 'accounting', 'fixed_current_assets', 'Goodwill',
    'Fixed Assets', 'Current Assets', 'a', 3, 10, NULL,
    'Goodwill is identified as an intangible fixed asset.'
),
(
    'sio_acc_ch1_s007_08', 'accounting', 'fixed_current_assets', 'Cash in hand',
    'Fixed Assets', 'Current Assets', 'b', 1, 3, NULL,
    'Cash in hand can be used immediately and is a current asset.'
),
(
    'sio_acc_ch1_s008_01', 'accounting', 'liabilities_assets', 'Outstanding expenses',
    'Liabilities', 'Assets', 'a', 3, 10, NULL,
    'Outstanding expenses are amounts due from the business to others.'
),
(
    'sio_acc_ch1_s008_02', 'accounting', 'liabilities_assets', 'Loan taken',
    'Liabilities', 'Assets', 'a', 1, 3, NULL,
    'A loan taken is an amount payable by the business.'
),
(
    'sio_acc_ch1_s008_03', 'accounting', 'liabilities_assets', 'Patents',
    'Liabilities', 'Assets', 'b', 2, 5, NULL,
    'Patents are rights with monetary value and are assets.'
),
(
    'sio_acc_ch1_s008_04', 'accounting', 'liabilities_assets', 'Land',
    'Liabilities', 'Assets', 'b', 1, 3, NULL,
    'Land owned by the business has monetary value and is an asset.'
),
(
    'sio_acc_ch1_s008_05', 'accounting', 'liabilities_assets', 'Creditors',
    'Liabilities', 'Assets', 'a', 1, 3, NULL,
    'Creditors are parties to whom the business owes money.'
),
(
    'sio_acc_ch1_s008_06', 'accounting', 'liabilities_assets', 'Goodwill',
    'Liabilities', 'Assets', 'b', 1, 3, NULL,
    'Goodwill is an intangible asset of the business.'
),
(
    'sio_acc_ch1_s008_07', 'accounting', 'liabilities_assets', 'Bank overdraft',
    'Liabilities', 'Assets', 'a', 2, 5, NULL,
    'A bank overdraft is an amount payable by the business.'
),
(
    'sio_acc_ch1_s008_08', 'accounting', 'liabilities_assets', 'Cash at bank',
    'Liabilities', 'Assets', 'b', 1, 3, NULL,
    'Cash at bank is a resource owned by the business.'
),
(
    'sio_acc_ch1_s009_01', 'accounting', 'npo_trading', 'Profit-making business',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL,
    'A trading concern is established to earn profit.'
),
(
    'sio_acc_ch1_s009_02', 'accounting', 'npo_trading', 'Goods sold for profit',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL,
    'A trading concern sells goods with the objective of earning profit.'
),
(
    'sio_acc_ch1_s009_03', 'accounting', 'npo_trading', 'Service to society',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 3, 10, NULL,
    'A not-for-profit concern is established to render services to society.'
),
(
    'sio_acc_ch1_s009_04', 'accounting', 'npo_trading', 'Sports club',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL,
    'A sports club is given as an example of a not-for-profit concern.'
),
(
    'sio_acc_ch1_s009_05', 'accounting', 'npo_trading', 'Commercial organisation',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 1, 3, NULL,
    'A trading concern is also called a commercial organisation.'
),
(
    'sio_acc_ch1_s009_06', 'accounting', 'npo_trading', 'Retail goods business',
    'Not-for-Profit Concern', 'Trading Concern', 'b', 2, 5, NULL,
    'A business established to earn profit by selling goods is a trading concern.'
),
(
    'sio_acc_ch1_s009_07', 'accounting', 'npo_trading', 'Charity organisation',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL,
    'A charity organisation serves a useful social purpose rather than seeking profit.'
),
(
    'sio_acc_ch1_s009_08', 'accounting', 'npo_trading', 'School',
    'Not-for-Profit Concern', 'Trading Concern', 'a', 1, 3, NULL,
    'Schools are listed as examples of not-for-profit concerns.'
),
(
    'sio_acc_ch1_s010_01', 'accounting', 'profit_loss', 'Capital increases',
    'Profit', 'Loss', 'a', 1, 3, NULL,
    'Profit increases the capital of the business.'
),
(
    'sio_acc_ch1_s010_02', 'accounting', 'profit_loss', 'Capital decreases',
    'Profit', 'Loss', 'b', 1, 3, NULL,
    'Loss decreases the capital of the business.'
),
(
    'sio_acc_ch1_s010_03', 'accounting', 'profit_loss', 'Sale ₹50,000; expenses ₹60,000',
    'Profit', 'Loss', 'b', 3, 10, NULL,
    'The stated expenses exceed the sale amount, resulting in a loss.'
),
(
    'sio_acc_ch1_s010_04', 'accounting', 'profit_loss', 'Cost exceeds selling price',
    'Profit', 'Loss', 'b', 1, 3, NULL,
    'Loss occurs when the cost price is greater than the selling price.'
),
(
    'sio_acc_ch1_s010_05', 'accounting', 'profit_loss', 'Selling price exceeds cost',
    'Profit', 'Loss', 'a', 1, 3, NULL,
    'Profit occurs when the selling price is greater than the cost price.'
),
(
    'sio_acc_ch1_s010_06', 'accounting', 'profit_loss', 'Income exceeds expenses',
    'Profit', 'Loss', 'a', 2, 5, NULL,
    'A surplus of income over expenses indicates profit.'
),
(
    'sio_acc_ch1_s010_07', 'accounting', 'profit_loss', 'Sale ₹50,000; expenses ₹30,000',
    'Profit', 'Loss', 'a', 2, 5, NULL,
    'The sale amount exceeds the stated expenses, leaving a profit.'
),
(
    'sio_acc_ch1_s010_08', 'accounting', 'profit_loss', 'Expenses exceed income',
    'Profit', 'Loss', 'b', 2, 5, NULL,
    'When expenses exceed income, the business incurs a loss.'
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
