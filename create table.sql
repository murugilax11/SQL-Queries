CREATE database student;
use student;

create table student(
 id int primary key,
 name varchar(30),
 gpa decimal(3,2)
 );
 
 describe student;
 
 alter table student ADD dep varchar(10);
 alter table student drop column dep;
 
 use student;
 
 insert into student values(1,"aarthi",9.2);
 insert into student values(2,"Anitha",8.0);
 insert into student values(3,"Anitha",8.3);
 
 insert into student values(4,"Arul",7.5),(5,"Balaji",9.7),(6,"Keerthika",7.6);
 select * from student;
 
 select id, name from student;