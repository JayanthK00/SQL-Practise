--------------all orders with customer,productand employee-------
----orderid,customer name,product name,sales,price,sales person name---------------------


use salesdb


select * from sales.Customers;

select * from sales.Employees;

select * from sales.Orders;

select * from sales.OrdersArchive;

select * from sales.Products;



select 
o.OrderID,
c.FirstName as customer_name,
c.LastName,
p.Product as product_name,
o.Sales,
p.Price,
e.FirstName as salespersonnmae,
e.LastName

from sales.orders as o
left join sales.Customers as c
on o.CustomerID=c.CustomerID

left join sales.Products as p
on o.ProductID=p.ProductID

left join sales.Employees as e
on o.SalesPersonID=e.EmployeeID
