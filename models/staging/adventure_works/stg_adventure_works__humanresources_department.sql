with source as (

    select * from {{ source('adventure_works', 'humanresources_department') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(departmentid as int) as department_id,

        -- Informações do Departamento
        cast(name as string) as department_name,
        cast(groupname as string) as group_name,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed