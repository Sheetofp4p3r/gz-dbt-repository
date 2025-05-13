with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
    orders_id, 
    shipping_fee,  
    logCost, 
    cast(ship_cost AS float)

    from source
    where 
)

select * from renamed
