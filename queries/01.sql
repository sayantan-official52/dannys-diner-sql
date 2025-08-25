-- 1. What is the total amount each customer spent at the restaurant?
select 
s.customer_id,
sum(m.price) as total_spent
from sales s
inner join menu m on s.product_id = m.product_id
group by s.customer_id
