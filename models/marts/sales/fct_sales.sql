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

-- 1. Dados de Cartão de Crédito (Tipo de Cartão)
credit_card as (
    select
        creditcardid as credit_card_id,
        cardtype as card_type
    from {{ source('adventure_works', 'sales_creditcard') }}
),

-- 2. Endereço, Estado e País (Cidade, Estado, País)
address as (
    select
        addressid as address_id,
        city,
        stateprovinceid as state_province_id
    from {{ source('adventure_works', 'person_address') }}
),

state_province as (
    select
        stateprovinceid as state_province_id,
        name as state_name,
        countryregioncode as country_region_code
    from {{ source('adventure_works', 'person_stateprovince') }}
),

country_region as (
    select
        countryregioncode as country_region_code,
        name as country_name
    from {{ source('adventure_works', 'person_countryregion') }}
),

-- 3. Motivo de Venda (Bridge + Reason)
sales_reason_bridge as (
    select
        salesorderid as sales_order_id,
        salesreasonid as sales_reason_id
    from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
),

sales_reason as (
    select
        salesreasonid as sales_reason_id,
        name as sales_reason_name
    from {{ source('adventure_works', 'sales_salesreason') }}
),

-- Consolidação dos Motivos de Venda por Pedido (evita duplicar linhas na Fato se houver mais de 1 motivo)
order_sales_reasons as (
    select
        b.sales_order_id,
        string_agg(r.sales_reason_name, ', ') as sales_reasons
    from sales_reason_bridge b
    inner join sales_reason r on b.sales_reason_id = r.sales_reason_id
    group by b.sales_order_id
),

fct_sales as (
    select
        -- Chave primária composta da Fato
        concat(cast(d.sales_order_id as string), '-', cast(d.sales_order_detail_id as string)) as sales_order_item_sk,
        
        -- Chaves Estrangeiras / IDs
        d.sales_order_id,
        d.sales_order_detail_id,
        h.customer_id,
        d.product_id,
        h.sales_person_id,
        h.territory_id,
        h.credit_card_id,
        h.bill_to_address_id,
        
        -- Datas e Status
        h.order_date,
        h.due_date,
        h.ship_date,
        h.order_status,
        h.online_order_flag,

        -- Atributos Descritivos Solicitados
        cc.card_type,
        a.city as bill_to_city,
        sp.state_name as bill_to_state,
        cr.country_name as bill_to_country,
        coalesce(sr.sales_reasons, 'Not Specified') as sales_reason,
        
        -- Métricas Quantitativas (Quantidade e Valor Negociado)
        d.order_qty,
        d.unit_price,
        d.unit_price_discount,
        (d.order_qty * d.unit_price) as gross_revenue_amount,
        (d.order_qty * d.unit_price * (1 - d.unit_price_discount)) as net_revenue_amount
        
    from order_detail d
    left join order_header h 
        on d.sales_order_id = h.sales_order_id
    left join credit_card cc
        on h.credit_card_id = cc.credit_card_id
    left join address a
        on h.bill_to_address_id = a.address_id
    left join state_province sp
        on a.state_province_id = sp.state_province_id
    left join country_region cr
        on sp.country_region_code = cr.country_region_code
    left join order_sales_reasons sr
        on h.sales_order_id = sr.sales_order_id
)

select * from fct_sales