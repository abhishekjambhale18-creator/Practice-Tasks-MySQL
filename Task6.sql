create database joinss;
use joinss;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);
CREATE TABLE managers (
    manager_id INT,
    manager_name VARCHAR(50)
);
CREATE TABLE projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);
INSERT INTO projects (project_id, emp_id, project_name) VALUES
(1, 1, 'HR Automation'),
(2, 2, 'Data Migration'),
(3, 3, 'AI Model'),
(4, 7, 'Cloud Setup');
INSERT INTO managers (manager_id, manager_name) VALUES
(101, 'Suresh'),
(102, 'Mahesh'),
(103, 'Ramesh'),
(105, 'Anil');
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(50, 'Marketing');
INSERT INTO employees (emp_id, emp_name, dept_id, manager_id, salary) VALUES
(1, 'Asha', 10, 101, 30000),
(2, 'Ravi', 20, 102, 45000),
(3, 'Neha', 20, 102, 60000),
(4, 'Karan', 30, 103, 40000),
(5, 'Pooja', NULL, 104, 35000),
(6, 'Aman', 40, NULL, 50000);

select * from employees;
select * from managers;
select * from departments;
select * from projects;

-- 1. Display employee name and department name.
select e.emp_name, d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;

-- 2. Show employees who are assigned to a department.
select d.dept_name, e.emp_name 
from employees e
inner join departments d
on e.dept_id=d.dept_id;

-- 3. List employee name with manager name.
select e.emp_name, m.manager_name
from employees e
inner join managers m
on e.manager_id=m.manager_id;

-- 4. Display employees working on projects.
select e.emp_name, p.project_name 
from projects p
inner join employees e
on p.emp_id=e.emp_id;

-- 5. Show project name with employee name.
select p.project_name, e.emp_name
from projects p
inner join employees e
on p.emp_id=e.emp_id;

-- 6. List employees who have both manager and department.
select e.emp_name, m.manager_name, d.dept_name
from employees e
inner join managers m
on e.manager_id=m.manager_id
inner join departments d
on e.dept_id=d.dept_id;

-- 7. Display department-wise employee names.
select d.dept_name, e.emp_name
from departments d
inner join employees e
on d.dept_id=e.dept_id;

-- 8. Find employees working in the IT department.
select e.emp_name, d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id
where d.dept_name="IT";

-- 9. Show all employees and their department names (include employees without department).
select e.emp_name, d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id;

-- 10. Display all employees and their manager names (include employees without manager).
select e.emp_name, m.manager_name
from employees e
left join managers m
on e.manager_id=m.manager_id;

-- 11. Show all employees and projects (include employees without projects).
select e.emp_name, p.project_name
from employees e
left join projects p
on e.emp_id=p.emp_id;

-- 12. List employees even if they are not assigned to any department or project.
select e.emp_name, d.dept_name, p.project_name
from employees e
left join departments d
on e.dept_id=d.dept_id
left join projects p
on e.emp_id=p.emp_id;

-- 13. Display employees with department name;
select e.emp_name, d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id;

-- 14. Find employees who are not assigned to any project.
select e.emp_name
from employees e
left join projects p
on e.emp_id=p.emp_id
where p.project_name is null;

-- 15. Show all departments and their employees (include departments without employees).
select d.dept_name, e.emp_name
from departments d
left join employees e
on d.dept_id=e.dept_id;

-- 16. Display all managers and employees reporting to them.
select m.manager_name, e.emp_name
from managers m
left join employees e
on m.manager_id=e.manager_id;

-- 17. Show all projects and assigned employees (include projects without employees).
select p.project_name, e.emp_name
from projects p
left join employees e
on p.emp_id=e.emp_id;

-- 18. List departments even if no employee is assigned.
select d.dept_name, e.emp_name
from departments d
left join employees e
on d.dept_id=e.dept_id;

-- 19. Display managers even if they have no employees.
select m.manager_name, e.emp_name
from managers m
left join employees e
on m.manager_id=e.manager_id;

-- 20. Find departments with no employees
select d.dept_name, e.emp_name
from departments d
left join employees e
on d.dept_id=e.dept_id
where e.emp_name is null;