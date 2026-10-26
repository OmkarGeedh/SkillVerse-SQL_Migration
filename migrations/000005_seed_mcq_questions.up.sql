-- Migration: 000005_seed_mcq_questions.up.sql
-- Description: Seed all quiz questions (MCQ, Sudden Death, Sort It Out, Match the Following) and demo user

-- Seeds: MCQ questions (135 items)

INSERT INTO mcq_questions (
    question_code, question_type, topic_id, prompt,
    option_a, option_b, option_c, option_d,
    correct_option, difficulty, points, hint, explanation
) VALUES
(
    '1', 'mcq', 'accounting', 'Book-keeping means:',
    'Recording business transactions', 'Auditing accounts', 'Preparing budgets', 'Paying taxes',
    'a', 1, 10, 'Think about the systematic clerical process of maintaining daily records.', 'Book-keeping is the activity of systematically keeping records of financial dealings and transactions of a business.'
),
(
    '2', 'mcq', 'accounting', 'Accounting is mainly concerned with:',
    'Recording, classifying and summarising transactions', 'Manufacturing goods', 'Selling goods', 'Hiring employees',
    'a', 1, 10, 'It encompasses the full lifecycle of financial data from entry to reporting.', 'Accounting is an information system that identifies, records, classifies, summarises, and reports economic events.'
),
(
    '3', 'mcq', 'accounting', 'A person who owns a business is called:',
    'Debtor', 'Creditor', 'Proprietor', 'Customer',
    'c', 1, 10, 'The individual who holds legal ownership and bears the financial risks.', 'A proprietor is the sole owner of a business enterprise who supplies capital and bears all business risks.'
),
(
    '4', 'mcq', 'accounting', 'The amount invested by the proprietor in the business is called:',
    'Capital', 'Drawings', 'Expense', 'Revenue',
    'a', 1, 10, 'Represents the owner''s financial stake or equity injected into the firm.', 'Capital represents the total funds and assets contributed by the proprietor to launch and run the business.'
),
(
    '5', 'mcq', 'accounting', 'Money withdrawn by the proprietor for personal use is called:',
    'Capital', 'Drawings', 'Purchases', 'Sales',
    'b', 1, 10, 'This reduces the proprietor''s capital account for private expenditure.', 'Drawings represent any cash or goods taken by the owner from the business for personal or domestic use.'
),
(
    '6', 'mcq', 'accounting', 'Assets are:',
    'Amounts owed by business', 'Properties owned by business', 'Business expenses', 'Business losses',
    'b', 1, 10, 'Economic resources that generate future monetary benefit.', 'Assets are tangible or intangible economic resources owned and controlled by a business entity that provide future economic value.'
),
(
    '7', 'mcq', 'accounting', 'Liabilities are:',
    'Properties owned', 'Amounts payable by business', 'Sales made', 'Cash received',
    'b', 1, 10, 'Claims against the business by external creditors or lenders.', 'Liabilities are existing obligations and debts of the business payable to outside parties in the future.'
),
(
    '8', 'mcq', 'accounting', 'A person who owes money to the business is called:',
    'Creditor', 'Debtor', 'Proprietor', 'Banker',
    'b', 1, 10, 'A customer who has purchased goods on credit and has not yet paid.', 'A debtor is a person or entity that owes money to the business for goods or services supplied on credit.'
),
(
    '9', 'mcq', 'accounting', 'A person to whom the business owes money is called:',
    'Debtor', 'Customer', 'Creditor', 'Proprietor',
    'c', 1, 10, 'A supplier who provided goods or services on credit terms.', 'A creditor is a person or institution to whom the business owes money for goods or services received on credit.'
),
(
    '10', 'mcq', 'accounting', 'Goods purchased for resale are called:',
    'Purchases', 'Sales', 'Assets', 'Drawings',
    'a', 1, 10, 'Articles bought specifically for the objective of selling at a profit.', 'Purchases refers specifically to goods bought by a business with the prime purpose of resale to customers.'
),
(
    '11', 'mcq', 'accounting', 'Goods sold by the business are called:',
    'Purchases', 'Sales', 'Capital', 'Expenses',
    'b', 1, 10, 'Transfer of ownership of merchandise to customers in exchange for value.', 'Sales refers to the total volume or value of merchandise sold or delivered to customers in trade.'
),
(
    '12', 'mcq', 'accounting', 'Cash in hand is a:',
    'Liability', 'Asset', 'Expense', 'Revenue',
    'b', 1, 10, 'Physical legal currency held on premise, available immediately.', 'Cash in hand is a liquid current asset owned by the business that is readily available to settle payments.'
),
(
    '13', 'mcq', 'accounting', 'Bank balance is generally treated as a:',
    'Asset', 'Liability', 'Loss', 'Expense',
    'a', 1, 10, 'Funds deposited with financial institutions available for withdrawal.', 'Bank balance is a current asset representing cash held securely in a bank account on behalf of the business.'
),
(
    '14', 'mcq', 'accounting', 'Furniture used in business is:',
    'Current liability', 'Fixed asset', 'Revenue', 'Expense',
    'b', 1, 10, 'Tangible equipment intended for permanent retention, not for daily resale.', 'Furniture is classified as a fixed (non-current) asset because it is used over multiple years to support operations.'
),
(
    '15', 'mcq', 'accounting', 'Goodwill is an example of:',
    'Tangible asset', 'Intangible asset', 'Liability', 'Expense',
    'b', 1, 10, 'Reputation and brand value having monetary worth without physical form.', 'Goodwill is an intangible asset that represents the favorable reputation, customer base, and brand value of a business.'
),
(
    '16', 'mcq', 'accounting', 'The basic accounting equation is:',
    'Assets = Capital + Liabilities', 'Assets = Capital - Liabilities', 'Capital = Assets + Liabilities', 'Liabilities = Assets + Capital',
    'a', 1, 10, 'The fundamental dual-aspect equation of double entry bookkeeping.', 'The fundamental balance sheet equation states: Assets = Capital (Equity) + Liabilities.'
),
(
    '17', 'mcq', 'accounting', 'The left side of an account is called:',
    'Credit', 'Debit', 'Balance', 'Total',
    'b', 1, 10, 'In traditional T-accounts, this Latin-derived side is on the left.', 'In a ledger T-account format, the left-hand side is designated as Debit (Dr.) and the right-hand side as Credit (Cr.).'
),
(
    '18', 'mcq', 'accounting', 'The right side of an account is called:',
    'Debit', 'Credit', 'Asset', 'Balance',
    'b', 1, 10, 'In traditional T-accounts, this Latin-derived side is on the right.', 'The right-hand side of a ledger account is universally termed the Credit (Cr.) side.'
),
(
    '19', 'mcq', 'accounting', 'The rule of personal account is:',
    'Debit what comes in', 'Debit the receiver, credit the giver', 'Debit all expenses', 'Credit all losses',
    'b', 1, 10, 'Pertains to accounts of people, firms, and legal bodies.', 'The golden rule for Personal Accounts is: Debit the receiver, Credit the giver.'
),
(
    '20', 'mcq', 'accounting', 'The rule of real account is:',
    'Debit the receiver', 'Debit what comes in and credit what goes out', 'Credit all expenses', 'Debit the giver',
    'b', 1, 10, 'Applies to asset accounts representing tangible and intangible property.', 'The golden rule for Real Accounts is: Debit what comes in, and Credit what goes out.'
),
(
    '21', 'mcq', 'accounting', 'The rule of nominal account is:',
    'Debit all expenses and losses, credit all incomes and gains', 'Debit the giver', 'Credit what comes in', 'Debit the receiver',
    'a', 1, 10, 'Governs all revenue, income, expense, and loss accounts.', 'The golden rule for Nominal Accounts is: Debit all expenses and losses, Credit all incomes and gains.'
),
(
    '22', 'mcq', 'accounting', 'Journal is known as the book of:',
    'Final entry', 'Original entry', 'Cash entry only', 'Balance entry',
    'b', 1, 10, 'The prime record where transactions are logged before ledger posting.', 'The Journal is known as the book of original (prime) entry because transactions are first recorded here from source documents.'
),
(
    '23', 'mcq', 'accounting', 'Transactions are recorded in the Journal in:',
    'Alphabetical order', 'Chronological order', 'Random order', 'Account-wise order',
    'b', 1, 10, 'Transactions are documented day by day as they occur in real time.', 'A Journal maintains a chronological record of financial transactions in order of occurrence.'
),
(
    '24', 'mcq', 'accounting', 'The process of transferring entries from Journal to Ledger is called:',
    'Balancing', 'Posting', 'Casting', 'Auditing',
    'b', 1, 10, 'Moving data from the primary journal into specific account pages.', 'Posting is the process of transferring debit and credit entries from the journal into ledger accounts.'
),
(
    '25', 'mcq', 'accounting', 'Ledger is called the book of:',
    'Original entry', 'Final entry', 'Cash entry', 'Prime entry',
    'b', 1, 10, 'The principal master book containing all permanent summarized accounts.', 'The Ledger is known as the book of final entry because all transactions ultimately end up in respective ledger accounts.'
),
(
    '26', 'mcq', 'accounting', 'A Trial Balance is prepared from:',
    'Journal', 'Ledger balances', 'Cash memo', 'Invoice',
    'b', 1, 10, 'A summary statement compiling balances from every ledger account.', 'A Trial Balance is a worksheet listing the closing debit and credit balances extracted from all ledger accounts.'
),
(
    '27', 'mcq', 'accounting', 'The main purpose of Trial Balance is to check:',
    'Profit', 'Financial position', 'Arithmetical accuracy', 'Cash sales',
    'c', 1, 10, 'Validates whether total debits equal total credits without testing accounting truth.', 'The main objective of a Trial Balance is to test and verify the arithmetical accuracy of ledger postings.'
),
(
    '28', 'mcq', 'accounting', 'If debit total equals credit total in Trial Balance, it indicates:',
    'Absolute accuracy', 'Arithmetical agreement', 'Profit', 'Loss',
    'b', 1, 10, 'Equal totals confirm mathematical symmetry in debit and credit entries.', 'Agreement of Trial Balance totals proves arithmetical accuracy, though it does not detect errors of principle or omission.'
),
(
    '29', 'mcq', 'accounting', 'Cash purchase is recorded in:',
    'Purchases Book', 'Cash Book', 'Sales Book', 'Journal Proper',
    'b', 1, 10, 'Any immediate cash or cheque payment for inventory is recorded here.', 'All transactions involving immediate cash or bank payments are recorded directly in the Cash Book, not the Purchases Book.'
),
(
    '30', 'mcq', 'accounting', 'Credit purchase of goods is recorded in:',
    'Purchases Book', 'Sales Book', 'Cash Book', 'Purchase Return Book',
    'a', 1, 10, 'Special subsidiary book dedicated exclusively to non-cash purchases of trade goods.', 'The Purchases Book (or Purchases Journal) records only credit purchases of merchandise meant for resale.'
),
(
    '31', 'mcq', 'accounting', 'Credit sale of goods is recorded in:',
    'Purchases Book', 'Sales Book', 'Cash Book', 'Journal Proper',
    'b', 1, 10, 'Special subsidiary book dedicated exclusively to non-cash sales of merchandise.', 'The Sales Book (Sales Day Book) records only credit sales of goods to customers.'
),
(
    '32', 'mcq', 'accounting', 'Goods returned to supplier are recorded in:',
    'Sales Return Book', 'Purchases Return Book', 'Sales Book', 'Cash Book',
    'b', 1, 10, 'Used when merchandise is sent back to vendors due to defects or excess.', 'Goods returned to suppliers are documented in the Purchases Return Book (Return Outward Book).'
),
(
    '33', 'mcq', 'accounting', 'Goods returned by customer are recorded in:',
    'Purchases Return Book', 'Sales Return Book', 'Purchases Book', 'Cash Book',
    'b', 1, 10, 'Used when buyers send back merchandise due to defects or wrong specs.', 'Goods returned by customers are recorded in the Sales Return Book (Return Inward Book).'
),
(
    '34', 'mcq', 'accounting', 'A document issued by seller to buyer for credit sale is:',
    'Invoice', 'Receipt', 'Cheque', 'Voucher',
    'a', 1, 10, 'A commercial document detailing items, prices, and credit terms sent to buyers.', 'An invoice is a bill sent by the seller to the buyer detailing description, quantity, price, and terms of credit sales.'
),
(
    '35', 'mcq', 'accounting', 'A receipt is a proof of:',
    'Payment received', 'Credit purchase', 'Credit sale', 'Goods returned',
    'a', 1, 10, 'An acknowledgment slip confirming that cash or bank payment was received.', 'A receipt is written evidence confirming that payment has been received against a bill or debt.'
),
(
    '36', 'mcq', 'accounting', 'A cheque is drawn on:',
    'Customer', 'Bank', 'Supplier', 'Proprietor',
    'b', 2, 15, 'A negotiable order directing a financial institution to pay a stated sum.', 'A cheque is an unconditional order drawn on a specified bank instructing it to pay a sum of money.'
),
(
    '37', 'mcq', 'accounting', 'Cash Book records:',
    'Only credit transactions', 'Cash and bank transactions', 'Only purchases', 'Only sales',
    'b', 2, 15, 'Records all inflows and outflows of liquid currency and banking transactions.', 'The Cash Book records all receipts and payments made through cash or bank accounts.'
),
(
    '38', 'mcq', 'accounting', 'Cash Book serves as:',
    'Only a journal', 'Both journal and ledger for cash/bank', 'Only a balance sheet', 'Only a trial balance',
    'b', 2, 15, 'Eliminates the need for separate cash/bank accounts in the principal ledger.', 'The Cash Book functions both as a subsidiary book of prime entry and as the ledger account for cash and bank.'
),
(
    '39', 'mcq', 'accounting', 'A three-column Cash Book may contain:',
    'Cash, Bank and Discount columns', 'Sales, Purchases and Capital', 'Assets, Liabilities and Capital', 'Debtors, Creditors and Stock',
    'a', 2, 15, 'Includes columns for cash, bank, and prompt-payment concessions.', 'A three-column cash book includes monetary columns for Cash, Bank, and Discount on both debit and credit sides.'
),
(
    '40', 'mcq', 'accounting', 'Petty Cash Book is used to record:',
    'Large payments', 'Small routine payments', 'Credit sales', 'Fixed assets',
    'b', 2, 15, 'Designed for small sundry disbursements like postage, teas, and local fare.', 'The Petty Cash Book records small, daily routine disbursements to prevent cluttering the main cash book.'
),
(
    '41', 'mcq', 'accounting', 'The person responsible for maintaining petty cash is:',
    'Petty cashier', 'Auditor', 'Creditor', 'Debtor',
    'a', 2, 15, 'The designated junior cashier managing small routine office disbursements.', 'The petty cashier is entrusted with a small float to handle and record minor routine operational expenses.'
),
(
    '42', 'mcq', 'accounting', 'The system where petty cashier receives a fixed amount periodically is called:',
    'Double entry system', 'Imprest system', 'Single entry system', 'Voucher system',
    'b', 2, 15, 'The system where spent petty money is reimbursed to restore the starting float.', 'Under the Imprest system, the petty cashier is reimbursed the exact amount spent to restore the original float balance.'
),
(
    '43', 'mcq', 'accounting', 'Bank Reconciliation Statement is prepared to reconcile:',
    'Cash Book and Pass Book', 'Journal and Ledger', 'Trial Balance and Balance Sheet', 'Purchases and Sales',
    'a', 2, 15, 'Reconciles differences between the firm''s bank ledger and the bank''s records.', 'A Bank Reconciliation Statement reconciles differences between the bank column of the Cash Book and the Bank Pass Book.'
),
(
    '44', 'mcq', 'accounting', 'Pass Book is maintained by:',
    'Business', 'Bank', 'Customer', 'Supplier',
    'b', 2, 15, 'The periodic statement copy supplied by the banking institution to depositors.', 'The Pass Book (or bank statement) is maintained and issued by the bank showing deposits, withdrawals, and balance.'
),
(
    '45', 'mcq', 'accounting', 'A favourable bank balance generally means:',
    'Bank overdraft', 'Money available in bank', 'Loss', 'Liability',
    'b', 2, 15, 'A credit balance in the pass book indicating positive funds available.', 'A favourable bank balance means the depositor has a positive asset balance available in the bank account.'
),
(
    '46', 'mcq', 'accounting', 'Bank overdraft is generally shown as:',
    'Asset', 'Liability', 'Expense', 'Income',
    'b', 2, 15, 'A temporary negative bank balance where the bank lent money to cover payments.', 'A bank overdraft is a short-term liability representing amounts overdrawn beyond the deposited balance.'
),
(
    '47', 'mcq', 'accounting', 'A cash discount is allowed for:',
    'Prompt payment', 'Large quantity only', 'Credit purchase only', 'Late payment',
    'a', 2, 15, 'A concession offered to incentivize buyers to pay invoices before due date.', 'Cash discount is allowed by creditors to encourage debtors to make prompt payment before the credit period expires.'
),
(
    '48', 'mcq', 'accounting', 'Trade discount is generally given for:',
    'Prompt payment', 'Bulk purchase or trade reasons', 'Late payment', 'Bank charges',
    'b', 2, 15, 'A reduction in list price given by manufacturers or wholesalers for volume.', 'Trade discount is a reduction in list price allowed at the time of purchase to promote trade or bulk volume.'
),
(
    '49', 'mcq', 'accounting', 'Trade discount is recorded:',
    'Separately in books', 'Not recorded separately in books', 'Only in Cash Book', 'Only in Ledger',
    'b', 2, 15, 'Deducted directly on invoice face, not entered in a dedicated discount ledger.', 'Trade discount is deducted directly on the invoice and is not recorded in an accounting discount ledger account.'
),
(
    '50', 'mcq', 'accounting', 'Discount received is:',
    'Expense', 'Income/gain', 'Asset', 'Liability',
    'b', 2, 15, 'Concession earned by business when paying suppliers promptly.', 'Discount received is a financial gain/income recognized when the business pays its creditors ahead of time.'
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

INSERT INTO mcq_questions (
    question_code, question_type, topic_id, prompt,
    option_a, option_b, option_c, option_d,
    correct_option, difficulty, points, hint, explanation
) VALUES
(
    '51', 'mcq', 'accounting', 'Discount allowed is:',
    'Income', 'Expense/loss', 'Asset', 'Capital',
    'b', 2, 15, 'Concession granted to customers when they settle receivables promptly.', 'Discount allowed is an operational financial expense/loss incurred when offering concessions for rapid settlement.'
),
(
    '52', 'mcq', 'accounting', 'Depreciation means:',
    'Increase in asset value', 'Decrease in value of fixed asset', 'Increase in capital', 'Increase in sales',
    'b', 2, 15, 'The permanent, continuous reduction in asset utility and economic value.', 'Depreciation is the gradual and permanent decrease in the book value of a fixed asset due to wear, tear, passage of time, or obsolescence.'
),
(
    '53', 'mcq', 'accounting', 'One cause of depreciation is:',
    'Wear and tear', 'Increase in capital', 'Cash sales', 'Credit purchase',
    'a', 2, 15, 'Physical degradation through continuous usage in business operations.', 'Wear and tear through continuous operational use is a primary cause of physical depreciation of machinery and equipment.'
),
(
    '54', 'mcq', 'accounting', 'Straight Line Method of depreciation charges:',
    'Equal amount every year', 'Increasing amount every year', 'No depreciation', 'Random amount',
    'a', 2, 15, 'Allocates a uniform, constant proportion of historical cost across useful life.', 'Under the Straight Line Method (SLM), a fixed and equal amount of depreciation is charged each financial year.'
),
(
    '55', 'mcq', 'accounting', 'Under Written Down Value method, depreciation is calculated on:',
    'Original cost forever', 'Written down value', 'Sales value', 'Market sales',
    'b', 2, 15, 'Depreciation percentage is applied to the declining net book balance each period.', 'Under Written Down Value (WDV) / Reducing Balance method, depreciation is computed on the beginning net book value of the asset.'
),
(
    '56', 'mcq', 'accounting', 'Profit is:',
    'Excess of revenue over expenses', 'Excess of expenses over revenue', 'Assets minus capital', 'Capital minus assets',
    'a', 2, 15, 'The financial surplus generated when business earnings exceed total outlays.', 'Profit is the positive excess of total earned revenue over total incurred expenses during an accounting period.'
),
(
    '57', 'mcq', 'accounting', 'Loss is:',
    'Excess of revenue over expenses', 'Excess of expenses over revenue', 'Excess of assets over liabilities', 'Increase in capital',
    'b', 2, 15, 'Occurs when operating expenditures surpass revenues earned in the timeframe.', 'A loss represents the negative difference when total expenses exceed total revenues during an accounting period.'
),
(
    '58', 'mcq', 'accounting', 'Trading Account is prepared to find:',
    'Net profit', 'Gross profit or gross loss', 'Cash balance', 'Capital',
    'b', 2, 15, 'Measures direct profitability from buying/manufacturing and selling inventory.', 'The Trading Account is prepared to determine Gross Profit or Gross Loss from core merchandising activities.'
),
(
    '59', 'mcq', 'accounting', 'Profit and Loss Account is prepared to find:',
    'Gross profit', 'Net profit or net loss', 'Closing stock only', 'Bank balance',
    'b', 2, 15, 'Calculates residual bottom-line profit after factoring in all indirect costs.', 'The Profit and Loss Account determines Net Profit or Net Loss after deducting all administrative, selling, and financial expenses.'
),
(
    '60', 'mcq', 'accounting', 'Gross profit is calculated as:',
    'Sales - Cost of goods sold', 'Purchases - Sales', 'Expenses - Income', 'Assets - Liabilities',
    'a', 2, 15, 'Total revenue from goods sold less the direct cost required to acquire them.', 'Gross Profit equals Net Sales minus Cost of Goods Sold (COGS).'
),
(
    '61', 'mcq', 'accounting', 'Closing stock is shown in:',
    'Trading Account and Balance Sheet', 'Cash Book only', 'Journal only', 'Trial Balance only',
    'a', 2, 15, 'Unsold inventory at year end impacting both cost of sales and current assets.', 'Closing stock is recorded on the credit side of Trading Account and as a Current Asset on the Balance Sheet.'
),
(
    '62', 'mcq', 'accounting', 'Opening stock is shown on the:',
    'Credit side of Trading Account', 'Debit side of Trading Account', 'Balance Sheet liability side', 'Profit and Loss credit side',
    'b', 2, 15, 'Beginning inventory held at the start of the financial trading period.', 'Opening stock represents inventory on hand at the start of the year and is debited to the Trading Account.'
),
(
    '63', 'mcq', 'accounting', 'Carriage inward is generally treated as:',
    'Direct expense', 'Indirect income', 'Liability', 'Capital',
    'a', 2, 15, 'Freight and handling costs incurred to transport purchased merchandise inwards.', 'Carriage inward is a direct expense added to cost of purchases in the Trading Account.'
),
(
    '64', 'mcq', 'accounting', 'Carriage outward is generally treated as:',
    'Direct expense', 'Indirect expense', 'Asset', 'Capital receipt',
    'b', 2, 15, 'Freight paid to transport merchandise out to customers upon delivery.', 'Carriage outward is a selling and distribution indirect expense debited to the Profit and Loss Account.'
),
(
    '65', 'mcq', 'accounting', 'Wages paid for production are generally:',
    'Direct expense', 'Indirect expense', 'Liability', 'Income',
    'a', 2, 15, 'Remuneration paid to manual labour directly involved in manufacturing.', 'Wages paid to factory or manufacturing workers are direct expenses debited to the Trading Account.'
),
(
    '66', 'mcq', 'accounting', 'Office salary is generally:',
    'Direct expense', 'Indirect expense', 'Asset', 'Capital',
    'b', 2, 15, 'Remuneration paid to managerial and clerical staff in general administration.', 'Office salaries are indirect administrative expenses debited to the Profit and Loss Account.'
),
(
    '67', 'mcq', 'accounting', 'Rent received is:',
    'Expense', 'Income', 'Asset purchase', 'Drawings',
    'b', 2, 15, 'Revenue earned from leasing out commercial premises or property.', 'Rent received represents operating or non-operating income credited to the Profit and Loss Account.'
),
(
    '68', 'mcq', 'accounting', 'Outstanding expense means:',
    'Expense paid in advance', 'Expense due but not yet paid', 'Income received', 'Asset sold',
    'b', 2, 15, 'Expenses incurred in the period whose monetary settlement remains pending.', 'An outstanding expense is an incurred obligation that is due but unpaid at the end of the accounting period, treated as a liability.'
),
(
    '69', 'mcq', 'accounting', 'Prepaid expense means:',
    'Expense paid in advance', 'Expense unpaid', 'Income outstanding', 'Capital introduced',
    'a', 2, 15, 'Disbursements paid in advance for benefits to be consumed in future periods.', 'A prepaid expense is paid in the current accounting period but relates to subsequent periods, treated as a current asset.'
),
(
    '70', 'mcq', 'accounting', 'Accrued income means:',
    'Income earned but not received', 'Income received in advance', 'Expense unpaid', 'Asset purchased',
    'a', 2, 15, 'Income earned by performing services or delivering goods, but cash uncollected.', 'Accrued income is revenue earned during the accounting year but not yet physically collected, treated as an asset.'
),
(
    '71', 'mcq', 'accounting', 'Income received in advance is:',
    'Asset', 'Liability', 'Expense', 'Loss',
    'b', 2, 15, 'Cash accepted from a customer before delivering the service or goods.', 'Income received in advance represents unearned revenue and is treated as a liability until earned.'
),
(
    '72', 'mcq', 'accounting', 'Bad debts are:',
    'Amounts not recoverable from debtors', 'Amounts received from debtors', 'Capital introduced', 'Bank charges',
    'a', 2, 15, 'Debtor accounts recognized as irrevocably uncollectible and written off.', 'Bad debts are uncollectible receivables from customers that are written off as a business loss.'
),
(
    '73', 'mcq', 'accounting', 'Provision for doubtful debts is created for:',
    'Expected loss from debtors', 'Increase in sales', 'Cash purchases', 'Capital increase',
    'a', 2, 15, 'A conservative buffer set aside for potential default on customer balances.', 'Provision for doubtful debts is an estimated reserve created out of profits to absorb anticipated losses from defaulting debtors.'
),
(
    '74', 'mcq', 'accounting', 'Balance Sheet shows:',
    'Financial position', 'Only gross profit', 'Only cash transactions', 'Only expenses',
    'a', 2, 15, 'A snapshot of what the firm owns and what it owes at a specific calendar date.', 'The Balance Sheet is a financial statement showing the financial position (assets, liabilities, and equity) of an enterprise on a specific date.'
),
(
    '75', 'mcq', 'accounting', 'Balance Sheet contains:',
    'Assets and liabilities', 'Only sales', 'Only purchases', 'Only expenses',
    'a', 2, 15, 'Lists all resources owned alongside all internal and external claims.', 'The Balance Sheet consists of assets (resources owned) on one side and liabilities plus capital (claims against resources) on the other.'
),
(
    '76', 'mcq', 'accounting', 'Capital at the end is affected by:',
    'Profit/loss and drawings', 'Sales only', 'Purchases only', 'Cash sales only',
    'a', 3, 20, 'Ending equity adjusts starting capital for additions, drawings, and earnings.', 'Closing Capital = Opening Capital + Additional Capital + Net Profit (or - Net Loss) - Drawings.'
),
(
    '77', 'mcq', 'accounting', 'A balance sheet must:',
    'Always show equal assets and liabilities only', 'Balance with total assets equal to capital plus liabilities', 'Show only cash', 'Show only profit',
    'b', 3, 20, 'Dual-entry bookkeeping ensures both sides match identically.', 'The Balance Sheet must balance because the total value of all assets must strictly equal the total claims of owners (Capital) and creditors (Liabilities).'
),
(
    '78', 'mcq', 'accounting', 'The accounting year is a period for which:',
    'Accounts are prepared', 'Goods are manufactured', 'Employees are hired', 'Bank opens',
    'a', 3, 20, 'The standard 12-month calendar or fiscal span used for reporting results.', 'An accounting year (fiscal year) is the 12-month period for which annual financial statements are compiled and presented.'
),
(
    '79', 'mcq', 'accounting', 'The concept that assumes business will continue for the foreseeable future is:',
    'Going Concern', 'Dual Aspect', 'Matching', 'Prudence',
    'a', 3, 20, 'Presumes the enterprise will operate indefinitely without intent to liquidate.', 'The Going Concern assumption presumes that the business entity will continue operating for the foreseeable future without liquidation.'
),
(
    '80', 'mcq', 'accounting', 'The concept that requires expenses to be matched with related revenue is:',
    'Matching Concept', 'Business Entity', 'Money Measurement', 'Going Concern',
    'a', 3, 20, 'Revenues earned in a period must be aligned with costs incurred to earn them.', 'The Matching Concept mandates that all expenses incurred to generate revenue during a period must be recognized against that revenue.'
),
(
    '81', 'mcq', 'accounting', 'The concept that treats business and proprietor as separate is:',
    'Business Entity Concept', 'Matching Concept', 'Prudence', 'Consistency',
    'a', 3, 20, 'Separates the financial identity of the business from that of the proprietor.', 'The Business Entity Concept establishes that the business is distinct and legally separate from its owners for accounting purposes.'
),
(
    '82', 'mcq', 'accounting', 'The concept that records only transactions measurable in money is:',
    'Money Measurement', 'Going Concern', 'Matching', 'Dual Aspect',
    'a', 3, 20, 'Restricts financial statements strictly to items quantifiable in currency.', 'The Money Measurement Concept dictates that only events and transactions expressible in monetary terms are recorded in accounts.'
),
(
    '83', 'mcq', 'accounting', 'The principle of recording expected losses but not anticipated profits is:',
    'Prudence', 'Consistency', 'Materiality', 'Going Concern',
    'a', 3, 20, 'Conservatism principle of anticipating no profits but accounting for all losses.', 'The Prudence (Conservatism) principle requires recognizing all probable expenses and liabilities immediately, but not anticipating potential revenues.'
),
(
    '84', 'mcq', 'accounting', 'Consistency means:',
    'Using accounting methods consistently', 'Changing methods every year', 'Ignoring expenses', 'Recording only cash',
    'a', 3, 20, 'Mandates using identical accounting treatments from period to period.', 'The Consistency principle dictates that the same accounting principles and methods should be applied across successive financial periods.'
),
(
    '85', 'mcq', 'accounting', 'A voucher is:',
    'Documentary evidence of a transaction', 'A type of asset', 'A type of liability', 'A profit statement',
    'a', 3, 20, 'Written documentary proof supporting the validity of an accounting entry.', 'A voucher is a written document that provides documentary evidence confirming the authenticity and details of a financial transaction.'
),
(
    '86', 'mcq', 'accounting', 'A debit note is generally issued when:',
    'Goods are returned to supplier', 'Cash is received', 'Goods are sold for cash', 'Salary is paid',
    'a', 3, 20, 'Sent to a supplier to explain a debit deduction from their payable account.', 'A debit note is issued by a purchaser to a supplier informing them that their account has been debited (e.g., when returning goods).'
),
(
    '87', 'mcq', 'accounting', 'A credit note is generally issued when:',
    'Customer returns goods', 'Business purchases goods', 'Cash is deposited', 'Salary is paid',
    'a', 3, 20, 'Sent to a customer acknowledging credit given to reduce their debt.', 'A credit note is issued by a vendor to a customer informing them that their account has been credited (e.g., when goods are returned).'
),
(
    '88', 'mcq', 'accounting', 'An entry involving only one debit and one credit is called:',
    'Simple entry', 'Compound entry', 'Closing entry', 'Adjusting entry',
    'a', 3, 20, 'Basic journal transaction containing precisely one debit and one credit line.', 'A simple journal entry involves only one debit account and one credit account with equal amounts.'
),
(
    '89', 'mcq', 'accounting', 'An entry involving more than two accounts is called:',
    'Simple entry', 'Compound entry', 'Opening entry', 'Transfer entry',
    'b', 3, 20, 'A complex entry containing multiple debits or multiple credits combined.', 'A compound (composite) journal entry involves more than one debit, more than one credit, or both in a single entry.'
),
(
    '90', 'mcq', 'accounting', 'Opening entry is passed to record:',
    'Opening balances', 'Closing stock only', 'Sales only', 'Expenses only',
    'a', 3, 20, 'Passed at the start of a new financial year to transfer previous balances.', 'An opening entry is recorded at the start of a financial year to bring forward ending balances of assets, liabilities, and capital.'
),
(
    '91', 'mcq', 'accounting', 'A contra entry affects:',
    'Cash and bank accounts', 'Purchases and sales', 'Debtors and creditors', 'Capital and drawings only',
    'a', 3, 20, 'Dual cash and bank posting that completes both sides in the cash book itself.', 'A contra entry is a transaction that involves both cash and bank accounts, recorded on both receipt and payment sides of the Cash Book.'
),
(
    '92', 'mcq', 'accounting', 'A transaction between cash and bank is recorded as:',
    'Contra entry', 'Closing entry', 'Transfer entry', 'Adjustment entry',
    'a', 3, 20, 'Cash deposited into bank or cash withdrawn from bank for office use.', 'Depositing cash into bank or withdrawing cash for office use are contra entries because both affected accounts exist in the Cash Book.'
),
(
    '93', 'mcq', 'accounting', 'The balance of a personal account may represent:',
    'Amount receivable or payable', 'Only cash', 'Only profit', 'Only expenses',
    'a', 3, 20, 'A personal account balance indicates whether someone owes or is owed.', 'A debit balance in a personal account represents an amount receivable (debtor), while a credit balance represents an amount payable (creditor).'
),
(
    '94', 'mcq', 'accounting', 'Capital expenditure is expenditure that:',
    'Creates or improves a long-term asset', 'Is incurred daily for operations', 'Is always a loss', 'Is always income',
    'a', 3, 20, 'Outlays that expand long-term productive capability over multiple years.', 'Capital expenditure is an outlay that creates, acquires, or improves a long-term fixed asset, yielding benefits beyond the current period.'
),
(
    '95', 'mcq', 'accounting', 'Revenue expenditure is generally incurred for:',
    'Day-to-day operations', 'Purchase of land only', 'Purchase of building only', 'Creation of goodwill only',
    'a', 3, 20, 'Operational expenses consumed entirely within the current financial cycle.', 'Revenue expenditure is incurred for routine, day-to-day business operations whose benefits are fully exhausted within the accounting period.'
),
(
    '96', 'mcq', 'accounting', 'Purchase of machinery is generally:',
    'Capital expenditure', 'Revenue expenditure', 'Revenue income', 'Drawings',
    'a', 3, 20, 'Acquisition of a long-term productive tool used across many operating years.', 'The purchase of machinery is a capital expenditure because it provides enduring productive benefit over multiple future operating cycles.'
),
(
    '97', 'mcq', 'accounting', 'Payment of electricity bill is generally:',
    'Capital expenditure', 'Revenue expenditure', 'Capital receipt', 'Asset',
    'b', 3, 20, 'Routine recurring operating cost required to maintain ongoing facilities.', 'Payment of an electricity bill is a revenue expenditure because it is a routine operational cost consumed immediately.'
),
(
    '98', 'mcq', 'accounting', 'The amount payable by a business to suppliers is shown as:',
    'Creditors', 'Debtors', 'Stock', 'Cash',
    'a', 3, 20, 'Third-party vendors awaiting settlement for merchandise supplied on terms.', 'Amounts owed by the business to trade suppliers for goods purchased on credit are shown as Creditors (Trade Payables).'
),
(
    '99', 'mcq', 'accounting', 'The amount receivable from customers is shown as:',
    'Creditors', 'Debtors', 'Capital', 'Drawings',
    'b', 3, 20, 'Customers owing balances for merchandise provided on payment terms.', 'Amounts receivable from customers for goods sold on credit are presented on the Balance Sheet as Debtors (Accounts Receivable).'
),
(
    '100', 'mcq', 'accounting', 'When capital is introduced in cash, the entry is:',
    'Cash A/c Dr. To Capital A/c', 'Capital A/c Dr. To Cash A/c', 'Purchases A/c Dr. To Cash A/c', 'Cash A/c Dr. To Sales A/c',
    'a', 3, 20, 'Cash asset increases on debit; owner''s equity increases on credit.', 'When capital is brought in cash, the journal entry is: Cash A/c Dr. (Debit what comes in) To Capital A/c (Credit the giver / increase in equity).'
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



-- Seeds: Demo Users and Profiles

INSERT INTO clients (username, email, phone, password, status)
VALUES ('quizmaster', 'player@example.com', '+1-555-0199', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Pro Quiz Champion', 'user', 'Grade 11', 'CBSE', '["Accounting"]',
       true, 250, 50, 120, 2, 3, 7, CURRENT_DATE, 450
FROM clients WHERE email = 'player@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'player@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'player@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'player@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('arjun_sharma', 'arjun.sharma@example.com', '+1-555-0201', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Arjun Sharma', 'avatar_warrior', 'Grade 11', 'CBSE', '["Accounting", "Business Studies"]',
       true, 450, 80, 350, 3, 5, 12, CURRENT_DATE, 780
FROM clients WHERE email = 'arjun.sharma@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'arjun.sharma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'arjun.sharma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'arjun.sharma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('priya_patel', 'priya.patel@example.com', '+1-555-0202', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Priya Patel', 'avatar_scholar', 'Grade 12', 'CBSE', '["Accounting", "Economics"]',
       true, 820, 120, 680, 4, 8, 15, CURRENT_DATE, 1240
FROM clients WHERE email = 'priya.patel@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'priya.patel@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'priya.patel@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'priya.patel@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('rohan_mehta', 'rohan.mehta@example.com', '+1-555-0203', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Rohan Mehta', 'avatar_ninja', 'Grade 10', 'ICSE', '["Accounting", "Mathematics"]',
       true, 310, 45, 210, 2, 3, 6, CURRENT_DATE, 490
FROM clients WHERE email = 'rohan.mehta@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'rohan.mehta@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'rohan.mehta@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'rohan.mehta@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('ananya_iyer', 'ananya.iyer@example.com', '+1-555-0204', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Ananya Iyer', 'avatar_wizard', 'Grade 12', 'ISC', '["Accounting", "Commerce"]',
       true, 1500, 210, 1450, 6, 14, 21, CURRENT_DATE, 2150
FROM clients WHERE email = 'ananya.iyer@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'ananya.iyer@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'ananya.iyer@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'ananya.iyer@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('vikram_singh', 'vikram.singh@example.com', '+1-555-0205', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Vikram Singh', 'avatar_champion', 'Grade 11', 'State Board', '["Accounting"]',
       true, 620, 95, 520, 3, 6, 10, CURRENT_DATE, 960
FROM clients WHERE email = 'vikram.singh@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'vikram.singh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'vikram.singh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'vikram.singh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('sneha_reddy', 'sneha.reddy@example.com', '+1-555-0206', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Sneha Reddy', 'avatar_ace', 'Grade 11', 'CBSE', '["Accounting", "Economics"]',
       true, 950, 140, 890, 5, 9, 16, CURRENT_DATE, 1580
FROM clients WHERE email = 'sneha.reddy@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'sneha.reddy@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'sneha.reddy@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'sneha.reddy@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('kabir_joshi', 'kabir.joshi@example.com', '+1-555-0207', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Kabir Joshi', 'avatar_explorer', 'Grade 10', 'CBSE', '["Accounting"]',
       true, 180, 30, 140, 1, 2, 4, CURRENT_DATE, 320
FROM clients WHERE email = 'kabir.joshi@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'kabir.joshi@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'kabir.joshi@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'kabir.joshi@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('tanvi_deshmukh', 'tanvi.deshmukh@example.com', '+1-555-0208', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Tanvi Deshmukh', 'avatar_master', 'Grade 12', 'State Board', '["Accounting", "Finance"]',
       true, 1850, 260, 1980, 7, 18, 25, CURRENT_DATE, 2680
FROM clients WHERE email = 'tanvi.deshmukh@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'tanvi.deshmukh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'tanvi.deshmukh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'tanvi.deshmukh@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('aditya_verma', 'aditya.verma@example.com', '+1-555-0209', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Aditya Verma', 'avatar_tactician', 'Grade 11', 'ICSE', '["Accounting", "Business Studies"]',
       true, 540, 75, 410, 3, 4, 9, CURRENT_DATE, 810
FROM clients WHERE email = 'aditya.verma@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'aditya.verma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'aditya.verma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'aditya.verma@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO clients (username, email, phone, password, status)
VALUES ('meera_nair', 'meera.nair@example.com', '+1-555-0210', '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active')
ON CONFLICT (email) DO UPDATE SET
    username = EXCLUDED.username,
    password = EXCLUDED.password,
    status = EXCLUDED.status,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_profiles (
    client_id, uuid, full_name, avatar_id, class, board, subjects,
    is_onboarded, coins, gems, experience, level, current_streak,
    highest_streak, last_active_date, weekly_score
)
SELECT id, gen_random_uuid()::text, 'Meera Nair', 'avatar_legend', 'Grade 12', 'CBSE', '["Accounting", "Economics", "Commerce"]',
       true, 2400, 350, 2650, 8, 21, 30, CURRENT_DATE, 3400
FROM clients WHERE email = 'meera.nair@example.com'
ON CONFLICT (client_id) DO UPDATE SET
    full_name = EXCLUDED.full_name,
    avatar_id = EXCLUDED.avatar_id,
    class = EXCLUDED.class,
    board = EXCLUDED.board,
    subjects = EXCLUDED.subjects,
    is_onboarded = EXCLUDED.is_onboarded,
    coins = EXCLUDED.coins,
    gems = EXCLUDED.gems,
    experience = EXCLUDED.experience,
    level = EXCLUDED.level,
    current_streak = EXCLUDED.current_streak,
    highest_streak = EXCLUDED.highest_streak,
    weekly_score = EXCLUDED.weekly_score,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '2 day')::date::text, true FROM clients WHERE email = 'meera.nair@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, (CURRENT_DATE - INTERVAL '1 day')::date::text, true FROM clients WHERE email = 'meera.nair@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;

INSERT INTO client_streak_activities (client_id, activity_date, completed)
SELECT id, CURRENT_DATE::text, true FROM clients WHERE email = 'meera.nair@example.com'
ON CONFLICT (client_id, activity_date) DO NOTHING;


