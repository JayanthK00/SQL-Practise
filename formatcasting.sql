select
OrderID,
CreationTime,
format(creationtime,'dd') as dd,
format(creationtime,'ddd') as ddd,
format(creationtime,'dddd') as dddd,
format(creationtime,'yy') as yy,
format(creationtime,'yyy') as yyy,
format(creationtime,'yyyy') as yyyy,

format(creationtime,'MM*dd*yyyy') as USA,
format(creationtime,'dd-MM-yy') as EURO
from sales.Orders


-----------------day wed jan q1 2025 12:34:56 pm-------------
select
OrderID,
CreationTime,
'Day '+ format(creationtime,'ddd MMM ') + 'Q' +datename(quarter,CreationTime) + format(creationtime,' yyyy hh:mm:ss tt') as formatt
from sales.Orders
----------------------------------------------------------------------------


select
format(Orderdate,'MMM-yyy')as monthorder,
count (*) as orderno
from sales.orders
group by format(Orderdate,'MMM-yyy')

-----------------------------------------------------------------------
------------------CONVERT()----------------------
select
convert(int , '123') as [string to int convert],
creationtime,
convert(varchar,creationtime,32) as usastd32,
convert(date,creationtime)as dates
from sales.orders
------------------------------------------------------------------
------------------------CAST()--------------------------------------
SELECT
CAST('123' as int),
cast(getdate() as datetime2),
cast(creationtime as date),
creationtime
FROM SALES.ORDERS
-------------------------------------------------------------
--------------------------dateadd()----------------------------
select 
orderid,
OrderDate,
dateadd(year,65,OrderDate) as years65,
dateadd(month,-67,orderdate) as months67
from sales.orders
----------------------------------------------------------------
------------------------------DATEDIFF()----------------------------
select 
FirstName,
BirthDate,
datediff(year,getdate(),BirthDate) as yearsage
from sales.employees
---------------------------------------------------------
--find average shipping duration in days for each month
select
MONTH(orderdate),
avg(datediff(day,OrderDate,ShipDate))as gapdaysAVG
from sales.Orders
group by month(orderDate)


-----------------------------------------------------------------------
--find no of days between each order and previous order )
select
orderid,
orderdate as currentorderdate,
lag(orderdate) over (order by orderdate) previousdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate)nrofdays
from sales.Orders


----each user-----
select * from sales.orders
select 
customerid,
productid,
orderdate,
lag(orderdate) over (order by orderdate) previousdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate)gapbetween2orders

from sales.orders
order by CustomerID asc

----------subquery to avg users days-----
/*with ordergaps as(
select 
customerid,
productid,
orderdate,
lag(orderdate) over (order by orderdate) previousdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate)gapbetween2orders
from sales.orders
order by CustomerID asc
)
select
customerid,
avg(gapbetween2orders) as avg_gap
from ordergaps
--where gapbetween2orders is not null--
group by CustomerID */


WITH OrderGaps AS (
    SELECT
        CustomerID,
        ProductID,
        OrderDate,
        LAG(OrderDate) OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ) AS PreviousDate,
        DATEDIFF(
            DAY,
            LAG(OrderDate) OVER (
                PARTITION BY CustomerID
                ORDER BY OrderDate
            ),
            OrderDate
        ) AS GapBetween2Orders
    FROM Sales.Orders
)
SELECT
    CustomerID,
    AVG(GapBetween2Orders) AS Avg_Gap
FROM OrderGaps
WHERE GapBetween2Orders IS NOT NULL
GROUP BY CustomerID
ORDER BY CustomerID;

select * from sales.orders
select 
customerid,
productid,
orderdate,
lag(orderdate) over (order by orderdate) previousdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate)gapbetween2orders

from sales.orders
order by CustomerID asc
