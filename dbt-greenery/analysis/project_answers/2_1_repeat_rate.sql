WITH orders_by_user AS (
    SELECT
        u.user_id,
        u.email,
        COUNT(
            DISTINCT o.order_id
        ) AS order_count
    FROM
        stg_users u
        LEFT JOIN stg_orders o
        ON o.user_id = u.user_id
    GROUP BY
        1,
        2
    HAVING
        COUNT(
            DISTINCT o.order_id
        ) >= 1
)
SELECT
    ROUND(
        COUNT(
            DISTINCT CASE
                WHEN order_count > 1 THEN user_id
                ELSE NULL
            END
        ) / COUNT(
            DISTINCT user_id
        ) :: DECIMAL,
        3
    ) AS repeat_rate
FROM
    orders_by_user
