-- Demo players for development/staging. Every account uses password: secretpassword123
WITH u (username, email, phone, full_name, avatar_id, class, board, subjects, coins, gems, experience, level, current_streak, highest_streak, weekly_score) AS (
VALUES
    ('quizmaster', 'player@example.com', '+1-555-0199', 'Pro Quiz Champion', 'user', 'Grade 11', 'CBSE', '["Accounting"]', 250, 50, 120, 2, 3, 7, 450),
    ('arjun_sharma', 'arjun.sharma@example.com', '+1-555-0201', 'Arjun Sharma', 'avatar_warrior', 'Grade 11', 'CBSE', '["Accounting", "Business Studies"]', 450, 80, 350, 3, 5, 12, 780),
    ('priya_patel', 'priya.patel@example.com', '+1-555-0202', 'Priya Patel', 'avatar_scholar', 'Grade 12', 'CBSE', '["Accounting", "Economics"]', 820, 120, 680, 4, 8, 15, 1240),
    ('rohan_mehta', 'rohan.mehta@example.com', '+1-555-0203', 'Rohan Mehta', 'avatar_ninja', 'Grade 10', 'ICSE', '["Accounting", "Mathematics"]', 310, 45, 210, 2, 3, 6, 490),
    ('ananya_iyer', 'ananya.iyer@example.com', '+1-555-0204', 'Ananya Iyer', 'avatar_wizard', 'Grade 12', 'ISC', '["Accounting", "Commerce"]', 1500, 210, 1450, 6, 14, 21, 2150),
    ('vikram_singh', 'vikram.singh@example.com', '+1-555-0205', 'Vikram Singh', 'avatar_champion', 'Grade 11', 'State Board', '["Accounting"]', 620, 95, 520, 3, 6, 10, 960),
    ('sneha_reddy', 'sneha.reddy@example.com', '+1-555-0206', 'Sneha Reddy', 'avatar_ace', 'Grade 11', 'CBSE', '["Accounting", "Economics"]', 950, 140, 890, 5, 9, 16, 1580),
    ('kabir_joshi', 'kabir.joshi@example.com', '+1-555-0207', 'Kabir Joshi', 'avatar_explorer', 'Grade 10', 'CBSE', '["Accounting"]', 180, 30, 140, 1, 2, 4, 320),
    ('tanvi_deshmukh', 'tanvi.deshmukh@example.com', '+1-555-0208', 'Tanvi Deshmukh', 'avatar_master', 'Grade 12', 'State Board', '["Accounting", "Finance"]', 1850, 260, 1980, 7, 18, 25, 2680),
    ('aditya_verma', 'aditya.verma@example.com', '+1-555-0209', 'Aditya Verma', 'avatar_tactician', 'Grade 11', 'ICSE', '["Accounting", "Business Studies"]', 540, 75, 410, 3, 4, 9, 810),
    ('meera_nair', 'meera.nair@example.com', '+1-555-0210', 'Meera Nair', 'avatar_legend', 'Grade 12', 'CBSE', '["Accounting", "Economics", "Commerce"]', 2400, 350, 2650, 8, 21, 30, 3400)
),
c AS (
    INSERT INTO clients (username, email, phone, password, status)
    SELECT username, email, phone, '$2a$12$FDChY3DB1CCaXYANYZi1iegRKal5QXEZFTQfsavE6D4MHDl1ZKw2C', 'active' FROM u
    ON CONFLICT (email) DO UPDATE SET
        username = EXCLUDED.username,
        phone = EXCLUDED.phone,
        password = EXCLUDED.password,
        status = EXCLUDED.status,
        updated_at = now()
    RETURNING id, email
),
p AS (
    INSERT INTO client_profiles (
        client_id, uuid, full_name, avatar_id, class, board, subjects, is_onboarded,
        coins, gems, experience, level, current_streak, highest_streak, last_active_date, weekly_score
    )
    SELECT c.id, gen_random_uuid()::text, u.full_name, u.avatar_id, u.class, u.board, u.subjects, true,
           u.coins, u.gems, u.experience, u.level, u.current_streak, u.highest_streak, CURRENT_DATE, u.weekly_score
    FROM u JOIN c USING (email)
    ON CONFLICT (client_id) DO UPDATE SET
        full_name = EXCLUDED.full_name,
        avatar_id = EXCLUDED.avatar_id,
        class = EXCLUDED.class,
        board = EXCLUDED.board,
        subjects = EXCLUDED.subjects,
        coins = EXCLUDED.coins,
        gems = EXCLUDED.gems,
        experience = EXCLUDED.experience,
        level = EXCLUDED.level,
        current_streak = EXCLUDED.current_streak,
        highest_streak = EXCLUDED.highest_streak,
        weekly_score = EXCLUDED.weekly_score,
        updated_at = now()
)
INSERT INTO client_streak_activities (client_id, activity_date)
SELECT c.id, to_char(CURRENT_DATE - d, 'YYYY-MM-DD')
FROM c CROSS JOIN generate_series(0, 2) AS d
ON CONFLICT (client_id, activity_date) DO NOTHING;
