with department as (
    select * from {{ ref('stg_humanresources_department') }}
)

select
    department_id,
    department_name,
    group_name,
    modified_date
from department