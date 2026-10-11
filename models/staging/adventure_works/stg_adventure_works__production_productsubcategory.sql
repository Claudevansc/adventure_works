with source as (

    select * from {{ source('adventure_works', 'production_productsubcategory') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(productsubcategoryid as int) as product_subcategory_id,
        cast(productcategoryid as int) as product_category_id,

        -- Informações da Subcategoria
        cast(name as string) as product_subcategory_name,

        -- Metadados / Datas
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed