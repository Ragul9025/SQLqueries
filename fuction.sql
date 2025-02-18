/* going to store procedure*/ 
create database fun;
use fun;
create table cars (make varchar(40),model varchar(59),year int, value decimal(10,2)) ;
insert into cars values('porsche','911 673',2020,15600),
('porsche','cayman 673',2010,14600),
('porsche','paremera',2022,113200),
('porsche','macan',2019,27400),
('porsche','718 boxster',2017,48800),
('porsche','488 6tb',2015,23750),
('porsche','FB Tiributa',2019,575600),
('porsche','sf90 strable',2023,156600),
('porsche','bmw',2020,1765420),
('porsche','toyota',2024,67700);

Delimiter //
create procedure get_all_cars()
begin
     select * from cars order by make;
end //
Delimiter ;
call get_all_cars();

/* parameter */
delimiter //
create procedure get_all_cars3
(
in year_filter int )
begin
select * from cars where year=year_filter ;
end //
delimiter ;
call get_all_cars3(2017);

delimiter //
create procedure get_value
(in year_filter int,
out cars_number int,
out min_value decimal(10,2),
out max_value decimal(10,2),
out avg_value decimal(10,2))
begin
select count(*),min(value),max(value),avg(value) into cars_number,min_value,max_value,avg_value
from cars 
where year=year_filter;
end //
delimiter ;
 call get_value(2020,@number,@min_price,@max_price,@avg_price);
 
 select @number,@min_price,@max_price,@avg_price;
 alter table cars add column start_date date;
 insert into cars(start_date) values ("2012-07-08");
 update cars set start_date="2012-07-6";
 select * from cars;
 
 delimiter //
 create function no_of_years(date1 date) returns int deterministic
 begin
 declare date2 date;
 select current_date() into date2;
 return year(date2)-year(date1);
 end //
 delimiter ;
 
 select make, no_of_years(start_date) as 'year' from cars;
 
use db;
delimiter &&
create function get_hour_diff(hour1 time)returns int deterministic
begin
declare hour2 time;
select current_time() into hour2;
return hour(hour1)-hour(hour2);
end &&
delimiter ;

select id,name,time,get_hour_diff(time) as hour from class

delimiter **
create function get_time(curr_date date) returns int deterministic
begin
declare curr_date2 date;
select current_date() into curr_date2;
return day(curr_date)-day(curr_date2);
end **
delimiter ;

select name,date,get_time(date) as date from class 

delimiter &&
create function get_hour_diff2(hour1 time)returns int deterministic
begin
declare hour2 time;
select current_time() into hour2;
return minute(hour1)-minute(hour2);
end &&
delimiter ;

select name ,time,get_hour_diff2(time) as minute_diff from class;