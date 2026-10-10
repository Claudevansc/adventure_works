-- Teste singular: Verifica se existem cartões de crédito com ano de expiração inválido (ex: anterior a 2020)
select 
    credit_card_id,
    expiration_year,
    card_type
from {{ ref('stg_adventure_works__sales_creditcard') }}
where expiration_year < 2020