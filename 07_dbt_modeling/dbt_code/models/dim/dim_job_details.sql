with src_job_details as (select * from {{ ref('src_job_details') }})

select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as job_details_id,
    headline,
    description,
    description_html,
    coalesce(duration, 'ej angiven') as duration,
    salary_type,
    coalesce(salary_description, 'ej specificerad') as salary_description,
    coalesce(working_hours_type, 'ej specificerad') as working_hours_type, 
    scope_of_work_min,
    scope_of_work_max
from src_job_details
