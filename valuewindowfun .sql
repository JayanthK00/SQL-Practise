--mom perforrmance by finding percentage change--
--in sales btw the curr and prev month--
select *,
(totalcurrsales-prevmonth) as mom_change,
round(cast((totalcurrsales-prevmonth) as float)/prevmonth*100,1) as mom_changepercent
from(
select 
month(orderdate) ordermonth,
sum(o.sales) as totalcurrsales,
lag(sum(sales)) over(order by month(orderdate)) as prevmonth
from sales.Orders as o
group by month(orderdate))t


----------CUSTOMER RENTENTION ANALYSIS-------------
select 
customerid,
avg(diffbtworder) avgdays,
rank() over(order by coalesce(avg(diffbtworder),99999999)) rankavgdays
from(
select
o.orderid,
o.CustomerID,
o.OrderDate as currentorder,
lead(orderdate) over(partition by customerid order by orderdate) as nextorder,
datediff(day,orderdate,lead(orderdate) over(partition by customerid order by orderdate)) as diffbtworder
from sales.orders as o
)t
group by customerid


-------------------------------------
----find the lowest and highest sales of each product---
select 
o.OrderID,
o.ProductID,
o.Sales,
sales-FIRST_VALUE(sales) over(partition by productid order by sales asc) as SALEDIFF,
FIRST_VALUE(sales) over(partition by productid order by sales desc) as highestsaleprod,
FIRST_VALUE(sales) over(partition by productid order by sales asc) as lowestsaleprod,
LAST_VALUE(sales) over(partition by productid order by sales desc 
rows between current row and unbounded following) lastvaluelow,
MIN(sales) over(partition by productid) as minlowprod,
MAX(sales) over(partition by productid) as maxhighprod
from sales.orders as o

