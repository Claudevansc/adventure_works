with source as (

    select * from {{ source('adventure_works', 'person_person') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(businessentityid as int) as person_id,

        -- Atributos da Pessoa
        cast(persontype as string) as person_type,
        cast(namestyle as boolean) as is_western_name_style,
        cast(title as string) as title,
        cast(firstname as string) as first_name,
        cast(middlename as string) as middle_name,
        cast(lastname as string) as last_name,
        cast(suffix as string) as suffix,

        -- Preferências e Informações Adicionais
        cast(emailpromotion as int) as email_promotion,
        cast(additionalcontactinfo as string) as additional_contact_info,
        cast(demographics as string) as demographics,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

        -- Nota: A coluna 'rowguid' foi omitida por ser um identificador técnico sem valor analítico.

    from source

)

select * from renamed