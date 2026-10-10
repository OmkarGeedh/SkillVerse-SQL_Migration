-- Seeds: Demo Users and Profiles

INSERT INTO clients (username, email, phone, password, status)
VALUES ('quizmaster', 'player@example.com', '+1-555-0199', '$2a$12$NqLpY1qMsn43K7F7z9sEa.YfR9N8hJj7XbE0jO6o8s4eH1uV5mK0K', 'active')
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

