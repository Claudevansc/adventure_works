select
    departmentid as department_id,
    name as department_name,
    groupname as group_name,
    modifieddate as modified_date

from {{ source('adventure_works', 'humanresources_department') }}