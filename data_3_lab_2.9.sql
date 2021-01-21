drop table if exists sakila.rental_may;
CREATE TABLE sakila.rental_may LIKE sakila.rental;
INSERT INTO sakila.rental_may SELECT * FROM sakila.rental
where rental_date like '%-05-%';
select * from rental_may;
drop table if exists sakila.rental_june;
CREATE TABLE sakila.rental_june LIKE sakila.rental;
INSERT INTO sakila.rental_june SELECT * FROM sakila.rental
where rental_date like '%-06-%';
select * from rental_june;

select * from rental
where rental_date like '%-06-%';

select count(rental_date) from rental_may;
select count(rental_date) from rental_june;