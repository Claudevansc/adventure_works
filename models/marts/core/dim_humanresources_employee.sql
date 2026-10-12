with employee as (
    select * from {{ ref('stg_humanresources_employee') }}
)

select
    business_entity_id,
    national_id_number,
    login_id,
    job_title,
    birth_date,
    marital_status,
    gender,
    hire_date,
    salaried_flag,
    vacation_hours,
    sick_leave_hours,
    current_flag,
    row_guid,
    modified_date
from employee