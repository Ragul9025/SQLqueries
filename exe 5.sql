use db;
select * from booktype;
 
 create table bookmanage(id int not null,staff varchar(30),Tot_amount int,book_id int ,foreign key(book_id) references booktype(book_id));
 
 select * from bookmanage;

insert into bookmanage values 
(201,"RK ",30000,7),
(202,"priya",50000,8),
(203,"sajitha",60000,10),
(204,"sangeetha",50000,9),
(205,"vijay",40000,7),
(206,"anil",40000,8),
(207,"banu",50000,9),
(208,"mohana",40000,10),
(209,"blau",70000,11),
(210,"sri",40000,9),
(211,"hari",49000,8),
(212,"sujith",40000,9),
(213,"aravind",50000,7),
(214,"kamal",30000,11),
(215,"sanjay",60000,7),
(216,"praveem",40000,8),
(217,"velu",50000,10),
(218,"allu",60000,11);

select b.title,price,gender,m.id,staff
from booktype b join
bookmanage m on m.book_id=b.book_id ;

select count(title),b.title
from booktype b join
bookmanage m on m.book_id=b.book_id group by b.title;


 select sum(tot_amount),count(id),b.title
from booktype b join
bookmanage m on m.book_id=b.book_id group by m.book_id;

 select b.title,gender,salary,m.tot_amount,id
from booktype b join
bookmanage m on m.book_id=b.book_id and m.tot_amount<b.salary and b.gender in("m") ;

 select b.title,gender,salary,m.tot_amount,id
from booktype b join
bookmanage m on m.book_id=b.book_id where exists (select b.salary from booktype where b.salary>m.tot_amount and b.gender in('f')) order by m.id ;

 select count(m.id)
from booktype b join
bookmanage m on m.id!=b.book_id group by m.id;
