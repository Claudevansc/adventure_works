with source as (

    select * from {{ source('adventure_works', 'humanresources_employee') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(businessentityid as int) as employee_id,

        -- Informações Pessoais e Profissionais
        cast(nationalidnumber as string) as national_id_number,
        cast(loginid as string) as login_id,
        cast(jobtitle as string) as job_title,
        cast(gender as string) as gender,
        cast(maritalstatus as string) as marital_status,

        -- Datas de Nascimento e Contratação
        cast(birthdate as date) as birth_date,
        cast(hiredate as date) as hire_date,

        -- Horas e Benefícios
        cast(vacationhours as int) as vacation_hours,
        cast(sickleavehours as int) as sick_leave_hours,

        -- Indicadores (Flags Booleanas)
        cast(salariedflag as boolean) as is_salaried,
        cast(currentflag as boolean) as is_active,

        -- Metadados / Outros
        cast(organizationnode as string) as organization_node,
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed