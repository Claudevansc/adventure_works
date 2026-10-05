with sales as (
    select * from {{ ref('fct_sales') }}
),

products as (
    select * from {{ ref('dim_production_product') }}
),

customers as (
    select * from {{ ref('dim_sales_customer') }}
),

territories as (
    select * from {{ ref('dim_sales_salesterritory') }}
)

select
    -- Datas
    s.order_date,
    year(s.order_date) as order_year,
    month(s.order_date) as order_month,

    -- Identificadores e Atributos
    s.sales_order_id,
    s.sales_order_detail_id,
    s.order_status,
    s.product_id,
    s.customer_id,

    -- Métricas Quantitativas e Financeiras
    s.order_qty,
    s.unit_price,
    s.gross_revenue_amount,
    s.net_revenue_amount

from sales s
left join products p on s.product_id = p.product_id
left join customers c on s.customer_id = c.customer_id
left join territories t on s.territory_id = t.territory_id