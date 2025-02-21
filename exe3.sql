use db;
use dummy;

delimiter **
create procedure pro_21()
begin
  select * from students where age>20 order by  age;
  end **
delimiter ;
call pro_21;
select * from students;

delimiter **
create procedure pro_grade(in grade varchar(20))
begin
  select * from students where finalgrade=grade ;
  end **
delimiter ;
select * from customers;
select *  from students where finalgrade in ('a','b');

select * from class;
delimiter **
create function nones(srs time) returns int deterministic
begin
 declare store time;
 select current_time() into store;
 return hour(store)-hour(srs);
 end **
 delimiter ;
 
 select id, time,nones(time) from class;
 
 select * from orders;
 delimiter **
create function none_1(amt double) returns int deterministic
begin
 declare gst double;
 select amt/10 into gst;
 return gst;
 end **
 delimiter ;
 
 select order_id,purch_amt,none_1(purch_amt) as gst from orders;