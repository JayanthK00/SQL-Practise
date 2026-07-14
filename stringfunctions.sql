---------------manipulation---------------
select customers.first_name,
		customers.country,
		concat(first_name, '-' ,country) as name_country,
		upper(first_name) as upper,
		lower(first_name) as lower
		from customers
		---------------------------------------------------

-------------------find whose has spaces--------------
select 
first_name
from customers
EXCEPT 
select 
trim(first_name) trimm
from customers

select
first_name  name_
from customers
where first_name != trim(first_name)

-----------------------replace----------------------

select
('123-456-789') as phone,
replace('123-456-789','-','') as clean_phone

select
'report.txt' as oldfilename,
replace('report.txt','.txt','.csv') as newfilename

---------------------------------------------------------------
select 
first_name,
len(first_name) as leng
from customers 

