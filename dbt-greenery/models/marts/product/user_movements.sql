WITH funnel_steps AS (
    SELECT
        e1.user_id,
        e1.event_created_at,
        e1.event_type AS funnel_step,
        e2.event_type AS next_funnel_step
    FROM
        {{ ref('int_events') }} AS e1
        LEFT JOIN {{ ref('int_events') }} AS e2
        ON e1.user_id = e2.user_id
        AND e1.rn = e2.rn -1
)
SELECT
    DATE_TRUNC(
        'month',
        user_created_at
    ) :: DATE AS user_signup_monthly_cohorts,
    funnel_step,
    next_funnel_step,
    COUNT(user_id) count_users
FROM
    funnel_steps
    LEFT JOIN {{ ref('dim_users') }} USING (user_id)
GROUP BY
    1,
    2,
    3
ORDER BY
    1,
    4
