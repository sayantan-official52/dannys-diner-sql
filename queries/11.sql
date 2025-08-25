-- Bonus Question 1: Join All The Things
select 
s.customer_id,
s.order_date,
m.product_name,
m.price,
case when me.join_date is null then 'N'
when me.join_date > s.order_date then 'N'
else 'Y' end as member
from sales s
left join menu m on s.product_id = m.product_id
left join members me on s.customer_id = me.customer_id
order by s.customer_id, s.order_date, m.price desc
