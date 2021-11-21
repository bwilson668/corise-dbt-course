WITH delivery_times AS (
    SELECT
        order_id,
        delivered_at - created_at AS delivery_time
    FROM
        {{ ref('stg_orders') }}
    WHERE
        created_at IS NOT NULL
        AND delivered_at IS NOT NULL
)
SELECT
    AVG(delivery_time) AS avg_delivery_time
FROM
    delivery_times
