-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select
m.product_name, 
count(s.order_date) as number_of_times_purchased
from sales s
inner join menu m on s.product_id = m.product_id
group by m.product_name
order by number_of_times_purchased desc
limit 1
