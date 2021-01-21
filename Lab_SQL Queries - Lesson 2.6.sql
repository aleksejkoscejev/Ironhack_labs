#1
select release_year from sakila.film
limit 10;
#2
select * from sakila.film
where title like '%armageddon%'
limit 10;
#3
select * from sakila.film
where title like '%apollo'
limit 10;
#4
select * from sakila.film
order by length desc
limit 10;
#5
select * from sakila.film
where special_features like '%behind the scene%'
limit 10;
#6
alter table sakila.staff
drop column picture;
select * from sakila.staff;
#7
INSERT INTO sakila.staff (staff_id,first_name,last_name, address_id, email, store_id, active, username, password, last_update)
VALUES ('3', 'Tammy', 'Ssanders', '5', '' ,'1', '1', 'Tammy', '', '2021-01-20 18:07:25');
select * from sakila.staff;
#8
INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES  ('16050', '2021-01-21 09:39:25', '4582', '130', return_date, '1', '2021-01-21 09:39:25')
select * from sakila.rental;
#9
CREATE TABLE sakila.customer_inactive LIKE sakila.customer;
INSERT INTO sakila.customer_inactive SELECT * FROM sakila.customer
WHERE active = "0";
delete from sakila.customer
WHERE active = 0; 

DDL - data definition language
DML - data manipulation language
TCL
DLC 
