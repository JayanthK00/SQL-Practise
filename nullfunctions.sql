----------null functions-----------
select 
CustomerID,
score,
avg(score) over () avgscr,
avg(coalesce(score,0)) over() aftercoalesce
from sales.customers
------------------------------------------------------

select * from sales.Customers
select 
CustomerID,
FirstName,
LastName,
firstname + ' '+LastName as fullname,
score + 10 as incre
from sales.Customers

-----------coesce for data aggregation-----------
select 
CustomerID,
FirstName,
LastName,
FirstName + ' '+coalesce(LastName,'') as fullname,
score,
coalesce(score,0) + 10 as incre
from sales.Customers

--------------coalesce for null value at last-----------
select 
CustomerID,
Score,
coalesce(score,999999999) as lazyway
from sales.Customers
order by lazyway asc

select 
CustomerID,
Score,
case when score is null then 1 else 0 end hardpro
from sales.Customers
order by case when score is null then 1 else 0 end , score

----------------------------------------------------------
--------------------nullif()--------------------------
-----------find sales price by div price by quantity----

select * from sales.orders
select
orderid,
sales,
Quantity,
sales/ nullif(quantity,0) as price
from sales.Orders
----------------------------------------------------------------
--identity who has no scores-----
select * from sales.Customers where score is not null
select *
from sales.Customers
where score is null

------------------------------------------
---details of customers who have not placed any orders---

select c.* ,
o.*
from sales.customers as c
left join sales.orders as o
on c.CustomerID=o.CustomerID
where o.CustomerID is null

---------------------------------------------------------------------
------------space vs null vs empty string---------
with orders as (
select 1 id, 'a' category union
select 2, null union
select 3,'' union
select 4, '   ' --------------hidden space---------
)

select *,
datalength(category) as leng,
datalength(trim(category)) as lengpolicy1,
nullif(trim(category),'') as lengpolicy2,
DATALENGTH(nullif(trim(category),'')) as lengpolicy2,
coalesce(nullif(trim(category),''),'unknown') as policy3for_presentingreport
from orders
