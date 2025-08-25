-- 8. What is the total items and amount spent for each member before they became a member?
select 
s.customer_id,
count(s.product_id) as total_items,
sum(men.price) as amt
from sales s
inner join members m on m.customer_id = s.customer_id
inner join menu men on men.product_id = s.product_id
where s.order_date < m.join_date
group by s.customer_id
order by s.customer_id
