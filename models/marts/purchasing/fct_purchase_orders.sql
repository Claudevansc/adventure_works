with po_header as (
    select * from {{ ref('stg_purchasing_purchaseorderheader') }}
),

po_detail as (
    select * from {{ ref('stg_purchasing_purchaseorderdetail') }}
),

fct_purchase_orders as (
    select
        -- Chave Primária Composta
        concat(cast(d.purchase_order_id as string), '-', cast(d.purchase_order_detail_id as string)) as purchase_order_item_sk,

        -- Chaves Estrangeiras
        d.purchase_order_id,
        d.purchase_order_detail_id,
        h.vendor_id,
        h.ship_method_id,
        d.product_id,

        -- Datas
        h.order_date,
        h.ship_date,
        d.due_date,

        -- Atributos de Status e Processo
        h.status as order_status,
        h.revision_number,

        -- Métricas Quantitativas e Financeiras
        d.order_qty,
        d.unit_price,
        d.received_qty,
        d.rejected_qty,
        (d.order_qty * d.unit_price) as gross_purchase_amount,
        h.subtotal as header_subtotal,
        h.tax_amt as header_tax_amt,
        h.freight as header_freight

    from po_detail d
    left join po_header h
        on d.purchase_order_id = h.purchase_order_id
)

select * from fct_purchase_orders