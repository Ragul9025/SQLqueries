use db;
create table class(id int auto_increment primary key,name varchar(40),age int,grade char);
insert into class values(1,"ragul",22,'a');
insert into class(name,age,grade) values
("Boss",23,'a'),
("vijay",56,'b'),
("Mano",33,'c'),
("Priya",22,'c'),
("Sowmiya",32,'b'),
("Pavi",23,'a'),
("Samantha",34,'b'),
("Parvathi",34,"c"),
("Thrisha",55,'a'),
("Anu",34,'b'),
("Renu",34,'a'),
("Banu",23,'c'),
("Dhivya",34,'c'),
("Ramesh",22,'c'),
("Vinith",32,'b'),
("Naveena",23,'a'),
("Madhu",23,'c'),
("Serjio",34,'a'),
("Ananth",45,'a'),
("Vasu",23,'a'),
("Vaithees",23,'a'),
("Gowri",34,'b'),
("Hema",44,'b'),
("Ajay",34,'c'),
("Aswin",44,'c'),
("Mathi",22,'a'),
("swetha",33,'c'),
("varsha",23,'c');
select * from class;
select * from class where age>25;
select * from class where grade<'b';
select * from class where id>=10;
select * from class where name like "p%" ;
alter table class add column gender char;
alter table class change column grade  finalgrade char

