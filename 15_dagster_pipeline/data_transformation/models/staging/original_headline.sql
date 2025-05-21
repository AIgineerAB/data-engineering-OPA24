WITH staging_data AS (
    SELECT * FROM {{ source('jobads', 'hits') }}
)
SELECT headline,
       current_timestamp as load_timestamp
FROM staging_data

 