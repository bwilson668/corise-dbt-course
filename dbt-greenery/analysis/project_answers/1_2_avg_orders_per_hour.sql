WITH orders_by_hour AS (
    SELECT
        DATE_TRUNC(
            'hour',
            created_at
        ) AS order_at,
        COUNT(*) AS num_orders
    FROM
        ref('stg_orders')
    WHERE
        created_at IS NOT NULL
    GROUP BY
        1
)
SELECT
    ROUND(AVG(num_orders), 2) AS avg_orders_per_hour
FROM
    orders_by_hour
