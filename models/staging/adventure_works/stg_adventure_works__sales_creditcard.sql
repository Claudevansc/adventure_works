with source as (

    select * from {{ source('adventure_works', 'sales_creditcard') }}

),

renamed as (

    select
        -- Chaves (IDs)
        cast(creditcardid as int) as credit_card_id,

        -- Informações do Cartão
        cast(cardtype as string) as card_type,
        cast(cardnumber as string) as card_number,
        cast(expmonth as int) as expiration_month,
        cast(expyear as int) as expiration_year,

        -- Metadados / Datas
        cast(modifieddate as timestamp) as updated_at

    from source

)

select * from renamed