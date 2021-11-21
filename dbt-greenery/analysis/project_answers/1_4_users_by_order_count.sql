WITH user_order_counts AS (
    SELECT
        user_id,
        COUNT(
            DISTINCT order_id
        ) AS order_count
    FROM
        {{ ref('stg_orders') }}
    GROUP BY
        1
)
SELECT
    order_count,
    COUNT(
        DISTINCT user_id
    ) AS user_group_size
FROM
    user_order_counts
GROUP BY
    1
ORDER BY
    1
