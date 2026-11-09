CREATE DATABASE stud; 
USE stud;

CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(50),
    city         VARCHAR(30)
);

CREATE TABLE instructors (
    instructor_id    INT PRIMARY KEY,
    instructor_name  VARCHAR(30),
    experience_years INT
);

CREATE TABLE courses (
    course_id       INT PRIMARY KEY,
    course_name     VARCHAR(50),
    course_category VARCHAR(30),
    base_fee        DECIMAL(10,2),
    instructor_id   INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    enroll_date   DATE,
    discount      DECIMAL(10,2),
    status        VARCHAR(20),   -- Paid / Pending / Cancelled
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

INSERT INTO students VALUES
(1,'Aarav','Hyderabad'), (2,'Priya','Chennai'),   (3,'Rohan','Hyderabad'),
(4,'Sneha','Bengaluru'), (5,'Karthik','Chennai'), (6,'Ananya','Mumbai'),
(7,'Vikram','Hyderabad'),(8,'Divya','Bengaluru'), (9,'Arjun','Mumbai'),
(10,'Meera','Chennai'),  (11,'Rahul','Hyderabad'),(12,'Nisha','Bengaluru'),
(13,'Tara','Mumbai'),    (14,'Kavya','Chennai');

INSERT INTO instructors VALUES
(1,'Ravi',6), (2,'Meena',8), (3,'Kiran',5), (4,'Sunita',4);

INSERT INTO courses VALUES
(101,'SQL Basics',       'Data',      8000,  1),
(102,'Python for Data',  'Data',      12000, 2),
(103,'Excel Mastery',    'Office',    6000,  3),
(104,'Power BI',         'Data',      10000, 1),
(105,'Data Science',     'Data',      25000, 2),
(106,'Digital Marketing','Marketing', 9000,  4),
(107,'Tableau',          'Data',      11000, 1);

INSERT INTO enrollments VALUES
(1,  1, 101, '2026-01-10', 500,  'Paid'),
(2,  2, 102, '2026-01-15', 1000, 'Paid'),
(3,  3, 103, '2026-02-02', 0,    'Pending'),
(4,  4, 104, '2026-02-10', 1500, 'Paid'),
(5,  5, 101, '2026-02-18', 0,    'Paid'),
(6,  6, 105, '2026-03-01', 2000, 'Pending'),
(7,  7, 102, '2026-03-05', 0,    'Cancelled'),
(8,  8, 103, '2026-03-12', 500,  'Paid'),
(9,  9, 104, '2026-03-20', 0,    'Paid'),
(10, 10,106, '2026-04-02', 1000, 'Paid'),
(11, 11,105, '2026-04-10', 0,    'Paid'),
(12, 12,106, '2026-04-15', 0,    'Pending'),
(13, 1, 104, '2026-04-22', 1000, 'Paid'),
(14, 2, 101, '2026-05-03', 500,  'Paid'),
(15, 13,103, '2026-05-11', 0,    'Cancelled');

select * from students;
select * from instructors;
select * from courses;
select * from enrollments;

-- Q1. Show all enrollments where the status is 'Paid'.
select * 
from enrollments
where status = 'Paid';

-- Q2. Show the top 5 most expensive enrollments by fee, highest first.
select e.enrollment_id, e.student_id, e.course_id, c.base_fee, e.discount, (c.base_fee - e.discount) as net_fee 
from enrollments e
inner join courses c
on e.course_id=e.course_id
order by base_fee desc
limit 5;

-- Q3. Show the 3 most recent enrollments by enroll_date.
select * 
from enrollments
order by enroll_date desc
limit 3;

-- Q4. Skip the first 5 rows (ordered by enrollment_id) and show the next 5.
select * 
from enrollments
order by enrollment_id asc
limit 5 offset 5; 

-- Q5. Show enrollments from Hyderabad or Chennai where the discount is greater than 0, sorted by student_name.
select *
from enrollments e
inner join students s
on e.student_id=s.student_id
where s.city in ('Hyderabad', 'Chennai') and e.discount > 0
order by s.student_name;

-- Q6. Show the 2nd highest fee row using only ORDER BY, LIMIT and OFFSET.
select * 
from courses
order by base_fee desc
limit 1 offset 1;

-- Q7. Total fee collected per course ('Paid' only).
select c.course_name, sum(c.base_fee - e.discount) as total_collected
from enrollments e
inner join courses c
on e.course_id = c.course_id
where e.status = 'Paid'
group by c.course_id, c.course_name
order by total_collected desc;

-- Q8. Number of enrollments per city.
select s.city, count(*) as total_enrollments 
from enrollments e
inner join students s
on e.student_id = s.student_id
group by s.city;

-- Q9. Courses that have more than 2 enrollments.
select c.course_name, count(*) as enrollments_num
from enrollments e
inner join courses c
on e.course_id = c.course_id
group by c.course_name
having enrollments_num > 2;

-- Q10. Cities whose total net fee is more than 20,000.
select s.city, sum(c.base_fee - e.discount) as net_fee
from enrollments e
inner join students s
on e.student_id = s.student_id
inner join courses c
on e.course_id = e.course_id
group by s.city
having net_fee > 20000;

-- Q11. Instructors whose average fee is above 9,000, highest average first.
select i.instructor_name, avg(c.base_fee) as avg_fee
from instructors i
inner join courses c
on i.instructor_id = c.instructor_id
group by instructor_name
having avg_fee > 9000
order by avg_fee desc;

-- 12. Students who enrolled in more than one course.
select s.student_name, count(e.course_id) as enrolled
from students s
inner join enrollments e
on s.student_id = e.student_id
group by s.student_name
having enrolled > 1;

-- 13. Enrollments where the fee is higher than the average fee.
select c.base_fee
from enrollments e
inner join courses c
on e.course_id = c.course_id
where c.base_fee > (
select avg(base_fee) as avg_fee
from courses);

-- 14. Student(s) with the maximum fee, without LIMIT.
select s.student_name, c.base_fee
from students s
inner join enrollments e
on s.student_id = e.student_id
inner join courses c
on e.course_id = c.course_id
where c.base_fee = (
select max(c.base_fee) from courses);  

-- Q15. Enrollments in courses taught by the instructor who teaches 'Data Science' (use IN).
select *
from enrollments
where course_id in (
select course_id 
from courses
where instructor_id = (
select instructor_id
from courses 
where course_name = 'Data Science'));

-- Q16. Students whose discount is greater than their own city's average discount (correlated subquery).
select e.enrollment_id, s.student_name, s.city, e.discount
from enrollments e
inner join students s
on e.student_id = s.student_id
where e.discount > (
select avg(e2.discount) 
from enrollments e2
join students s2
on e2.student_id = s2.student_id
where s2.city = s.city);

-- Q17. Students with at least one 'Cancelled' enrollment (use EXISTS).
select s.student_name 
from students s
where exists (
select * 
from enrollments e
where e.student_id = s.student_id and e.status = 'Cancelled');

-- Q18. Students who never had a 'Cancelled' enrollment (use NOT EXISTS or NOT IN).
select s.student_name 
from students s
where not exists (
select * 
from enrollments e
where e.student_id = s.student_id and e.status = 'Cancelled');

-- Q19. Second highest fee using a subquery, without LIMIT or OFFSET.
select *
from courses 
where base_fee = (
select max(base_fee)
from courses
where base_fee < (
select max(base_fee) from courses));

-- Q20. Courses whose total fee is greater than the average of all course totals (subquery in HAVING).
select c.course_name, sum(c.base_fee - e.discount) as total_net
from courses c
inner join enrollments e 
on c.course_id = e.course_id
group by c.course_id, c.course_name
having sum(c.base_fee - e.discount) > (
select avg(tot)
from (
select sum(c2.base_fee - e2.discount) as tot
from courses c2
inner join enrollments e2 on c2.course_id = e2.course_id
group by c2.course_id) as course_totals);

-- Q21. City with the highest total net fee (subquery in FROM).
select city, total_net
from (
select s.city, sum(c.base_fee - e.discount) as total_net
from enrollments e
inner join students s 
on e.student_id = s.student_id
inner join courses c 
on e.course_id = c.course_id
group by s.city) as city_totals
where total_net = (
select max(total_net)
from (
select sum(c.base_fee - e.discount) as total_net
from enrollments e
inner join students s on e.student_id = s.student_id
inner join courses c on e.course_id = c.course_id
group by s.city) as t);

-- Q22. Enrollments whose fee is greater than every 'Marketing' category fee (use ALL).
select e.*, c.base_fee
from enrollments e
inner join courses c 
on e.course_id = c.course_id
where c.base_fee > all (
select base_fee
from courses
where course_category = 'Marketing');

-- Q23. Pairs of different students who live in the same city (self join, no duplicate pairs).
select s1.student_id as id1, s1.student_name as name1, s2.student_id as id2, s2.student_name as name2, s1.city
from students s1
join students s2 on s1.city = s2.city and s1.student_id < s2.student_id
order by s1.city, s1.student_id;

-- Q24. Pairs of students who enrolled in the same course (show both names and the course).
select s1.student_name as student1, s2.student_name as student2, c.course_name
from enrollments e1
join enrollments e2 
on e1.course_id = e2.course_id and e1.student_id < e2.student_id
join students s1 
on e1.student_id = s1.student_id
join students s2 
on e2.student_id = s2.student_id
join courses c 
on e1.course_id = c.course_id
order by c.course_name, student1;

-- Q25. Students who enrolled in both 'SQL Basics' and 'Power BI' (self join).
select s.student_id, s.student_name
from students s
join enrollments e1 
on s.student_id = e1.student_id
join courses c1 
on e1.course_id = c1.course_id and c1.course_name = 'SQL Basics'
join enrollments e2 
on s.student_id = e2.student_id
join courses c2 
on e2.course_id = c2.course_id and c2.course_name = 'Power BI';

-- Q26. For each enrollment, show the student name and another enrollment of the same student with a higher fee.
select e1.enrollment_id as enroll1, s.student_name, c1.base_fee as fee1, e2.enrollment_id as enroll2, c2.base_fee as fee2
from enrollments e1
join students s 
on e1.student_id = s.student_id
join courses c1 
on e1.course_id = c1.course_id
join enrollments e2 
on e1.student_id = e2.student_id and e1.enrollment_id <> e2.enrollment_id
join courses c2 on e2.course_id = c2.course_id
where c2.base_fee > c1.base_fee;

-- Q27. Pairs of enrollments by the same instructor where the first fee is less than the second.
select e1.enrollment_id as e1, c1.base_fee as fee1, e2.enrollment_id as e2, c2.base_fee as fee2, i.instructor_name
from enrollments e1
join courses c1 
on e1.course_id = c1.course_id
join enrollments e2 
on e1.enrollment_id < e2.enrollment_id
join courses c2 
on e2.course_id = c2.course_id
join instructors i 
on c1.instructor_id = i.instructor_id
where c1.instructor_id = c2.instructor_id and c1.base_fee < c2.base_fee;

-- Q28. CROSS JOIN distinct cities and categories, then LEFT JOIN to find combinations with no enrollments.
select cities.city, cats.course_category
from (
select city 
from students) as cities
cross join (
select course_category 
from courses) as cats
left join (
select s.city, c.course_category
from enrollments e
join students s 
on e.student_id = s.student_id
join courses c 
on e.course_id = c.course_id) as existing
on cities.city = existing.city and cats.course_category = existing.course_category
where existing.city is null;

-- Q29. Top 3 courses by total net fee ('Paid' only), skipping the first one (GROUP BY, ORDER BY, LIMIT, OFFSET).
select c.course_id, c.course_name, sum(c.base_fee - e.discount) as total_net
from enrollments e
join courses c 
on e.course_id = c.course_id
where e.status = 'Paid'
group by c.course_id, c.course_name
order by total_net desc
limit 3 offset 1;

-- Q30. Cities where the number of 'Paid' enrollments is above the average paid enrollments per city, ordered by city, first 2 rows only (subquery with HAVING).
select s.city, count(*) as paid_count
from enrollments e
join students s 
on e.student_id = s.student_id
where e.status = 'Paid'
group by s.city
having count(*) > (
select avg(cnt)
from (
select count(*) as cnt
from enrollments e2
join students s2 on e2.student_id = s2.student_id
where e2.status = 'Paid'
group by s2.city) as city_counts)
order by s.city
limit 2;