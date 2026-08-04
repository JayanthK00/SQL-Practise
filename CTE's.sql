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
--mq--

select
c.CustomerID,
c.FirstName,
c.LastName,
cts.totalsales,
ctelast.lastorder
from sales.customers as c
left join ctetotalsale as cts
on cts.CustomerID=c.CustomerID
left join cte_lastorder as ctelast
on ctelast.CustomerID=c.CustomerID

-----------------------------------------------------------
--NESTED CTEs---------------
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

, cte_customerank as (
select 
cts.CustomerID,
cts.totalsales,
rank() over(order by totalsales desc) ranks
from ctetotalsale as cts)

------------segmentation based on totalsales-----------
, cteseg as (
select 
ctetot.customerid,
case 
when ctetot.totalsales > 100 then 'high'
when ctetot.totalsales > 80 then 'mid'
when ctetot.totalsales > 50 then 'low'
else 'very low'
end cteseg
from ctetotalsale as ctetot)



select
c.CustomerID,
c.FirstName,
c.LastName,
cts.totalsales,
clo.lastorder,
crank.ranks,
cteseg.cteseg
from sales.customers as c
left join ctetotalsale as cts
on cts.CustomerID=c.CustomerID
left join cte_lastorder as clo
on clo.customerid=c.CustomerID
left join cte_customerank as crank
on crank.CustomerID=c.CustomerID
left join cteseg as cteseg
on cteseg.CustomerID=c.CustomerID

-----RECURSIVE CTE-----
with cte_recur as (
select 1 as mynumber
union all
select mynumber+1
from cte_recur
where mynumber<2000


)---anchor
--main query
select * from cte_recur
OPTION (MAXRECURSION 5000)

----------------------------------------------------------
with cte_one as(
select 
e.EmployeeID,
e.FirstName,
e.ManagerID,
1 as level
from sales.Employees as e
where ManagerId is null

union all

select rq.EmployeeID,
rq.FirstName,
rq.ManagerID,
level+1
from sales.Employees as rq
inner join cte_one as cte_one
on rq.ManagerID=cte_one.EmployeeID
)
select * from cte_one


















