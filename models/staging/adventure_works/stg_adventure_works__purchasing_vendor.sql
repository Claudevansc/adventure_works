with source as (

    select * from {{ source('adventure_works', 'purchasing_vendor') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(businessentityid as int) as vendor_id,

        -- Informações do Fornecedor
        cast(accountnumber as string) as account_number,
        cast(name as string) as vendor_name,
        cast(creditrating as int) as credit_rating,
        cast(purchasingwebserviceurl as string) as purchasing_web_service_url,

        -- Indicadores (Flags Booleanas)
        cast(preferredvendorstatus as boolean) as is_preferred_vendor,
        cast(activeflag as boolean) as is_active,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed