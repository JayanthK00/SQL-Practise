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