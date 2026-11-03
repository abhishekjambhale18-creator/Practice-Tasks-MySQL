create database students;
use students;

create table student(
student_id int,
student_name varchar(50),
city varchar(30),
course varchar(40),
marks int);

select * from student;

insert into student value (101,"Asha","Pune","Data Analytics",78);
insert into student value (102,"Ravi","Mumbai","Data Science",35);
insert into student value (103,"Meena","Chennai","Data Analytics",88);
insert into student value (104,"Karan","Delhi","Excel",29);
insert into student value (105,"Sara","Pune","Data Science",91);

alter table student add column email varchar(50);

alter table student drop column city;

alter table student rename column marks to score;

alter table student modify score decimal(5,2);

rename table student to learners;

select * from learners;

insert into learners(student_id,student_name,course,score) value (106,"Vikram","Excel",67);

alter table learners add column city varchar(30);

update learners set city="hyderabad" where student_id=103;

delete from learners where score<40;

truncate learners;

drop table learners;