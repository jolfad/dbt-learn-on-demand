SELECT 
a.order_id,
a.customer_id,
b.amount,
a.order_date
FROM
{{ ref('stg_orders')}} a 
LEFT JOIN
(SELECT 
order_id, 
status,
sum(amount) AS amount 
FROM {{ ref('stg_payments')}}
GROUP BY 1,2) b
ON a.order_id=b.order_id
AND b.status='success'