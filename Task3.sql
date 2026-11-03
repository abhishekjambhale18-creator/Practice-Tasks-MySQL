use new;

create table emp_sales(
sale_id int primary key,
emp_name varchar(50) not null,
department varchar(50) not null,
sale_date date not null,
amount float check(amount>0));

select * from emp_sales;

insert into emp_sales values(1,"Amit","Electronics","2026-01-05",5000),(2,"Neha","Electronics","2026-01-12",7000),
                            (3,"Ravi","Electronics","2026-01-20",7000),(4,"Sara","Electronics","2026-02-03",3000),
                            (5,"John","Clothing","2026-01-08",4000),(6,"Priya","Clothing","2026-01-15",6000);
insert into emp_sales values(7,"Karan","Clothing","2026-02-01",6000),(8,"Meena","Clothing","2026-02-10",2000),
                            (9,"Dev","Grocery","2026-01-10",1500),(10,"Anil","Grocery","2026-01-25",2500),
                            (11,"Pooja","Grocery","2026-02-05",2500),(12,"Rahul","Grocery","2026-02-15",1000);
     
-- Q1     
select emp_name, department, amount, row_number() over(partition by department order by amount desc, sale_date asc) as row_num from emp_sales;

-- Q2
select emp_name, amount, rank() over(order by amount desc) as rnk from emp_sales;

-- Q3
select emp_name, amount, dense_rank() over(order by amount desc) as dense_rnk from emp_sales;

-- Q4
select emp_name, department, sale_date, amount, sum(amount) over(partition by department order by sale_date) as running_total from emp_sales;

-- Q5
select emp_name, department, amount, avg(amount) over(partition by department order by department) as dept_avg from emp_sales;

-- Q6
select emp_name, department, amount, min(amount) over(partition by department order by department) as dept_min from emp_sales;

-- Q7
select emp_name, department, amount, lag(amount) over(partition by department order by sale_date) as previous_amount, amount-lag(amount) over(partition by department order by sale_date) as chnge from emp_sales;

-- Q8
select emp_name, department, amount, lead(amount) over(partition by department order by sale_date) as next_amount from emp_sales;