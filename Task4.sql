use new;

create table emp(
emp_id int primary key,
emp_name varchar(50) not null,
dept varchar(50) not null,
city varchar(50) not null,
salary float default 0,
hire_date date not null,
manager_id int default null);

select * from emp;

insert into emp values(1,"Aarav Shah","IT","Pune",72000,"2021-03-15",null);
insert into emp values(2,"Sneha Rao","HR","Mumbai",48000,"2022-07-01",1),
					  (3,"Karan Mehta","Sales","Delhi",55000,"2023-01-10",1),
                      (4,"Priya Nair","IT","Pune",64000,"2020-11-23",1),
                      (5,"Ramesh Iyer","Finance","Mumbai",59000,"2019-05-30",null),
                      (6,"Anita Desai","Sales","Pune",41000,"2024-02-12",3);

-- Q1
select * from emp where dept="IT";

-- Q2
select * from emp where salary>50000 and city="Pune";

-- Q3
select * from emp where hire_date between "2022-01-01" and "2023-12-31";

-- Q4
select * from emp where city in("Pune", "Mumbai", "Delhi") and manager_id is null;

-- Q5
select emp_name from emp where emp_name like "A%";

-- Q6
select emp_name from emp where emp_name like "%sh";

-- Q7
select emp_name from emp where emp_name like "%an%";

-- Q8
select emp_name from emp where emp_name like "_a___";

-- Q9
select dept, count(*) as emp_count from emp group by dept;

-- Q10
select city, avg(salary) as avg_salary from emp group by city;

-- Q11
select dept, sum(salary) as total_salary, max(salary) as max_salary from emp group by dept;

-- Q12
select dept, city, count(*) as emp_count from emp where salary>30000 group by dept, city;

-- Q13
select dept, count(*) as emp_count from emp group by dept having count(*)>3;

-- Q14
select city, avg(salary) as avg_salary from emp group by city having avg(salary)>60000;

-- Q15
select dept, sum(salary) as total_salary from emp group by dept having sum(salary) in(200000, 500000);

-- Q16
select dept, avg(salary) as avg_salary from emp where dept <> "HR" group by dept having avg(salary)>45000 order by avg_salary desc;

-- Q17
select * from emp order by salary desc limit 5;

-- Q18
select * from emp order by hire_date desc limit 3;

-- Q19
select * from emp order by salary desc limit 5 offset 5;

-- Q20
select distinct salary from emp order by salary desc limit 1 offset 2;

-- Q21
select city, count(*) as headcount from emp where emp_name like "S%" group by city order by headcount desc limit 3;

-- Q22
select * from emp where city="Pune" order by emp_name limit 10 offset 20;

-- Q23
select dept, avg(salary) as avg_salary, count(*) as emp_count from emp where hire_date>"2021-12-31" group by dept having count(*)>2 order by avg_salary desc limit 2 offset 1;

-- Q24
select city, count(*) as name_count from emp where emp_name like "%ar%" group by city having count(emp_id)>=2 order by name_count desc limit 3;