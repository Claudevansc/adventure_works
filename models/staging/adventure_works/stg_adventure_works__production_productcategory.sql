with source as (

    select * from {{ source('adventure_works', 'production_productcategory') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(productcategoryid as int) as product_category_id,

        -- Informações da Categoria
        cast(name as string) as product_category_name,

        -- Metadados / Datas
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed