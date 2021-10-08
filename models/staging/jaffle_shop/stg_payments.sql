SELECT 
id as payment_id,
ORDERID as order_id,
PAYMENTMETHOD as payment_method,
status,
amount/100 as amount,
created as created_at
FROM raw.stripe.payment