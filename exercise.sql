use db;

/* left join and right join */
select c.cust_name,c.city,c.customer_id,o.ord_date,purch_amt
from   orders o left  join
customer c on c.customer_id =o.customer_id ;

select c.cust_name,c.city,c.cust_id,o.ord_date,purch_amt
from  customer c  left outer join
 orders o on c.cust_id =o.customer_id ;

select * from orders;
select * from customer;
alter table customer  rename column customer_id  to cust_id;

select o.customer_id,purch_amt,c.cust_name,city
from orders o right join 
customer c on o.customer_id=c.cust_id;

select o.customer_id,purch_amt,c.cust_name,city
from  customer c  right join 
orders o on o.customer_id=c.cust_id;

insert into orders values(70015,234.76,"2012-09-05",3013,5002);

select * from salesman;

select *
from orders o join
customer c on  c.cust_id=o.customer_id join
salesman s on   s.salesman_id=o.salesman_id and s.commission >0.12 order by o.order_id ;

select c.cust_name,c.city,grade,s.name,s.city
from customer c join
salesman s on s.salesman_id=c.salesman_id order by c.cust_id;

select c.cust_name,c.city,grade,s.name,s.city
from customer c join
salesman s on s.salesman_id=c.salesman_id  and c.grade<300 order by c.cust_id;

select c.cust_name,c.city,o.order_id,ord_date,purch_amt
from customer c join
 orders o on o.customer_id=c.cust_id and o.ord_date > "2012-09-09" order by ord_date;
 
 select c.cust_name ,cust_id,grade ,s.name,commission
 from customer c left join
 salesman s on c.salesman_id=s.salesman_id order  by c.cust_name;
 
 

