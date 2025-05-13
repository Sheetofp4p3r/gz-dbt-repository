with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
    CAST(purchSE_PRICE AS float) AS purchase_price
    products_id

    from source

)

select * from renamed
