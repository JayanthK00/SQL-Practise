--- this is a comment
/* this 
is 
a comment
*/
USE MyDatabase
---retrieve all customer data---
SELECT * FROM customers
---retrieve all order data---
select * from orders
----select few columns-----
select
first_name,
country,
score
from customers


-----retrieve customers score not equal to 0---
select * from customers
where score!=0


---retrieve customers from germany---
select * from customers
where country = 'germany'

-------------
select 
first_name,
country
from customers where country = 'germany'

------retrieve all custmers and sort the results by the highest score first----
select * from customers 
ORDER BY score DESC

--------
select * from customers 
ORDER BY score ASC

--------SORT BY COUNTRY THEN BY HIGHEST SCORE----
SELECT * FROM customers
ORDER BY country ASC,score DESC

-----------TOTAL SCORE OF EACH COUNTRY-----GROUP BY
SELECT country AS CUSTOMER_COUNTRY,
	SUM(score) AS TOTAL_SCORE
FROM customers
GROUP BY country

--------group by exampmple---
select country,
	count(*) as totalcountries,
	avg(score) as avgscore,
	max(score) as maxscore
from customers
where score > 0
group by country
  
  --------------------------
  select country as groupcontry,
	count(*) as totalmembers,
	avg(score) as avgscore,
	max(score),
	sum(score) as total
from customers
group by country
having count(*)>1
order by count(*) desc,avgscore desc,total asc


--------
select country,
	sum(score) as totalscore,
	count(id) as totalmemb
from customers
group by country
order by totalmemb desc

------------------------------------
select distinct country,
	avg(score) as avg
from customers
where score>0
group by country
having avg(score)>430

------------------------
select top 3 *
from customers
where score>0
order by score asc 
------------------

select top 3 *
from orders
order by order_date desc