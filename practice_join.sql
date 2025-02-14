use db;
create table salesman (salesman_id int primary key,name varchar(50),city varchar(40),commission double);
select * from salesman;
insert into salesman values(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite" , "paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Pairs",0.14),
(5007,"Paul Adam","Rome",0.13),
(5003,"Lauson Hen","San Jose",0.12);

create table customer(customer_id int not null, salesman_id int,foreign key(salesman_id)references salesman(salesman_id),cust_name varchar(40),city varchar(40),grade int);
select * from customer;
insert into customer  values(3002,5001,"Nick Rimando","New York",100),
(3007,5001,"Brad Davis" , "New York",200),
(3005,5002,"Grcityaham Zusi","California",200),
(3008,5002,"julian Green","London",300),
(3004,5006,"Fabian Johnson","Paris",300),
(3009,5003,"Geoff Camerion","Berlin",100);

select c.city,cust_name,s.name,commission
from customer c  join
salesman s on s.city= c.city where exists(select 1 from salesman s2 where s2.commission>0.14) ;
 
 create table orders (order_id  int not null,purch_amt double,ord_date date,customer_id int,salesman_id int,foreign key(salesman_id)references salesman(salesman_id));
 select* from orders;
 insert into orders values
      (70001,150.5,"2012-10-05",3005,5002),
       (70009,27-.65,"2012-09-10",3001,5005),
        (70002,65.26,"2012-10-05",3002,5001),
          (70004,110.5,"2012-8-17",3009,5003),
            (70007,948.5,"2012-9-10",3005,5002),
             (70005,2400.6,"2012-7-27",3007,5001),
			(70008,5760,"2012-9-10",3002,5001),
           (70010,1983.43,"2012-10-10",3004,5006),
          (70003,2480.4,"2012-10-10",3009,5003),
		(700012,250.45,"2012-06-27",3008,5002),
	  (70011,75.29,"2012-08-17",3003,5007),
	  (70013,3045.6,"2012,04,25",3002,5001);
      
select o.purch_amt,c.cust_name,city
from customer c join
orders o on o.customer_id=c.customer_id where exists(select city from customer c2 where c2.city in("new york"));
select o.purch_amt,c.cust_name,city
from customer c join
orders o on o.customer_id=c.customer_id and o.purch_amt between 500 and 2000;

