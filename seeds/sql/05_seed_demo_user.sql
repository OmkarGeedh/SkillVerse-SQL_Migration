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

