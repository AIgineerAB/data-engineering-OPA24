with src_employer as (select * from {{ ref('src_employer') }})

select
    {{ dbt_utils.generate_surrogate_key(['employer_workplace', 'workplace_municipality']) }}
    as employer_id,
    coalesce(
        employer_organization_number, 'saknar organisationsnummer'
    ) as employer_organization_number,
    coalesce(employer_name, 'namn ej angiven') as employer_name,
    coalesce(employer_workplace, 'plats ej angiven') as employer_workplace,
    coalesce(workplace_country, 'land ej angiven') as workplace_country,
    coalesce(workplace_region, 'region ej angiven') as workplace_region,
    coalesce(workplace_municipality, 'kommun ej angiven') as workplace_municipality,
    coalesce(
        {{ capitalize_first_letter("coalesce(workplace_city, workplace_municipality)") }},
        'stad ej angiven'
    ) as workplace_city,
    coalesce(employer_url, 'webbplats ej angiven') as employer_url
from src_employer
