#1 inner join
select film.title, inventory.film_id, count(inventory.inventory_id)
from film
inner join inventory on film.film_id=inventory.film_id
where film.title='Hunchback Impossible';
#sub-query
select film_id, count(inventory.inventory_id) as inventory_count
from sakila.inventory
where film_id = (
select film_id
from sakila.film
where film.title='Hunchback Impossible');
#2 sub-query
select film.title, avg(film.length) as Average
from film
group by film.title
having Average>(select avg(film.length) from film);
#3
select ac1.first_name, ac1.last_name, fi1.title
from actor ac1
inner join film_actor fa1 on ac1.actor_id=fa1.actor_id
inner join film fi1 on fa1.film_id=fi1.film_id
where fi1.title='Alone Trip';
#subquery
select ac1.first_name, ac1.last_name
from actor ac1
where actor_id = 
(select actor_id
from film_actor
where actor_id = 
(select film_id
from film
where title='Alone Trip')group by actor_id);
#4 inner join
select fi1.title, ca1.name
from film fi1
inner join film_category fc1 on fi1.film_id=fc1.film_id
inner join category ca1 on fc1.category_id=ca1.category_id
where ca1.name = 'Family';
#subquery
select title, film_id
from film
where film_id in 
(select film_id
from film_category
where category_id = 
(select category_id
from category
where name='Family' group by category_id));
#5 inner join
select concat(cu1.first_name,' ', cu1.last_name), cu1.email
from customer cu1
inner join address ad1 on cu1.address_id=ad1.address_id
inner join city ci1 on ad1.city_id=ci1.city_id
inner join country co1 on ci1.country_id=co1.country_id
where co1.country='Canada';
#6 inner join
select * from actor;
select * from film_actor;
select * from film;
select actor_id, count(film_id) as count from film_actor
group by actor_id
order by count desc;
select fi1.title 
from film fi1
inner join film_actor fa1 on fi1.film_id=fa1.film_id
inner join actor ac1 on fa1.actor_id=ac1.actor_id
where ac1.actor_id='107';
#sub-query
select title
from film
where film_id in (select film_id from film_actor
where actor_id in(select actor_id
from (select actor_id, count(film_id) as count from film_actor
group by actor_id
order by count desc limit 1)sub1));
#7 sub-querry
select title from film
where film_id in(
select film_id from inventory
where inventory_id in(
select inventory_id
from rental
where customer_id in(
select customer_id from(
select customer_id, sum(amount) as amount
from payment
group by customer_id
order by amount desc
limit 1)sub1)group by film_id));
#8 sub-querie
select * from payment;
select * from customer;
select concat(first_name,' ',last_name) as Name_Surname
from customer
where customer_id in(
select customer_id from payment
where amount >(
select avg(amount) as amount from payment)group by customer_id);