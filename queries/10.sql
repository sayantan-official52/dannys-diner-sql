-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
select s.customer_id,
sum(case when s.order_date between  m.join_date and date_add(m.join_date, interval 6 day) then men.price*10*2
when s.order_date > date_add(m.join_date, interval 6 day) and men.product_name ='sushi' then men.price*10*2 
else men.price*10 end) as pts
from sales s
inner join members m on s.customer_id = m.customer_id
inner join menu men on s.product_id = men.product_id
where month(s.order_date) = 1
group by s.customer_id
order by s.customer_id
