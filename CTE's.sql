----------STANDALONE CTE-------------
WITH ctetotalsale as(
select
o.CustomerID,
sum(o.sales) as totalsales
from sales.Orders as o
group by o.CustomerID)
--mq--

select
c.CustomerID,
c.FirstName,
c.LastName,
cts.totalsales
from sales.customers as c
left join ctetotalsale as cts
on cts.CustomerID=c.CustomerID


----------------------------------------------------------
--multiple standalone ctes----
WITH ctetotalsale as(
select
o.CustomerID,
sum(o.sales) as totalsales
from sales.Orders as o
group by o.CustomerID)

, cte_lastorder as(
select 
o.CustomerID,
max(orderdate) as lastorder
from sales.Orders as o
group by CustomerID)

select
c.CustomerID,
c.FirstName,
c.LastName,
cts.totalsales,
clo.lastorder
from sales.customers as c
left join ctetotalsale as cts
on cts.CustomerID=c.CustomerID
left join cte_lastorder as clo
on clo.customerid=c.CustomerID


-----------------------------------------------------------
--NESTED CTEs---------------



