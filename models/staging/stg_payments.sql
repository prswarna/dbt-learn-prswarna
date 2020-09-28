select id as payment_id, 
orderid as order_id, 
paymentmethod as payment_method, 
status as payment_status, 
coalesce((amount/100),0) as amount, --convert to  dollars and zero if null
created as created_at
from raw.stripe.payment