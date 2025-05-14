with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    employer__organization_number as employer_organization_number,
    employer__name as employer_name,
    employer__workplace as employer_workplace,  --  primary key
    workplace_address__country as workplace_country,
    workplace_address__region as workplace_region,
    workplace_address__municipality as workplace_municipality,  --  primary key
    workplace_address__city as workplace_city,
    workplace_address__postcode as workplace_postcode,
    employer__url as employer_url,
from stg_job_ads 
