--triggers----
--running total of each month--
create view cte_o as(
select 
datetrunc(month,orderdate) as ordermonth,
sum(sales) totalsaless,
avg(sales) avgsales,
count(*) numb
from sales.Orders as o
group by datetrunc(month,orderdate) )

select 
ordermonth,
sum(totalsaless) over(order by ordermonth asc) as runningtotal
from cte_o



----------------------------------------------------------------
create view sales.view_two as (
select 
o.OrderID,
o.CustomerID,
o.ProductID,
o.SalesPersonID,
p.product,
p.category,
p.price,
c.FirstName,
c.Score,
e.FirstName,
e.Salary
from sales.orders as o
left join sales.Products as p
on p.productid=o.productid
left join sales.Customers as c
on c.CustomerID=o.CustomerID
left join sales.Employees as e
on e.EmployeeID=o.SalesPersonID)
