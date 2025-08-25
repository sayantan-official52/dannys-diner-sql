-- 6. Which item was purchased first by the customer after they became a member?
with cte as(
select 
s.customer_id,
s.order_date,
m.join_date,
men.product_name,
rank() over(partition by s.customer_id order by s.order_date) as rnk
from sales s
inner join members m on s.customer_id = m.customer_id
inner join menu men on s.product_id = men.product_id
where s.order_date >= m.join_date
)
select 
customer_id,
join_date,
order_date,
product_name
from cte
where rnk = 1
