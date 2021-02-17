#1
select first_name, last_name, email 
from customer c
join rental r on c.customer_id=r.customer_id
group by email;
#2
select p.customer_id, concat(c.first_name, ' ',c.last_name) as Customer_name, avg(p.amount) as average_payment
from payment p
join customer c on p.customer_id=c.customer_id
group by customer_id; 
#3
select concat(c.first_name,' ',c.last_name) as Customer_name, c.email
from customer c
join rental r on c.customer_id=r.customer_id
join inventory i on r.inventory_id=i.inventory_id 
join film f on i.film_id=f.film_id
join film_category fc on f.film_id=fc.film_id
join category ca on fc.category_id=ca.category_id
where ca.name="Action"
group by email;
#4
select *,
case
	when amount<=2 then 'Low'
    when amount>2 and amount <=4 then 'Medium'
    else 'High'
end as Transanctions_classification
from payment;