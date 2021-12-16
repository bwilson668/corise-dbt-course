WITH checkout_sessions AS (
    SELECT
        DISTINCT session_id
    FROM
        {{ ref('int_user_events') }}
    WHERE
        event_type = 'checkout'
)
SELECT
    product_name,
    ROUND(
        (
            SUM(
                CASE
                    WHEN event_type = 'add_to_cart' THEN 1
                    ELSE 0
                END
            ) * 1.0
        ) / COUNT(
            DISTINCT e.session_id
        ),
        2
    ) AS conv_rate
FROM
    {{ ref('int_user_events') }}
    e
    INNER JOIN checkout_sessions cs
    ON e.session_id = cs.session_id
WHERE
    page_name = 'Product Page'
GROUP BY
    1
