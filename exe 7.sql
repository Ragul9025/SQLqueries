use db;
select * from calc;
create view clac_grade as select * from calc where grade>91;
select * from clac_grade;
select * from customer;

create view customer_london as select * from customer where city='london';
select * from customer_london;

select * from booktype union all select * from customer;
insert into booktype values(3002,"5001",885,98767,'f');
select * from booktype;
alter table bookmanage add column gender varchar(30);
select * from booktype union  select * from customer;
update bookmanage set gender="f" ;
insert into bookmanage values(7,'POWER BI',654,8,'F');
select * from bookmanage;
select * from booktype union  select * from bookmanage;
delete from booktype where book_id=3002;
insert into booktype values(201,'RK',30000,7,'f');

select * from booktype union select * from bookmanage;
select * from booktype;
select * from bookmanage;
select * from booktype union all select * from bookmanage;
 alter table booktype modify price int;
 alter table booktype modify salary int;
 alter table bookmanage modify id int auto_increment primary key;
select * from class where exists(select age from class);

select * from customer;
select * from salesman;
select * from orders;
 
select c.city,cust_id,s.city,name,commission,s.salesman_id ,o.order_id,purch_amt
from customer c join 
salesman s on  c.salesman_id=s.salesman_id and c.city=s.city join 
orders o on o.salesman_id=c.salesman_id ;

select  b1.staff,b1.gender,b2.book_id  from bookmanage b1,booktype b2 where b1.id=b2.book_id;

create database Ragul;
use ragul;
show databases ;
show tables from db;
desc one ;
create table one (id int ,name varchar(30),address varchar(40),dept varchar(30));
alter table one drop  address; 
select * from one;
alter table one add column address varchar(30);
alter table one rename column address to Location;
alter table  one rename to ones;
alter table  ones rename one;
insert into one values
(1,'ragul','IT',null),
(2,'siva',"cse",'kailayam'),
(3,'bala','EEE','bhavani'),
(4,'vasu',"B.COM",'salem'),
(5,'vaithees','BSC','merku');

update one set location='channai' where id=1;

select * from one where id  between 2 and 4;

select * from one where name like 'r%l' ;
select * from one where name like 'v%' ;
select * from one where name like 'v___' ;
select * from one where name like '%l' ;

select name,id, dept, if(name like 'v%','he is a lucky person ', 'you are unlucky person') from one;

delimiter //
create procedure once() 
begin
 select * from one where dept='IT';
 end //
 delimiter ;
    
call once();
update one set amount=20000 where id=1;
update one set amount=50000 where id=2;
update one set amount=70000 where id=3;
update one set amount=40000 where id=4;
update one set amount=30000 where id=5;
alter table one add column amount int(30);

 select * from one;
alter table one modify column amount bigint;
delimiter //
create procedure amt(in salary int,out total int,out count int)
begin 
   select sum(amt),count(id) from one where amount=salary;
   end //
 delimiter ;
 
 call amt(2,@tot,@count);
 select @tot,@count;
 use db;

delimiter //
create procedure salary_det(in gen varchar(20), out avg_amt int , out tot_amt int, out min_amt int ,out max_amt int)
begin 
select avg(salary),sum(salary),min(salary),max(salary) into avg_amt,tot_amt,min_amt,max_amt from booktype where gender=gen ;
end //
delimiter ;

call salary_det('m',@avg,@tot,@min,@max);

select @avg,@tot,@min,@max;

 select * from booktype;
 
alter table bookmanage drop foreign key id;
select *from calc;
update calc set grade=96 where grade is null;
update calc set grade=94 where marks='a';
alter table calc add constraint grade primary key (grade);

select * from booktype;
select * from bookmanage;
update booktype set salary=salary+salary/10 where title like 'f%';
update booktype set title='frame work',price='312',salary=25000,gender='f' where book_id=13;
update booktype b2 join booktype  b1 on b1.book_id=13 set b2.salary=b1.salary+2000 where b2.book_id=201;

update booktype set salary=salary+5000 where price in (select price from(select price from booktype where price >600) as temp);
update booktype set salary=salary+5000 where price in (select price from booktype where price >600);

update booktype b1 join booktype b2 on b1.book_id=b2.book_id set b1.salary=b2.salary-5000 where b1.price<500;

delete  b1 from booktype b1 join booktype b2 on  b1.book_id=b2.book_id where b1.price>800;
set  foreign_key_checks=0; 
delete from bookmanage where tot_amount in (select tot_amount from (select tot_amount from bookmanage where tot_amount<700)as temp);
delete from booktype where price in (select price from (select price from booktype where price>600)as temp);  
set  foreign_key_checks=1;

create table book_log(log_id int, book_id int, action varchar(59),timestamp timestamp default current_timestamp);
select * from book_log;

delimiter //
create trigger second_in
after insert on booktype for each row
begin
    insert into book_log(book_id,action,timestamp) values 
    (new.book_id,'insert',now());
    end //
    delimiter ;
drop trigger second_in;
 INSERT INTO booktype (book_id, price) VALUES (1001, 500); -- Example insert
 INSERT INTO booktype (book_id, price) VALUES (1004, 1300); -- Example insert
 select * from booktype;

