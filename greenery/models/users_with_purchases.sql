with users_with_purchases as (
    select
          user_id
          , case when count(order_id) = 1 then 'one_purchase'
                when count(order_id) = 2 then 'two_purchase'
                when count(order_id) >= 3 then 'three_plus_purchase'
            end as purchase
    from public.orders
    group by 1
)

select 
      purchase
      , count(1) as user_count
from users_with_purchases
-- (
      -- select
      --       user_id
      --       , case when count(order_id) = 1 then 'one_purchase'
      --             when count(order_id) = 2 then 'two_purchase'
      --             when count(order_id) >= 3 then 'three_plus_purchase'
      --         end as purchase
      -- from public.orders
      -- group by 1
-- )
group by 1