select 
3.1234,
round(3.145,2) as round_2,
round(3.789,3) as round_3

-----------------------------------------------------
select -10,
abs(-12)as absd,
abs(-100)

------------------------------date and time functions-------------
select 
OrderID,
OrderDate,
ShipDate,
CreationTime
from sales.Orders
------------------------------------------------------------------
select 
OrderID,
CreationTime,
'26-08-26' as hardcoded,
getdate() as today
from sales.Orders
--------------------------------------------------------

select 
creationtime ,
year(creationtime) as year,
datepart(year,Creationtime) as year,
month(CreationTime) as month,
datepart(month,creationtime) as month,
day(creationtime) as date,
datepart(day,creationtime) as date,

DATEPART(hour,creationtime) as hour_dp,
datepart(quarter,CreationTime) as QUARTER_dp,
DATEPART(week,CreationTime) as week_dp

from sales.orders

-------------------------------------------------------------------
--datename-------------------------

select 
CreationTime,
datename(weekday,CreationTime) as day_dn,
datename(month,CreationTime) as month_dn,
datename(year,CreationTime) as year_dn_butitisstring
from sales.Orders

---------------------------------------------------------------
--------------------------------------------------------------
---------datetrunc---------------
select
CreationTime,
DATETRUNC(MILLISECOND,CreationTime)
from sales.Orders

----------------------------how many order were placed each year-----------

select * from sales.orders
select 
year(orderdate) as yearof,
count(*) as nooforders
from sales.orders
group by year(orderdate)
-------------------------------------------------------------
--how many orders were placed each month-------
select 
datename(month,orderdate) as eachmonths,
count(*) as nooforder
from sales.Orders
group by datename(month,orderdate)
----------------------------------------------------------
--------------show all orders placed in feb--------------
select *
from sales.Orders
where datename(month,OrderDate)='february'
------------------------------------------------------
select
datetrunc(yy,getdate()) as dtrunc
---------------------------------------------



