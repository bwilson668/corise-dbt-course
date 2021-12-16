WITH page_view_sessions AS (
    SELECT
        session_id,
        user_id,
        MIN(event_created_at) AS session_started_at
    FROM
        {{ ref('int_events') }}
    WHERE
        event_type IN (
            'page_view',
            'add_to_cart',
            'checkout'
        )
    GROUP BY
        1,
        2
),
cart_sessions AS (
    SELECT
        DISTINCT session_id AS cart_session_id
    FROM
        {{ ref('int_events') }}
    WHERE
        event_type IN (
            'add_to_cart',
            'checkout'
        )
),
checkout_sessions AS (
    SELECT
        DISTINCT session_id AS checkout_session_id
    FROM
        {{ ref('int_events') }}
    WHERE
        event_type IN ('checkout')
),
product_funnel AS(
    SELECT
        pvs.session_id,
        session_started_at,
        cart_session_id,
        checkout_session_id,
        pvs.user_id,
        product_id
    FROM
        page_view_sessions pvs
        LEFT JOIN cart_sessions AS atcs
        ON atcs.cart_session_id = pvs.session_id
        LEFT JOIN checkout_sessions AS cs
        ON cs.checkout_session_id = pvs.session_id
        LEFT JOIN {{ ref('fact_product_sessions') }} AS ps
        ON ps.session_id = pvs.session_id
)
SELECT
    COUNT(session_id) AS nr_page_view_sessions,
    COUNT(cart_session_id) AS nr_cart_sessions,
    COUNT(checkout_session_id) AS nr_checkout_sessions,
    COUNT(cart_session_id) :: numeric / COUNT(session_id) :: numeric AS page_view_to_cart_dropoff,
    COUNT(checkout_session_id) :: numeric / COUNT(cart_session_id) :: numeric AS cart_to_checkout_dropoff
FROM
    product_funnel
