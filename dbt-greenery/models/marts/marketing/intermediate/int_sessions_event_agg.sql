SELECT
    session_id,
    event_created_at,
    user_id,
    SUM(
        CASE
            WHEN event_type = 'page_view' THEN 1
            ELSE 0
        END
    ) AS page_view,
    SUM(
        CASE
            WHEN event_type = 'add_to_cart' THEN 1
            ELSE 0
        END
    ) AS add_to_cart,
    SUM(
        CASE
            WHEN event_type = 'checkout' THEN 1
            ELSE 0
        END
    ) AS checkout,
    SUM(
        CASE
            WHEN event_type = 'delete_from_cart' THEN 1
            ELSE 0
        END
    ) AS delete_from_cart,
    SUM(
        CASE
            WHEN event_type = 'account_created' THEN 1
            ELSE 0
        END
    ) AS account_created,
    SUM(
        CASE
            WHEN event_type = 'package_shipped' THEN 1
            ELSE 0
        END
    ) AS package_shiped
FROM
    {{ ref('stg_events') }}
GROUP BY
    1,
    2,
    3
