---------------ANALYTICAL FUNCTIONS----------
select 
o.productid,
sum(sales) as totalsales
from Sales.Orders as o
group by ProductID
order by productid desc

------with orderid,orderdate-----------

---------OVER()-------
Select 
sum(sales ) over() totalsales
from sales.orders as o
-------------------over(partition by)---------
Select 
o.productid,
o.orderid,
o.orderdate,
sum(sales ) over(partition by o.productid) totalsalesbyproductid
from sales.orders as o
order by totalsalesbyproductid asc

-----------------------------------------
select 
o.OrderID,
o.OrderDate,
sum(o.sales) over() as totalsales
from sales.Orders as o
---------------------------------------each product--
select 
o.OrderID,
o.OrderDate,
o.productid,
o.sales,
sum(o.sales) over() as totalsales,
sum(o.sales) over(partition by o.productid) as totalsalesbypart
from sales.Orders as o

----------total sales for each combination of product and order status--
select 
o.OrderID,
o.OrderDate,
o.productid,
o.sales,
o.orderstatus,
sum(o.sales) over() as totalsales,
sum(o.sales) over(partition by o.productid) as totalsalesbypart,
sum(o.sales) over (partition by o.productid,orderstatus) prodstatus --combination of windows and its sum of each window in each row--
from sales.Orders as o

--rank each order based on sales from high to low--
select 
o.OrderID,
o.OrderDate,
o.sales,
rank() over(order by o.sales asc) as ranksalesasc,
rank() over(order by o.sales desc) as ranksalesdesc
from sales.Orders as o 

---------------WINDOW FROMES()-----------------

