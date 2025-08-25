-- Bonus Question 2: Rank All The Things
with cte as(
select s.customer_id,
s.order_date,
m.product_name,
m.price,
case when me.join_date is null then 'N'
when me.join_date > s.order_date then 'N'
else 'Y' end as member
from sales s
left join menu m on s.product_id = m.product_id
left join members me on s.customer_id = me.customer_id)
select *,
case when member = 'N' then Null
else rank() over(partition by customer_id, member order by order_date) end as ranking
from cte
order by customer_id, order_date, price desc
