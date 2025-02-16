
use db;
update class set Time =current_time() where id=14;
update class set Time =current_time() where id=15;
update class set Time =current_time() where id=16;
update class set Time =current_time() where id=17;
update class set Time =current_time() where id=18;
update class set Time =current_time() where id=19;
update class set Time =current_time() where id=20;
update class set Time =current_time() where id=21;
update class set Time =current_time() where id=22;
update class set Time =current_time() where id=23;
update class set Time =current_time() where id=24;
update class set Time =current_time() where id=25;
update class set Time =current_time() where id=26;
update class set Time =current_time() where id=27;
update class set Time =current_time() where id=28;
update class set Time =current_time() where id=29;
update class set Time =current_time() where id=30;
update class set Time =current_time() where id=31;
update class set Time =current_time() where id=32;
update class set Time =current_time() where id=33;
update class set Time =current_time() where id=34;
update class set Time =current_time() where id=36;

select c.cust_name,c.city,customer_id,s.salesman_id,s.name ,commission
from customer c join
salesman s on c.salesman_id=s.salesman_id order by s.salesman_id;

select c.cust_name,c.city,s.name,s.city,s.commission
from customer c join
salesman s on c.salesman_id=s.salesman_id and s.city!=c.city and s.commission >0.10;

select c.cust_name,c.city,s.name,commission
from customer c join
salesman s on s.salesman_id=c.salesman_id and s.commission>0.12;

select * from customer ;
select * from salesman;
update salesman set city="paris" where commission=0.14 ;
insert into customer values(3003,5007,"jozy altitor","moscow",200);
insert into customer values(3001,5005,"Brad Guzan","London",300);

select c.city,c.cust_name
from customer c join
salesman s on c.city = s.city where c.city ;
select * from orders;
select o.order_id,o.*,c.cust_name,grade,s.name,commission
from customer c inner join
 orders o on o.customer_id=c.customer_id inner join salesman s on s.salesman_id=o.salesman_id;
 update orders set order_id=70012 where purch_amt=250.45;
 
select o.*,c.*,s.* 
from orders o join
salesman s on s.salesman_id=o.salesman_id  join customer c on c.salesman_id=s.salesman_id;

select * from customer; 
select * from salesman;
insert into salesman values (5009,'Naveen','Chennai',0.12);

select salesman_id from salesman except select salesman_id from customer ;

select c.city,s.* from customer c left join salesman s  on c.salesman_id  = s.salesman_id;
select c.city,s.* from customer c right join salesman s  on c.salesman_id  = s.salesman_id;
select c.city,s.* from customer c join salesman s  on c.salesman_id  = s.salesman_id;
select c.city,s.* from customer c full outer join salesman s  on c.salesman_id  = s.salesman_id;
select c.city,s.* from customer c cross join salesman s order by s.salesman_id desc;
select c.grade,c.customer_id,c.cust_name,c.salesman_id from customer c union select * from salesman s limit 5 offset 5;