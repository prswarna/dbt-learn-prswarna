with orders as (

    select * from {{ref('stg_orders')}}

),

payments as (
    select * from {{ref('stg_payments')}}
),

order_payments as (

    select
        order_id,
        sum(case when payment_status='success' then amount end) as amount
    from payments
    group by 1

),

final as (
    select
        orders.customer_id,
        orders.order_id,
        orders.order_date,
        orders.order_status,
        order_payments.amount
    from orders
    left join order_payments using (order_id)
)

select * from final