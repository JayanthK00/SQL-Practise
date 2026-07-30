---from subquery--
select *
from(
select
p.productid,
p.price,
avg(price) over() avgprice
from sales.Products as p)t
where price>avgprice

----------------------------
select *,
rank() over(order by totalsales desc) ranking
from(
select 
o.CustomerID,
sum(sales)  as totalsales
from sales.orders as o
group by customerid)t

------subquery in select-----
select 
p.ProductID,
p.Product,
p.Price,
(select count(*) from sales.orders) as totalorders 
from sales.Products as p

-------------------------------------------------
--join subquery--
select *
from sales.Customers as c
left join(
select 
o.customerid,
count(o.sales) as totalsales
from sales.orders as o
group by customerid) t
on c.CustomerID=t.customerid

-------------------------------------------------
--where subquery-----
select * 
from sales.Products
where price > (select avg(price) as avgprice from sales.Products)

--------------------
--where in subquery--
select *
from sales.orders as o
where o.customerid in
(select c.CustomerID from sales.Customers as c where c.Country='germany')

----------------------------------------------------
--find female emp whose sal > male emp (IF ANY IN WHERE CLAUSE)
select * from sales.Employees
where gender='f' and salary > ANY
(select salary from sales.Employees where gender='m')

select * from sales.Employees
where gender='f' and salary > ALL
(select salary from sales.Employees where gender='m')

-------------------------------------------------
---------CORRELATED SUBQUERY-------------------
select *, 
(select 
count(orderid) as totalorders
from sales.orders as o
where o.CustomerID=c.CustomerID)
from sales.Customers as c

-----------------------------------------------------------
---------CORRELATED SUBQUERY IN WHEERE CLAUSE OF EXISTS OPERATOR---
select * from sales.Orders as o where exists(
select* from sales.Customers as c where country='germany'
and o.CustomerID=c.CustomerID)












































