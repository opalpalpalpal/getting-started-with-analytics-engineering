with order_counts_in_each_hour as (
      select
            date_trunc('hour',created_at)
            , count(order_id) as order_count
      -- from public.orders
      -- from {{ source('greenery','orders')}}
      from {{ ref('stg_greenery__orders') }}
      group by 1
)

select avg(order_count)
-- from (
--       select
--             date_trunc('hour',created_at)
--             , count(order_id) as order_count
--       from public.orders
--       group by 1
-- )
from order_counts_in_each_hour