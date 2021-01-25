select * from actor;
select * from film_actor;
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name) as First_pair, concat(a2.first_name, ' ', a2.last_name) as Second_pair
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join actor a2 on a2.actor_id = fa2.actor_id;

select * from inventory;
select * from rental;
select * from customer;
select * from film;
select  in2.film_id, a1.customer_id as First_pair, a2.customer_id as Second_pair , count(*) as number_films
from sakila.customer a1
inner join rental re1 on re1.customer_id = a1.customer_id
inner join inventory in1 on (re1.inventory_id = in1.inventory_id)
inner join film fa1 on in1.film_id=fa1.film_id
inner join inventory in2 on (fa1.film_id = in2.film_id)
inner join rental re2 on re2.inventory_id=in2.inventory_id
inner join customer a2 on re2.customer_id=a2.customer_id
where a1.customer_id <> a2.customer_id
group by a1.customer_id, a2.customer_id
having count(*)>3
order by number_films desc;

select * from actor;

select * from actor;
select * from film_actor;
select fa1.film_id, fa4.film_id, concat(a1.first_name, ' ', a1.last_name) as First_pair, concat(a2.first_name, ' ', a2.last_name) as Second_pair
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id)
inner join actor a2 on a2.actor_id = fa2.actor_id
inner join film_actor fa3 on a2.actor_id=fa3.actor_id
inner join film_actor fa4 on (fa3.film_id=fa4.film_id)
where a1.actor_id <> a2.actor_id and fa1.film_id <> fa4.film_id
group by a1.actor_id, a2.actor_id, fa1.film_id, fa4.film_id;