WITH test_data AS (
    SELECT 'Data Engineer' AS job_title UNION ALL
    SELECT 'Senior Data Engineer' UNION ALL
    SELECT 'Analyst'
)

SELECT *
FROM (
    SELECT 
        job_title, 
        {{ translate_title('job_title') }} AS translated_job_title
    FROM test_data
) result
WHERE 
    (job_title = 'Data Engineer' AND translated_job_title != 'Junior Data Engineer')
    OR (job_title != 'Data Engineer' AND translated_job_title != job_title)
