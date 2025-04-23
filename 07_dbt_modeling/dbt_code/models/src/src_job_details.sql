with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    id,
    headline,
    description__text as description,
    description__text_formatted as description_html,
    duration__label as duration,
    salary_type__label as salary_type,
    salary_description, 
    working_hours_type__label as working_hours_type,
    scope_of_work__min as scope_of_work_min,
    scope_of_work__max as scope_of_work_max
from stg_job_ads