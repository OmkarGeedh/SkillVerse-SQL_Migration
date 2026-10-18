-- Seeds: Sort It Out questions (30 items)

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

