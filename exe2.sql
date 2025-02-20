use db;

delimiter //
create function db.c_12(ename varchar(30)) returns date deterministic
begin
declare dateof date;
select date into dateof from db.c_12;
return dateof;
end //
delimiter ;

select cb_12(name) as berth from class;

delimiter //
create trigger afterinsert
before insert on class for each row
begin 
if old.gender='f' then set old.gender='female';
end if;
end //
delimiter ;

show triggers;

select * from class;

delimiter //
create function db.c_12(ename varchar(30)) returns date deterministic
begin
declare dateof date;
select date into dateof from class;
return dateof;
end //
delimiter ;

select db.c_12('vasu') from class;

create table newbook (id int ,price double,new_price double);
delimiter //
create trigger tri_3
after update on booktype for each row
begin
insert into newbook(id,price,new_price) values
(old.book_id,old.price,new.salary);
end //
delimiter ;

select * from newbook;
select * from booktype;
use dummy;
delimiter //
select * from client ;
select * from students;
delimiter //
create function  fun_1(ages int) returns varchar(40) deterministic 
begin 
       declare who varchar(20);
       if ages>20 then 
         set who=name;
          end if;
		          return  who;

end //
delimiter ;
select fun_1(age) as name from students;
select * from students;

