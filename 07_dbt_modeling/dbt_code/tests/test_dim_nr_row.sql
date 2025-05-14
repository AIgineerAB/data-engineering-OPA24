-- run with dbt test -s

with fct as (
    select count(distinct occupation_id) as nr_unique_occupation
    from {{ ref('fct_job_ads') }}
),
    dim as (
    select count(*) as nr_rows_dim
    from {{ ref('dim_occupation') }}
),
    comparison as (
    select *
    from fct
    cross join dim --cross join/cartesian product
)

select *
from comparison
where nr_unique_occupation <> nr_rows_dim




-- select *
-- from comparison

-- select *
-- from comparison
-- where nr_unique_employer <> nr_rows_dim
