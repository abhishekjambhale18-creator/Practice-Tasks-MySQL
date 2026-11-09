create database subq;
use subq;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    budget INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Employee_Project (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);
INSERT INTO Departments VALUES
(1,'HR','Mumbai'),
(2,'IT','Pune'),
(3,'Finance','Delhi'),
(4,'Sales','Bangalore');

INSERT INTO Employees VALUES
(101,'Amit',50000,2,NULL),
(102,'Neha',60000,2,101),
(103,'Rahul',45000,1,NULL),
(104,'Pooja',70000,3,NULL),
(105,'Karan',40000,4,104),
(106,'Sneha',55000,2,101);
INSERT INTO Projects VALUES
(201,'Payroll System',2,300000),
(202,'Recruitment Portal',1,150000),
(203,'Accounting App',3,250000),
(204,'Sales Dashboard',4,200000);
INSERT INTO Employee_Project VALUES
(101,201,40),
(102,201,35),
(103,202,30),
(104,203,45),
(105,204,25),
(106,201,20);

-- Q1
create view avg_salary as
select * from employees
where salary > (
select avg(salary) from employees);

select * from avg_salary;

-- Q2
create view max_salary as
select * from employees
where salary = (
select max(salary) from employees);

select * from max_salary;

-- Q3
create view neha_salary as
select * from employees
where salary < (
select salary from employees
where emp_name="Neha");

select * from neha_salary;

-- Q4
create view min_budget as 
select * from projects
where budget =(
select min(budget) from projects);

select * from min_budget;

-- Q5
create or replace view karan as 
select * from employees
where dept_id =(
select dept_id from employees 
where emp_name="karan");

select * from karan;

-- Q6
create or replace view min_salary as 
select * from Employees
where salary =(
select min(salary) from employees);

select * from min_salary;

-- Q7
create or replace view hour_work as
select * from employees 
where emp_id = (
select emp_id from Employee_Project
order by hours_worked asc limit 1);

select * from hour_work;

-- Q8
create view location as
select * from employees
where dept_id in (
select dept_id from departments
where location in ('pune', 'mumbai'));

select * from location;

-- Q9
create view dept as
select * from employees
where dept_id in (
select dept_id from projects);

select * from dept;

-- Q10
create view dept1 as
select * from departments
where dept_id not in (
select dept_id from employees);

select * from dept1;

-- Q11
create view budget as
select emp_name from employees
where dept_id = (
select dept_id from projects
where budget = (
select max(budget) from projects));

select * from budget;

-- Q12
create view salary as
select emp_name from employees
where salary > (
select avg(salary) from employees
where dept_id = (
select dept_id from employees 
where emp_name = 'karan'));

select * from salary;

-- Q13
create view hours as
select emp_name from employees
where emp_id in (
select emp_id from employee_project
where hours_worked = (
select max(hours_worked) from employee_project));

select * from hours;

-- Q14
create view salary_neha as
select emp_name from employees
where salary > (
select salary from employees
where emp_id = (
select manager_id from employees
where emp_name = 'neha'));

select * from salary_neha;

-- Q15
create view avg_budget as
select dept_name from departments
where dept_id in (
select dept_id from projects
where budget > (
select avg(budget) from projects));

select * from avg_budget;
