SELECT category.category_id, category.name, count(film_id) as Movies_by_category
FROM category
INNER JOIN film_category ON category.category_id=film_category.category_id
group by category_id;
select * from staff;
select * from address;
SELECT staff_id, staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON staff.address_id=address.address_id
where staff_id = 1 or staff_id = (select count(staff_id) from staff);
select * from staff;
select * from payment;
SELECT staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount), payment.payment_date
FROM staff
INNER JOIN payment ON staff.staff_id=payment.staff_id
where year(payment_date) = '2005' and month(payment_date) = '8'
group by staff_id;
select * from actor;
select * from film_actor;
select * from film;
select film.title, count(actor.actor_id) as Casting_team from film
inner join film_actor on film.film_id=film_actor.film_id
inner join actor on film_actor.actor_id=actor.actor_id
group by film.title;
select * from customer;
select * from payment;
select customer.last_name, customer.first_name, sum(payment.amount) as Total_amount
from customer
INNER JOIN payment ON customer.customer_id=payment.customer_id
group by last_name;