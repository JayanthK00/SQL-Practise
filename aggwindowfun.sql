------------agg win fun----------
select 
o.orderid,
o.orderdate,
o.customerid,
count(*) over() as totalorders,
count(*) over(partition by o.customerid) as groupcustorders
from sales.orders as o

------------------------
select *,
count(*) over() starcount,------includes null--
count(score) over() totalscore,----ignore null--
count(Country) over() as totcountry
from sales.Customers

------------check duplicates or quality---------
select orderid,
count(*) over(partition by orderid) checkdup
from sales.Orders

select 
*
from(select
orderid,
count(*) over(partition by orderid) checkdupprimarykey
from sales.ordersarchive
)t where checkdupprimarykey > 1

--sum()--
select 
sum(sales) over (partition by productid) as totalsalesbyprod
from sales.orders

--percentage contri of each prod sales--
select orderid,
productid,
sales,
sum(sales) over() as totalsales,
cast(sales as float)/sum(sales)  over(partition by productid) *100   as percentcontri
from sales.Orders 

select *,
rank() over(partition by productid order by sales desc) rankoo
from(
select
orderid,
productid,
sales,
sum(sales) over() as totalsales,
round(cast(sales as float)/sum(sales)  over(partition by productid) *100,2 )  as percentcontri
from sales.Orders) as t 

-------AVG------------
select o.ProductID,
o.OrderID,
o.OrderDate,
o.sales,
avg(sales) over () avgsales,
avg(sales) over (partition by productid) avgsales
from sales.Orders as o
--null handling--
select 
CustomerID,
LastName,
score,
avg(coalesce(score,0)) over ()as nullhandscore,
avg(score) over() 
from sales.customers
-------------------------------------

select *
from(select
o.OrderID,
o.ProductID,
o.Sales,
avg(sales) over() avgsales
FROM SALES.ORDERS as o)t
where sales > avgsales

-----------MINMAX-----------

select 
o.OrderID,
o.OrderDate,
o.ProductID,
o.Sales,
max(sales) over() maxo,
max(sales) over(partition by o.productid) as maxfo,
min(sales) over() mino,
min(sales) over(partition by o.productid) as minfo
from sales.orders as o

----filterdata----
select * 

from(
select
*,
max(salary) over () higher
from sales.Employees)t
where salary=higher
------deviation-----
select 
o.OrderID,
o.OrderDate,
o.ProductID,
o.Sales,
max(sales) over() maxo,
min(sales) over() mino,
sales-min(sales) over() devaitionfromin,
max(sales) over()-sales devationfrommax
from sales.orders as o


------------running avg or moving avg---
select 
o.OrderID,
o.ProductID,
o.OrderDate,
o.Sales,
avg(sales) over(partition by productid)  avgprod,
avg(sales) over(partition by productid order by orderdate)  movavg
from sales.orders as o


----include next order--
select 
o.OrderID,
o.ProductID,
o.OrderDate,
o.Sales,
avg(sales) over(partition by productid)  avgprod,
avg(sales) over(partition by productid order by orderdate
rows between current row and 1 following)  movavg
from sales.orders as o













