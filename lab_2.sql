select actor_id
from actor
where actor_id=58;
select title from film where title LIKE 'P%';
select title from film  where release_year=2006;
select* from actor where first_name not LIKE 'T%';
select first_name ,last_name from actor
where(actor_id between 50 AND 150)
OR(last_name like 'A%');