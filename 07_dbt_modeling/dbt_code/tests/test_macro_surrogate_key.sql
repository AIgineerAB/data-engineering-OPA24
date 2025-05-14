-- this is to test that the macro can handle null value and separator when generating surrogate key
-- run with dbt test -s

WITH example AS (
    SELECT 123 AS user_id, 123 AS product_id
    UNION ALL
    SELECT 123 AS user_id, NULL AS product_id
    UNION ALL
    SELECT NULL AS user_id, 123 AS product_id
    UNION ALL
    SELECT 1231 AS user_id, 23 AS product_id
    ),
    example_with_key AS (
    SELECT
    user_id,
    product_id,
    {{ dbt_utils.generate_surrogate_key(['user_id', 'product_id']) }} AS skey
    FROM
    example
    )

-- for an overview of data with jinja sql
SELECT * FROM example_with_key

-- for dbt test to check if there is duplicates in skey
{# SELECT skey
FROM example_with_key
GROUP BY skey
HAVING COUNT(*) > 1 #}