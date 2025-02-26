use db;
select * from class where age=(select age from class limit 1 );
select * from class where age not in (select age from class);
select * from class where age  in  (select age from class);
select * from class where age >(select avg(age) from class);
select * from class where age >=(select avg(age) from class);
select * from class where age !=(select avg(age) from class);
select avg(age) from class;
select age from class;

select * from class;
select * from class where gender = (select gender from class  where gender = 'm'  limit 1);

select * from class where finalgrade in (select finalgrade from class where finalgrade in ('a','b'));

select *
from customer c join 
orders o on c.salesman_id=o.salesman_id join 
salesman s on o.salesman_id=s.salesman_id;

create index classin on class(id,name,age);
show index from class;
select * from class;

select id,name,age from classin;

create view classview as select id ,name,age,date from class;

select * from classview;

create view class_teenage as select id ,name,age,date from class where age<18;

select * from class_teenage;

create  view class_major as select * from class where age>18 and finalgrade='a';

select * from  class_major;
select * from booktype;
select id,(select title from booktype where booktype.book_id >class.id limit 1)as ids from class ;

select book_id ,title from booktype union select cust_id, salesman_id from  customer ;

delimiter //
create function age_to_weight (ages int) returns decimal(10,2) deterministic
begin 
  return (ages+2)*2.05;
  end //
delimiter ; 

select name,age,gender,age_to_weight(age) from class;
