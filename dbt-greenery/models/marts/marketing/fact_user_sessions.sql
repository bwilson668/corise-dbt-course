SELECT
    s.session_id,
    s.page_view,
    s.add_to_cart,
    s.checkout,
    s.delete_from_cart,
    s.account_created,
    s.package_shiped,
    u.*
FROM
    {{ ref('int_sessions_event_agg') }}
    s
    LEFT JOIN {{ ref('stg_users') }}
    u
    ON u.user_id = s.user_id
