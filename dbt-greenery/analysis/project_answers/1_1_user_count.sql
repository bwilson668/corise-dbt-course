SELECT
    COUNT(
        DISTINCT user_id
    ) AS user_count
FROM
    {{ ref('stg_users') }}
