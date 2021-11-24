-- sesssion_id
-- user_id
-- first_name
-- last_name
-- delete_from_cart
-- checkout
-- page_view
-- add_to_cart
-- account_created
-- first_session_event
-- session_length_minutes
SELECT
    *
FROM
    {{ ref('stg_events') }}
    e
    LEFT JOIN {{ ref('stg_users') }}
    u
    ON u.user_id = e.user_id
