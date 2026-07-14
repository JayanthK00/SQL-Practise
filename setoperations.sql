select 
FirstName,
LastName
from sales.Customers
union
select 
FirstName,
LastName
from sales.Employees


select 
FirstName,
LastName
from sales.Customers
union all
select 
FirstName,
LastName
from sales.Employees


-----------------except-----------------order of query
select 
FirstName,
LastName
from sales.Employees

select 
FirstName,
LastName
from sales.Customers

select 
FirstName,
LastName
from sales.Employees
except
select 
FirstName,
LastName
from sales.Customers


select 
FirstName,
LastName
from sales.Customers
except
select 
FirstName,
LastName
from sales.Employees

-----------------------------------------------------------------------
-------------------------CHALLENGE------------------------------------
SELECT * from sales.orders
union
select * from sales.OrdersArchive

SELECT [ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
  FROM [SalesDB].[Sales].[Orders]
union
select [ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]

from sales.OrdersArchive
