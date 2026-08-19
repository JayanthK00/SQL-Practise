create procedure totalcusto as 
begin 
select 
COUNT(*) as totalcusto,
avg(score) as avgscore
from sales.Customers
where country='USA'
end

---------------
exec totalcusto

------------------------------------
--parameters---------------

alter procedure totalcusto @country nvarchar(50) = 'usa'
as 
begin 
select 
COUNT(*) as totalcusto,
avg(score) as avgscore
from sales.Customers as c
where country=@country

select 
count(orderid) totalorders,
sum(sales) as totalsales
from sales.orders as o
join sales.Customers as c
on c.customerid=o.CustomerID
where country=@country

end

----------------------
exec totalcusto @country ='germany'

--default--
exec totalcusto 
------------------------------------------------------
---MULTIPLE STATEMENTS--
----------------------------------------------
alter procedure totalcusto @country nvarchar(50) = 'usa'
as 
begin 

declare @totalcustomers int,
		@avgscore float;

select 
@totalcustomers=COUNT(*) ,
@avgscore=avg(score) 
from sales.Customers as c
where country=@country

print'total customers from ' +@country +':'+ CAST(@totalcustomers AS nvarchar);
print'average score from '+@country+':'+ cast(@avgscore as nvarchar);

select 
count(orderid) totalorders,
sum(sales) as totalsales
from sales.orders as o
join sales.Customers as c
on c.customerid=o.CustomerID
where country=@country

end

exec totalcusto