-- user_id
-- order_id
-- fist_name
-- last_name
-- email
-- -- AGG DATA
-- pending_order_count
-- delivered_order_count
-- shipped_order_count
-- order_revenue
-- order_cost
-- order_profit
SELECT
    u.user_id,
    o.order_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    {{ ref('stg_orders') }}
    o
    LEFT JOIN {{ ref('dim_users') }}
    u
    ON u.user_id = o.user_id
