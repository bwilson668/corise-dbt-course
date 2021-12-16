SELECT
    ROUND((num_checkouts :: DECIMAL / num_sessions) * 100, 2) AS conversion_rate
FROM
    (
        SELECT
            SUM(
                CASE
                    WHEN event_type = 'checkout' THEN 1
                    ELSE 0
                END
            ) AS num_checkouts,
            COUNT(
                DISTINCT session_id
            ) AS num_sessions
        FROM
            {{ ref('stg_events') }}
