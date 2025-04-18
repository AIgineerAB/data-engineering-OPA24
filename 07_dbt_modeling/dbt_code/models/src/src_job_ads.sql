WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_data_ads') }})

SELECT
    id,
    headline, 
    number_of_vacancies AS vacancies, 
    relevance, 
    application_deadline
FROM stg_job_ads
ORDER BY application_deadline ASC