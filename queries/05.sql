-- 5. Which item was the most popular for each customer?
with cte as(
select
s.customer_id, 
m.product_name,
rank() over(partition by s.customer_id order by count(s.order_date) desc) as rnk
from sales s
inner join menu m on s.product_id = m.product_id
group by s.customer_id, m.product_name
)
select 
customer_id,
product_name
from cte
where rnk = 1
