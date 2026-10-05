with person as (
    select * from {{ ref('stg_person') }}
)

select
    person_id,
    person_type,
    first_name,
    last_name,
    concat(first_name, ' ', last_name) as full_name
from person