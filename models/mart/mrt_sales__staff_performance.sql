with staff_orders as (

    select
        o.staff_id,
        o.store_id,
        count(distinct o.order_id) as total_orders,
        sum(oi.net_amount) as total_revenue
    from {{ ref('stg_sales__orders') }} as o
    left join {{ ref('stg_sales__order_items') }} as oi on oi.order_id = o.order_id
    group by o.staff_id, o.store_id

)

select
    so.staff_id,
    concat('Employé ', so.staff_id) as staff_name,
    so.store_id,
    st.store_name,
    so.total_orders,
    round(so.total_revenue, 2) as total_revenue
from staff_orders as so
left join {{ ref('stg_sales__staffs') }} as s on s.staff_id = so.staff_id
left join {{ ref('stg_sales__stores') }} as st on st.store_id = so.store_id
order by so.total_orders desc