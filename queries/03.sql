-- 3. What was the first item from the menu purchased by each customer?
with cte as(
select
s.customer_id, 
s.order_date, 
m.product_name,
rank() over(partition by s.customer_id order by s.order_date) as rnk
from sales s
inner join menu m on s.product_id = m.product_id
)
select 
customer_id, 
order_date, 
product_name
from cte
where rnk = 1
