create database sample;

use sample;

create table departments(
dept_id int primary key,
dept_name varchar(50));

create table employees(
emp_id int primary key,
emp_name varchar(50),
dept_id int,
foreign key (dept_id) references departments (dept_id),
manager_id int,
salary float,
city varchar(50));

create table projects(
project_id varchar(5) primary key,
project_name varchar(50),
dept_id int,
foreign key (dept_id) references departments(dept_id),
budget int);

create table assignments(
assign_id int primary key,
emp_id int,
foreign key (emp_id) references employees(emp_id),
project_id varchar(5),
foreign key (project_id) references projects(project_id),
hour int);

insert into departments values(1, 'Sales'),(2, 'HR'),(3, 'IT'),(4, 'Finance'),(5, 'Marketing');

insert into employees values(101, 'Amit', 3, null, 90000, 'Pune'),(102, 'Neha', 3, 101, 60000, 'Mumbai'),
							(103, 'Rahul', 1, 104, 45000, 'Pune'),(104, 'Sara', 1, null, 80000, 'Delhi'),
							(105, 'Priya', 2, 106, 40000, 'Mumbai'),(106, 'Karan', 2, null, 70000, 'Pune'),
							(107, 'Anil', null, 101, 35000, 'Delhi'),(108, 'Meera', 4, 104, 50000, 'Mumbai');
                            
insert into projects values('P1', 'Website Revamp', 3, 500000),('P2', 'Sales Dashboard', 1, 300000),
							('P3', 'Payroll System', 4, 400000),('P4', 'Brand Campaign', 5, 250000),
							('P5', 'Cloud Migration', 3, 350000);

insert into assignments values(1, 101, 'P1', 120),(2, 102, 'P1', 80),(3, 102, 'P5', 60),
							  (4, 103, 'P2', 90),(5, 104, 'P2', 40),(6, 106, 'P3', 30),
							  (7, 108, 'P3', 100);

select * from departments;
select * from employees;
select * from projects;
select * from assignments;

-- Q1 Employees with their department
select e.emp_name, d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;

-- Q2 Projects with owning department
select project_name, dept_name
from projects p
inner join departments d
on p.dept_id=d.dept_id;

-- Q3 Employee, project and hours
select e.emp_name, p.project_name, a.hour
from employees e
inner join assignments a
on e.emp_id = a.emp_id
inner join projects p
on a.project_id = p.project_id;

-- Q4 IT employees earning > 55,000
select e.emp_name, d.dept_name, e.salary
from employees e
inner join departments d
on e.dept_id=d.dept_id
where e.salary>55000 and d.dept_name="IT";

-- Q5 All employees + department
select e.emp_name, d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id;

-- Q6 All employees + their projects
select e.emp_name, p.project_name
from employees e
left join assignments a
on e.emp_id=a.emp_id
left join projects p
on a.project_id=p.project_id;

-- Q7 Employees with no project
select e.emp_name
from employees e
left join assignments a
on e.emp_id=a.emp_id
where a.assign_id is null;

-- Q8 Total hours per project
select p.project_name, sum(a.hour) as total_hours
from projects p
left join assignments a
on p.project_id=a.project_id
group by p.project_name;

-- Q9 All departments + employees
select d.dept_name, e.emp_name
from employees e
right join departments d
on e.dept_id=d.dept_id;

-- Q10 Departments with no employees
select d.dept_name, e.emp_name
from employees e
right join departments d
on e.dept_id=d.dept_id
where e.emp_name is null;

-- Q11 All projects + assigned staff
select p.project_name, e.emp_name as assigned_staff
from assignments a
right join projects p
on a.project_id=p.project_id
left join employees e
on a.emp_id=e.emp_id;

-- Q12 Employee with manager name
select e.emp_name, m.emp_name as manager_name
from employees e
left join employees m
on e.manager_id=m.emp_id;

-- Q13 Employees with no manager
select e.emp_name, m.emp_name as manager_name
from employees e
left join employees m
on e.manager_id=m.emp_id
where e.manager_id is null;

-- Q14 Earn more than their manager
select e.emp_name, e.salary, m.emp_name as manager_name, m.salary as manager_salary
from employees e
inner join employees m
on e.manager_id = m.emp_id
where e.salary > m.salary;

-- Q15 Same-city employee pairs
select e1.emp_name, e2.emp_name, e1.city
from employees e1
inner join employees e2
on e1.city=e2.city
where e1.emp_id < e2.emp_id;