SELECT
    event_id,
    created_at,
    session_id,
    user_id,
    page_url
FROM
    {{ ref('stg_events') }}
WHERE
    event_type = 'page_view'
