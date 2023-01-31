with source as (

                select * from {{ source('greenery','products') }}

)

, final as (
                select 
                        product_id
                        , name 
                        , price
                        , inventory
                from source

)

select * from final