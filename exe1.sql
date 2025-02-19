delimiter &&
create procedure one_value(out max_value int)
begin 
select max(value) into max_value from cars;
end &&
delimiter ;
call one_value(@m);
select @m;

delimiter **
create procedure get_inout(in make varchar(30),
out maximum int,
out count_cars int,
out min_value int,
out avg_value int
)
begin 
select max(value),count(*),min(value),avg(value) into maximum,count_cars,min_value,avg_value from cars;
end **
delimiter ;
call get_inout("porsche",@max,@count,@min,@avg);

select @max,@count,@min,@avg;
select * from cars;

use fun;
drop procedure if exists get_all_cars;


update cars set value=12000 where model="cayman 673";
savepoint sp1;
update cars set value=15000 where model="bmw";

commit;
update cars set value=17000 where model="toyota";
select * from cars;
rollback;
select * from cars;
show table status where name='model';
set autocommit=0;
alter table cars add column GST decimal(10,2);
update cars set GST=2000.90 where make='porsche';

delimiter $$
create function per_sum3(amt decimal(10,2)) returns int deterministic
begin
   declare gst decimal(10,2);
   select 1000 into gst;
   return (amt+gst*100)/10;
end $$
 delimiter ;
 drop function if exists per_sum3;
 select per_sum3(year) as TOTAL_PRICE_$$ from cars;
 
 
 delimiter $$
 create function per_sum1(vals decimal(10,2))returns int deterministic
 begin
 return (vals*18)/100;
 end $$
 delimiter ;
 
 select *, per_sum1(value) as price from cars;
 
  delimiter $$
 create function per_sum2(vals decimal(10,2),per decimal(10,2))returns int deterministic
 begin
 return (vals*per)/100;
 end $$
 delimiter ;
 
 select model,make,per_sum2(value,GST) as prize from cars
 
  delimiter $$
 create function per_sum3(str date)returns int deterministic
 begin
 return timestampdiff(year,str,"2013-08-06");
 end $$
 delimiter ;
 update cars set start_date="2010-09-07" where year=2017;
 select start_date,per_sum3(start_date) as 'year' from cars;
 select * from cars;
use db;
   
delimiter $$
 create function grade_check(gd int)returns char(2) deterministic
 begin
 declare ranks char(2);
     if gd>=300 then
     set ranks='A';
     elseif gd>=200 then
     set ranks='B';
     else 
     set ranks='C';
     end if;
     return ranks;
 end $$
 delimiter ;
 
 select *  from customer;
 
 select cust_id,cust_name,city,grade_check(grade) as Ranks from customer;