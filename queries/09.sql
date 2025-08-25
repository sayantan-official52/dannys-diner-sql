-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select 
s.customer_id,
sum(case when m.product_name = 'sushi' then (m.price * 10) * 2
else (m.price * 10)
end) as points
from sales s
inner join menu m on m.product_id = s.product_id
group by s.customer_id
