-------------inner join----------------
select *
from customers inner join orders
on customers.id=orders.customer_id

select * from customers;
select * from orders;

select customers.id,first_name,country,score,order_id
from customers inner join orders
on orders.customer_id=customers.id

------------------left join---------------------
select * 
from customers as c
left join orders as o
on c.id=o.customer_id
---------------------------------------------------
select c.id,c.first_name,o.order_id,o.order_date
from customers as c
left join orders as o
on c.id=o.customer_id
------------------------right join-------------------
select c.id,c.first_name,o.order_id,o.order_date
from orders as o
right join customers as c
on c.id=o.customer_id
-------------------------------------------------------
select *
from orders as o
right join customers as c
on o.customer_id=c.id

---------------------------full join------------------------
select * 
from customers as c
full join orders as o
on c.id=o.customer_id
----------------------------inner join-------------------------
select * 
from customers as c
inner join orders as o
on c.id=o.customer_id