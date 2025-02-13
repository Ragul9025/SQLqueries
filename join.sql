use db;
create table member(course_id int not null,domain_id int primary key,id int,foreign key(id)references class(id),course_name varchar(40));
select * from member order by id;
select* from class;
insert into member values(1,7777,1,"java full stack");
insert into member values(2,6666,2,"python full stack");
insert into member values(3,5555,3,"data analyst");
insert into member values(4,4444,4,"cloud");
insert into member values(5,3333,5,"RAP dev");
truncate table member;
select class.name,finalgrade, member.course_name,domain_id from class
inner join member on class.id=member.course_id order by class.id ;
alter table member modify column course_name varchar(50);
alter table member modify column domain_id int;
use dummy;
select c.customer_name ,address,s.name,finalgrade
from customers c
inner join students s on (c.customer_id=s.id);
select * from customers;
select * from students;
update customers set customer_id=4 where city="bh";
alter table customers modify column customer_id int primary key ; 
create table client (client_id int not null,dept_id int primary key, customer_id int,foreign key(customer_id) references customers(customer_id),name varchar(30), age int,dept varchar(49));
select * from client;
insert into client values(1,606,1,"billa",43,"IT");
insert into client values(2,707,2,"basha",33,"cse");
insert into client values(3,505,3,"antony",22,"Arts");
insert into client values(4,404,4,"mark",33,"ECE");
insert into client values(6,202,3,"god",41,"civil");

select u.city,customer_name, c.dept_id,dept,name
from customers u  join
client c on (u.customer_id=c.client_id);
select u.city,customer_name, c.dept_id,dept,name
from client c left join
 customers u on (u.customer_id=c.client_id);
 select u.customer_name, city,c.dept_id,dept,name 
from customers u right join
client c on (u.customer_id=c.client_id)order by c.client_id;