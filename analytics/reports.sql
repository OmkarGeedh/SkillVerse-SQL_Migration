-- SkillVerse product reports. Read-only: run any of these in a SQL console against
-- the database. Nothing here changes data.
--
-- Time is UTC throughout (the same clock the streak uses).
-- "Active day" = a day the player opened the app: client_activity_days is written
-- when their profile loads (and when a game finishes).

-------------------------------------------------------------------------------
-- 1. Retention by signup day: of the players who joined on a day, how many came
--    back 1, 7 and 30 days later? A column is blank until that many days have
--    passed since the signup day (so a young cohort is not counted as "lost").
-------------------------------------------------------------------------------
WITH cohort AS (
    SELECT id AS client_id, created_at::date AS signup_day
    FROM clients
)
SELECT
    c.signup_day,
    count(*)                                                         AS new_players,
    CASE WHEN c.signup_day <= current_date - 1 THEN
        round(100.0 * count(*) FILTER (WHERE EXISTS (
            SELECT 1 FROM client_activity_days d
            WHERE d.client_id = c.client_id AND d.day = c.signup_day + 1)) / count(*), 1)
    END                                                              AS day1_pct,
    CASE WHEN c.signup_day <= current_date - 7 THEN
        round(100.0 * count(*) FILTER (WHERE EXISTS (
            SELECT 1 FROM client_activity_days d
            WHERE d.client_id = c.client_id AND d.day = c.signup_day + 7)) / count(*), 1)
    END                                                              AS day7_pct,
    CASE WHEN c.signup_day <= current_date - 30 THEN
        round(100.0 * count(*) FILTER (WHERE EXISTS (
            SELECT 1 FROM client_activity_days d
            WHERE d.client_id = c.client_id AND d.day = c.signup_day + 30)) / count(*), 1)
    END                                                              AS day30_pct
FROM cohort c
GROUP BY c.signup_day
ORDER BY c.signup_day DESC
LIMIT 60;

-------------------------------------------------------------------------------
-- 2. Players active per day (last 30 days), and "stickiness": the share of the
--    month's players who show up on an average day. Above 20% is healthy.
-------------------------------------------------------------------------------
SELECT day, count(*) AS active_players
FROM client_activity_days
WHERE day >= current_date - 30
GROUP BY day
ORDER BY day DESC;

SELECT
    round(avg(daily.n), 1)                                   AS avg_daily_players,
    (SELECT count(DISTINCT client_id) FROM client_activity_days
      WHERE day >= current_date - 30)                        AS monthly_players,
    round(100.0 * avg(daily.n) / NULLIF(
        (SELECT count(DISTINCT client_id) FROM client_activity_days
          WHERE day >= current_date - 30), 0), 1)            AS stickiness_pct
FROM (
    SELECT day, count(*) AS n
    FROM client_activity_days
    WHERE day >= current_date - 30
    GROUP BY day
) daily;

-------------------------------------------------------------------------------
-- 3. Games finished per day and per active player (last 14 days), by mode.
-------------------------------------------------------------------------------
SELECT completed_at::date AS day, game_mode,
       count(*)                      AS games,
       count(DISTINCT client_id)     AS players,
       round(count(*)::numeric / count(DISTINCT client_id), 2) AS games_per_player
FROM leaderboard_game_results
WHERE completed_at >= now() - interval '14 days'
GROUP BY 1, 2
ORDER BY 1 DESC, 2;

-------------------------------------------------------------------------------
-- 4. Are the habit features being used? Rewards and purchases in the last 7 days.
-------------------------------------------------------------------------------
SELECT transaction_type,
       count(DISTINCT client_id) AS players,
       count(*)                  AS times,
       sum(amount)               AS total_amount
FROM wallet_ledger
WHERE created_at >= now() - interval '7 days'
  AND transaction_type IN ('quiz_reward', 'daily_goal_reward', 'streak_bonus',
                           'streak_freeze_purchase', 'spin_reward')
GROUP BY transaction_type
ORDER BY players DESC;

-------------------------------------------------------------------------------
-- 5. Reminder funnel (needs analytics_events, migration 000008): how many players
--    saw the "Protect your streak" question, said yes, said no, or were blocked
--    by their phone.
-------------------------------------------------------------------------------
SELECT name, count(DISTINCT client_id) AS players, count(*) AS times
FROM analytics_events
WHERE name IN ('reminder_prompt_shown', 'reminder_enabled',
               'reminder_declined', 'reminder_blocked')
  AND occurred_at >= now() - interval '30 days'
GROUP BY name
ORDER BY players DESC;

-------------------------------------------------------------------------------
-- 6. Where do players quit a game (needs analytics_events)? By mode and question.
-------------------------------------------------------------------------------
SELECT props ->> 'mode'            AS mode,
       props ->> 'question_index'  AS question_index,
       count(*)                    AS quits
FROM analytics_events
WHERE name = 'game_quit'
  AND occurred_at >= now() - interval '30 days'
GROUP BY 1, 2
ORDER BY quits DESC
LIMIT 30;

