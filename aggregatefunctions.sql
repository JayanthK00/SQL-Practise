------------AGGREGATE FUNCTIONS--------------
select
o.customer_id,

count(*) as totalorder,
sum(sales) as totalsales,
avg(sales) as avgsales,
max(sales) as maxsale,
min(sales) as minsale

from Orders as o
group by customer_id

