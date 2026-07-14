select * from customers;
select * from orders;
-----------------------left join---------------
select *
from customers as c
left join orders as o
on c.id=o.customer_id
------------------------left antijoin-----------------
select *
from customers as c
left join orders as o
on c.id=o.customer_id
where o.customer_id is null  ---unmatching rows of a not with b is antijoin----------------


-------------------------right join-----------------------------------
select *
from orders as o
left join customers as c
on c.id=o.customer_id

select * 
from customers as c
right join orders as o
on c.id=o.customer_id

----------------------------------------rigth anti join----------------------
select *
from orders as o
left join customers as c
on c.id=o.customer_id
where c.id is null
-----------------------------------------------------------------------
select * 
from customers as c
right join orders as o
on c.id=o.customer_id
where c.id is null
-------------------------------full join-------------------------------
select * 
from customers as c
full join orders as o
on c.id=o.customer_id---------------anti join-----------------
where c.id is null or customer_id is null


------------------------------------------------------------not exists----------
select * 
from customers as c
where not exists
(	select *
from orders as o
where c.id=o.customer_id);

select * 
from orders as o
where not exists
(	select *
from customers as c
where c.id=o.customer_id);

----------------------------------------------------------------------
------------CHALLENGES----------------------------------

SELECT * 
FROM customers as c
left join orders as o
on c.id =o.customer_id
where o.customer_id is not null --------------get all customerrs along with orders only who placed an order------------

------------------------------------------------------------------------
---------------------------cross joint-----------------------------
select *
from customers
cross join orders