--REPORT SHOWING TOTAL SALES FOR EACH CATEGORY---
select 
category,
sum(sales) as totalsales
from(
select
OrderID,
o.SalesPersonID,
o.sales,
case
when sales>50 then 'high'
when sales>20 then 'medium'
else 'low'
end category

from sales.Orders as o
)t
group by category
order by totalsales desc



--MAPPING GENDER AS FULL TEXT---
select
e.EmployeeID,
e.FirstName,
e.LastName,
e.Gender,
case
when e.gender='M' then 'MALE'
when e.Gender='f' then 'FEMALE'
else 'unknown'
end genderfulltext
from sales.Employees as e

--report abbreviated country code---
select *,
case 
when c.Country='germany' then 'de'
when c.Country='usa' then 'us'
else 'world'
end countrycode
from sales.Customers as c


---------------HANDLING NULLS-------
select 
c.CustomerID,
c.LastName,
case when score is null then 0 else score end scoreclean,
avg(case when score is null then 0 else score end ) over() avgcusto,
avg(score) over()  as scoreavg
from sales.Customers as c

--------------CONDITIONAL AGGREGATIONS-----------
--COUNT CUSTOMER ORDER WITH SALES GREATER THAN 30------
SELECT
o.CustomerID,
sum(case 
when sales>30 then 1 else 0 end ) as avgabove30,
count(*) totalorders
from sales.orders as o
group by CustomerID
order by avgabove30 desc
-----------------------------------------------------------

