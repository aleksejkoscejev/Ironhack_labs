drop table if exists sakila.films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
show variables like 'local_infile';
set global local_infile = 1;
SET GLOBAL local_infile = 'ON';
SHOW VARIABLES LIKE "local_infile";
SHOW VARIABLES LIKE "secure_file_priv";
load data local infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/films_2020.csv'
into table films_2020
fields terminated by ',' ENCLOSED BY '"' IGNORE 1 ROWS;
update films_2020
set
rental_rate = '2.99',
replacement_cost = '8.99',
rental_duration = '3'
where original_language_id IS NULL;
select * from films_2020 order by film_id desc;
select * from actor limit 10;
select last_name, count(last_name) unique_last_name from actor
group by last_name having unique_last_name = 1;
select last_name, count(last_name) unique_last_name from actor
group by last_name having unique_last_name > 1;
select staff_id, count(staff_id) rentals_processed from rental
group by staff_id;
select release_year, count(release_year) films_produced from film
group by release_year;
select rating, count(rating) rating_count from film
group by rating;
select rating, round(avg(length),2) as average_length from film
group by rating;
select rating, round(avg(length),2) as average_length from film
where length > 120
group by rating;
select * from sakila.film;