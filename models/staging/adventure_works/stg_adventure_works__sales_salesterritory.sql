with source as (

    select * from {{ source('adventure_works', 'sales_salesterritory') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(territoryid as int) as territory_id,

        -- Informações Geográficas e Gerais
        cast(name as string) as territory_name,
        cast(countryregioncode as string) as country_region_code,
        cast(group as string) as territory_group,

        -- Métricas Financeiras / Vendas
        cast(salesytd as numeric) as sales_ytd,
        cast(saleslastyear as numeric) as sales_last_year,
        cast(costytd as numeric) as cost_ytd,
        cast(costlastyear as numeric) as cost_last_year,

        -- Metadados / Datas
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed