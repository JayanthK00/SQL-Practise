---rank based on sales from high to low--
select 
o.OrderID,
o.ProductID,
o.sales,
row_number() over(order by sales desc) rownum, --unique rank no handling ties--
rank() over(order by sales desc) ranknum,--shared rank with gaps or skips--
dense_rank() over(order by sales desc) dense_ranknum ---shared rank no gaps---
from sales.orders as o


----for each product---
select 
o.OrderID,
o.ProductID,
o.sales,
row_number() over(partition by productid order by sales desc) rownum, --unique rank no handling ties--
rank() over(partition by productid order by sales desc) ranknum,--shared rank with gaps or skips--
dense_rank() over( partition by productid order by sales desc) dense_ranknum ---shared rank no gaps---
from sales.orders as o
--------top highest in each product---

select *
from(
select 
o.OrderID,
o.ProductID,
o.sales,
row_number() over(partition by productid order by sales desc) rownum, --unique rank no handling ties--
rank() over(partition by productid order by sales desc) ranknum,--shared rank with gaps or skips--
dense_rank() over( partition by productid order by sales desc) dense_ranknum ---shared rank no gaps---
from sales.orders as o) t
where rownum=1 and ranknum=1 and dense_ranknum=1

------lowest 2 customer-----
select * from(
select 
o.CustomerID,
sum(o.sales) totalsales,
ROW_NUMBER() over(order by sum(sales)) rowsumnum
from sales.orders as o
group by CustomerID)t
where rowsumnum <=2

---using window--
select * ,
dense_Rank() over( order by winfunsum)
from(
select 
o.OrderID,
o.ProductID,
o.CustomerID,
o.sales,
sum(sales) over(partition by customerid order by sales asc
rows between unbounded preceding and unbounded following) winfunsum
from sales.orders as o) t
 ----where--
 select * 
 from(
 select * ,
dense_Rank() over( order by winfunsum) as rankoo
from(
select 
o.OrderID,
o.ProductID,
o.CustomerID,
o.sales,
sum(sales) over(partition by customerid order by sales asc
rows between unbounded preceding and unbounded following) winfunsum
from sales.orders as o) t)z
where rankoo <=2

-----assign unique id for rows--
select 
row_number() over(order by orderid,orderdate) uniqueid,
*
from sales.OrdersArchive

-------remove dupes and display orginals--
select * from (
select 
ROW_NUMBER() over(partition by orderid order by creationtime desc) rownum,
*
from sales.OrdersArchive)t
where not rownum=1



--------NTILE---------
select orderid,
sales,
ntile(1) over(order by sales desc) as ntile1,
ntile(2) over(order by sales desc) as ntile2,
ntile(3) over(order by sales desc) as ntile3,
ntile(4) over(order by sales desc) as ntile4,
ntile(6) over(order by sales desc) as ntile6 ----large buck-small buck !<1
from sales.Orders



---------segmentation----------
select *,
case when ntile3BUCKETS=1 then 'high'
	when ntile3BUCKETS=2 then 'medium'
	when ntile3BUCKETS=3 then 'low'
end catogery
from(
select 
o.orderid,
o.sales,
ntile(3) over(order by sales desc) ntile3BUCKETS
from sales.orders as o )t


------LOAD BALANCING IN ETL------------
SELECT 
ntile(2) over(order by orderid) buckets,*
from sales.orders
