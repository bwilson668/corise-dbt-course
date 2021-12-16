WITH base AS (
    SELECT
        event_id,
        event_created_at,
        session_id,
        user_id,
        page_url,
        event_type,
        regexp_split_to_array(
            page_url,
            '/'
        ) AS url_array,
        ROW_NUMBER() over (
            PARTITION BY user_id
            ORDER BY
                event_created_at
        ) AS rn
    FROM
        {{ ref('stg_events') }}
)
SELECT
    *,
    CASE
        WHEN url_array [4] = 'product' THEN url_array [5]
    END AS product_id
FROM
    base
