use sakila;
select * from actor;
select first_name, last_name from actor;

select * from film;

 select title as filename, rating, replacement_cost
from film
where rating = 'PG-13' or rating = 'PG' And replacement_cost >10;
select * from film;
select title as moviename, rental_rate
from film
where rental_rate >1;

SELECT title FROM film Where title LIKE 'B%B';

select title, length as length from film order by length desc limit 10;

use sakila;
create view customer_details as 
select customer_id, first_name, last_name, email from sakila.customer
group by customer_id;
select * from customer_details;

