use db;
select * from class where age<(select avg(age) from class);
select avg(age) from class;
select max(id) from class;
select * from class where name in(select name  from class where name like "r%");
select * from class where finalgrade in(select finalgrade from class where finalgrade='a');
select name,age,gender from class where gender in(select gender from class where gender='m');
select * from class where id in (select id from class where id>=13);
select * from class;
update class set date=current_date() where id=34;
select name ,id from class where age = (select max(age) from class);

alter table class add column  date date;  
update class set date="2000-11-20" where id=2;
select id,name,age from class where not exists (select id from class where id>3);
select id,name,age from class where not exists (select id from class where  id>36);
update class set date="2000-7-1" where id=3;
update class set date="2000-6-2" where id=4;
update class set date="2002-4-5" where id=5;
update class set date="2004-6-9" where id=6;
update class set date="2002-4-2" where id=7;
update class set date="2003-9-3" where id=8;
update class set date="2001-12-20" where id=9;
update class set date="2000-9-10" where id=10;
update class set date="2000-11-20" where id=11;
update class set date="2000-11-20" where id=12;
update class set date="2000-7-24" where id=13;
update class set date="2000-8-13" where id=14;
update class set date="2000-2-14" where id=15;
update class set date="2002-5-23" where id=16;
update class set date="2000-7-6" where id=17;

update class set date="2003-8-25" where id=18;
update class set date="2001-9-13" where id=19;
update class set date="2000-8-2" where id=20;
update class set date="2001-6-5" where id=21;
update class set date="2000-11-14" where id=22;
update class set date="2004-11-24" where id=23;
update class set date="2001-11-23" where id=24;
update class set date="2000-11-20" where id=25;


