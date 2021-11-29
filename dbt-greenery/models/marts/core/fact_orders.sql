SELECT
    o.order_id,
    o.created_at AS ordered_at,
    o.shipping_cost,
    o.order_total,
    o.tracking_id,
    o.shipping_service,
    o.estimated_delivery_at,
    o.delivered_at,
    o.order_status,
    p.promo_id,
    p.discount
FROM
    {{ ref('stg_orders') }}
    o
    LEFT JOIN {{ ref('stg_promos') }}
    p
    ON o.promo_id = p.promo_id
