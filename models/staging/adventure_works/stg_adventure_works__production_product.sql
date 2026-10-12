with source as (

    select * from {{ source('adventure_works', 'production_product') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(productid as int) as product_id,
        cast(productsubcategoryid as int) as product_subcategory_id,
        cast(productmodelid as int) as product_model_id,

        -- Informações do Produto
        cast(name as string) as product_name,
        cast(productnumber as string) as product_number,
        cast(color as string) as color,
        cast(size as string) as size,
        cast(sizeunitmeasurecode as string) as size_unit_measure_code,
        cast(weightunitmeasurecode as string) as weight_unit_measure_code,
        cast(weight as numeric) as weight,
        cast(productline as string) as product_line,
        cast(class as string) as class,
        cast(style as string) as style,

        -- Indicadores (Flags Booleanas)
        cast(makeflag as boolean) as is_manufactured,
        cast(finishedgoodsflag as boolean) as is_finished_good,

        -- Controlo de Inventário
        cast(safetystocklevel as int) as safety_stock_level,
        cast(reorderpoint as int) as reorder_point,
        cast(daystomanufacture as int) as days_to_manufacture,

        -- Preços e Custos
        cast(standardcost as numeric) as standard_cost,
        cast(listprice as numeric) as list_price,

        -- Datas / Metadados
        cast(sellstartdate as timestamp) as sell_start_date,
        cast(sellenddate as timestamp) as sell_end_date,
        cast(discontinueddate as timestamp) as discontinued_date,
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed