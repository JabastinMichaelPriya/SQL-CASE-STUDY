# SQL-SAKILA-MOVIE-RENTAL-STORE-DATA
The Motion Picture Association (MPA) is a movie rating system that rates the suitability of motion pictures for audiences based on its content. The United States and its territories also use MPA to rate motion pictures. The system and the ratings applied to individual motion pictures are the responsibility of MPA

Sakila is a movie rental store with a vast collection of movies in DVDs and blue ray disc formats. The management wants to analyze the data to understand what kind of movies and actors are often rented. This analysis would help them stock the inventory of movies to improve their business This analysis involves a set of tasks to begin with. As an analyst, you are expected to answer the questions put forth by the management.

# Task 1
The Sakila rental store management wants to know the names of all the actors in their movie collection. Display the first names, last names, actor IDs, and the details of the last updated column.
**select first_name, last_name, actor_id, last_update from actor;**

# Task 2
Many actore have adopted attractive screen names, mostly at the behest of producers and directors. The management wants to know the following:

a. Display the full names of all actors.
# select concat(first_name,'', last_name) as full_name from actor;

b. Display the first names of actors along with the count of repeated first names.
# select first_name, count(*) as name_count from actor group by first_name;

c. Display the last name of actors along with the count of repeated last names.
# select last_name, count(*) as name_count from actor group by last_name;

# Task 3
Display the count of movies grouped by the ratings
# select rating, count(*) as movie_count from film group by rating;

# Task 4
Calculate and display the average rental rates based on the movie ratings.
# select rating, avg(rental_rate) as average_rental_rate from film group by rating;

# Task 5
The management wants the data about replacement cost of movies. Replacement cost in the amount of money required to replace an existing asset (DVD/blue ray disc) with an equally valued or similar asset at the current market price.

a. Display the movie titles where the replacement cost is up to $9
USING SUBQUERY
# select title from film where film_id in (select film_id from film where replacement_cost <=9);

USING QUERY
# select title from film where replacement_cost <=9;

b. Display the movie titles where the replacement cost is between $15 and $20.
# select title from film where replacement_cost between 15 and 20;

c. Display the movie titles with the highest replacement cost and the lowest rental cost
# select title from film where replacement_cost = (select max(replacement_cost) from film) and rental_rate = ( select min(rental_rate) from film);

# Task 6
The management needs. to know the list all the movies along with the number of actors lated for each movie.
# select film.title, count(actor.actor_id) as actor_count from film join film_actor on film.film_id = film_actor.film_id join actor on film_actor.actor_id = actor.actor_id group by film.film_id;

# Task 7
The Music of Queen and Kris Kristofferson has seen an unlikely resurgence. As an unintended consequence, movies starting with the letters 'K' and 'Q' have also soared in popularity. Display the movie titles starting with the letters "K" and "Q"
# select title from film where title like 'K%' or title like 'Q%' order by title;

# Task 8
The movie 'AGENT TRUMAN' has been a great been a great success. Display the first names and last names of all actors who are a part of this movie.
# select actor.first_name, actor.last_name from actor join film_actor on actor.actor_id = film_actor.actor_id join film on film_actor.film_id = film.film_id where film.title = 'AGENT TRUMAN';

# Task 9
Sales has been down among the family audience with kids. The management wants to promote the movies that fall under the "chldren category. Identify and display the names of the movies in the family category.
# select title from film join film_category on film_category.film_id = film.film_id join category on category.category_id = film_category.category_id where category.name = 'family';

# Task 10
Display the names of the most frequently rented movies in descending order, so that the management can maintain copies of such movies.
# select film.title, count(*) as rental_count from film join inventory on inventory.film_id = film.film_id join rental on rental.inventory_id = inventory.inventory_id group by film.film_id order by rental_count desc;

# Task 11
Calculate and display the number of movie categories where the average difference between the movie replacement cost and the rental rate is greater than $15.
# select count(*) as category_count from ( select category.category_id from category join film_category on category.category_id = film_category.category_id join film on film_category.film_id = film.film_id group by category.category_id having avg (film.replacement_cost - film.rental_rate) > 15) as category_count;

# Task 12
The management wants to identify all the genres that consist of 60-70 movies. The genre details are captured in the category column. Display the names of these categories/genres and the number of movies per category/genre, sorted by the number of movies.
# select category.name, count(*) as movie_count from category join film_category on film_category.category_id = category.category_id group by category.category_id having movie_count between 60 and 70 order by movie_count;
 
