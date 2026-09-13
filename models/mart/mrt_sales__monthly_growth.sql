with monthly_store_revenue as (

    select
        date_trunc(order_date, month) as order_month,
        store_id,
        store_name,
        round(sum(net_amount), 2) as total_revenue
    from {{ ref('int_sales__order_items_enriched') }}
    group by order_month, store_id, store_name

)

select
    order_month,
    store_id,
    store_name,
    total_revenue,
    lag(total_revenue) over (
        partition by store_id order by order_month
    ) as previous_month_revenue,
    case
        -- exclude growth calculation when the comparison base is too low
        -- to produce a meaningful percentage (data anomaly, not a real trend)
        when lag(total_revenue) over (partition by store_id order by order_month) < 5000
            then null
        else round(
            safe_divide(
                total_revenue - lag(total_revenue) over (partition by store_id order by order_month),
                lag(total_revenue) over (partition by store_id order by order_month)
            ) * 100, 1
        )
    end as revenue_growth_pct
from monthly_store_revenue
order by store_name, order_month