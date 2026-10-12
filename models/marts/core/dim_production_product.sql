with product as (
    select * from {{ ref('stg_production_product') }}
),

subcategory as (
    select * from {{ ref('stg_production_productsubcategory') }}
),

category as (
    select * from {{ ref('stg_production_productcategory') }}
)

select
    -- Chaves
    p.product_id,
    p.product_subcategory_id,
    sc.product_category_id,
    p.product_model_id,

    -- Detalhes do Produto
    p.product_name,
    p.product_number,
    sc.product_subcategory_name as subcategory_name,
    c.product_category_name as category_name,
    p.color,
    p.size,
    p.size_unit_measure_code,
    p.weight,
    p.weight_unit_measure_code,
    p.product_line,
    p.class,
    p.style,

    -- Atributos de Controlo e Indicadores
    p.make_flag,
    p.finished_goods_flag,
    p.safety_stock_level,
    p.reorder_point,
    p.standard_cost,
    p.list_price,
    p.days_to_manufacture,

    -- Datas
    p.sell_start_date,
    p.sell_end_date,
    p.discontinued_date

from product p
left join subcategory sc on p.product_subcategory_id = sc.product_subcategory_id
left join category c on sc.product_category_id = c.product_category_id