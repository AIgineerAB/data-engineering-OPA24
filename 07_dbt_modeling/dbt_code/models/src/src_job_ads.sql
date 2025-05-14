with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    id, 
    employer__workplace,
    workplace_address__municipality,
    occupation__label,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline
from stg_job_ads
order by application_deadline
