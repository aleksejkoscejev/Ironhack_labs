select * from store;
select * from country;
select * from city;
select * from address;
select store.store_id, city.city, country.country
from store
left join address on store.address_id=address.address_id
left join city on address.city_id=city.city_id
left join country on city.country_id=country.country_id;
select * from store;
select * from customer;
select * from payment;
select store.store_id, sum(payment.amount)
from store
left join customer on store.store_id=customer.store_id
left join payment on customer.customer_id=payment.customer_id
group by store_id;
select * from film;
select * from film_category;
select * from category;
select category.name as Genre, avg(film.length) as Average_duration
from film
inner join film_category on film.film_id=film_category.film_id
inner join category on film_category.category_id=category.category_id
group by Genre
order by Average_duration desc;
select * from film;
select * from inventory;
select * from rental;
select film.title, count(rental.inventory_id) as Rent_frequency
from film
inner join inventory on film.film_id=inventory.film_id
inner join rental on inventory.inventory_id=rental.inventory_id
group by film.title
order by Rent_frequency desc;
select * from category;
select * from film_category;
select * from inventory;
select * from rental;
select * from payment;
select category.name as Genre, sum(payment.amount) as Gross_revenue
from category
inner join film_category on category.category_id=film_category.category_id
inner join inventory on film_category.film_id=inventory.film_id
inner join rental on inventory.inventory_id=rental.inventory_id
inner join payment on rental.rental_id=payment.rental_id
group by Genre
order by Gross_revenue desc;
select * from film;
select * from inventory;
select * from store;
select film.title, count(film.film_id) as Yes
from film
inner join inventory on film.film_id=inventory.film_id
inner join store on inventory.store_id=store.store_id
where film.title = 'Academy Dinosaur' and store.store_id=1;