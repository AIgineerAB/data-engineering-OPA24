-- run with dbt test -s 

with src as (
    select count(*) as nr_rows_src
    from {{ ref('src_occupation') }}
    where occupation_field = 'Data/IT'
),
    mart as (
    select count(*) as nr_rows_mart
    from {{ ref('mart_datait_jobs') }}
),
    comparison as (
    select *
    from src
    cross join mart --cross join/cartesian product
)


select *
from comparison
where nr_rows_src <> nr_rows_mart


{# select *
from mart #}

{# select *
from job_ads #}
