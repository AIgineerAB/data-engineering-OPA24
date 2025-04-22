WITH example_ids AS (
    SELECT 123 AS user_id, 123 AS product_id
    UNION ALL
    SELECT 123 AS user_id, NULL AS product_id
    UNION ALL
    SELECT NULL AS user_id, 123 AS product_id
    UNION ALL
    SELECT 1231 AS user_id, 23 AS product_id
)

SELECT
    user_id,
    product_id,
    {{ dbt_utils.generate_surrogate_key(['user_id', 'product_id']) }} AS skey
FROM
    example_ids
