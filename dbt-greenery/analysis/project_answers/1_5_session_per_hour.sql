WITH sessions_by_hour AS (
    SELECT
        DATE_TRUNC(
            'hour',
            created_at
        ) AS session_started_at,
        COUNT(
            DISTINCT session_id
        ) AS session_count
    FROM
        stg_events
    WHERE
        created_at IS NOT NULL
    GROUP BY
        1
)
SELECT
    ROUND(AVG(session_count), 2)
FROM
    sessions_by_hour
