with order_header as (
    select
        salesorderid as sales_order_id,
        customerid as customer_id,
        salespersonid as sales_person_id,
        territoryid as territory_id,
        creditcardid as credit_card_id,
        billtoaddressid as bill_to_address_id,
        orderdate as order_date,
        duedate as due_date,
        shipdate as ship_date,
        status as order_status,
        onlineorderflag as online_order_flag
    from {{ source('adventure_works', 'sales_salesorderheader') }}
),

order_detail as (
    select * from {{ ref('stg_sales_salesorderdetail') }}
),

fct_sales as (
    select
        -- Chave primária composta da Fato
        concat(cast(d.sales_order_id as string), '-', cast(d.sales_order_detail_id as string)) as sales_order_item_sk,
        
        -- Chaves Estrangeiras
        d.sales_order_id,
        d.sales_order_detail_id,
        h.customer_id,
        d.product_id,
        h.sales_person_id,
        h.territory_id,
        h.credit_card_id,
        h.bill_to_address_id,
        
        -- Datas
        h.order_date,
        h.due_date,
        h.ship_date,
        
        -- Atributos de Estado / Operação
        h.order_status,
        h.online_order_flag,
        
        -- Métricas Quantitativas
        d.order_qty,
        d.unit_price,
        d.unit_price_discount,
        (d.order_qty * d.unit_price) as gross_revenue_amount,
        (d.order_qty * d.unit_price * (1 - d.unit_price_discount)) as net_revenue_amount
        
    from order_detail d
    left join order_header h 
        on d.sales_order_id = h.sales_order_id
)

select * from fct_sales