	select 
	datename(month,OrderDate) as ordermonth,
	sum(sales) totalsales
	INTO sales.monthyorders
	from sales.orders
	group by datename(month,OrderDate)

	