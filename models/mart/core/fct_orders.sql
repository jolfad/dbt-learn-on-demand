SELECT 
a.order_id,
a.customer_id,
b.amount
FROM
analytics.dbt_jfadare.stg_orders a 
LEFT JOIN
(SELECT 
orderid, 
status,
sum(amount) AS amount 
FROM analytics.dbt_jfadare.stg_payments
GROUP BY 1,2) b
ON a.order_id=b.ORDERID
AND b.status='success'