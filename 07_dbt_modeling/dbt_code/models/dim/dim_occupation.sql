with src_occupation as (select * from {{ ref('src_occupation') }})

-- we use aggregate function max() for deduplicate, but there are more alternative codes one can use for this purpose
select
    {{ dbt_utils.generate_surrogate_key(['occupation']) }} as occupation_id,
    occupation,
    max(occupation_group),
    max(occupation_field)
from src_occupation
group by occupation 

-- we use 'occupation' for group by instead of 'occupation_id' in this model
-- using both will logically give rise to the same results
-- here we have to use 'occupation' due to how duckdb execute this specific query behind the scene
-- for occupation_id, we don't need use aggregation function max() because with the group by clause, it is clear that all value of 'occupation' in a group is the same