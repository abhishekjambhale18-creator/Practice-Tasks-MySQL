create database clg;

use clg;

-- ---------- Student ----------
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    city       VARCHAR(50)
);
 
INSERT INTO Student (student_id, name, city) VALUES
(1, 'Asha',  'Pune'),
(2, 'Ravi',  'Mumbai'),
(3, 'Meera', 'Pune'),
(4, 'Kiran', 'Nagpur'),
(5, 'Sana',  'Mumbai'),
(6, 'Dev',   'Pune');
 
-- ---------- Course ----------
CREATE TABLE Course (
    course_id       VARCHAR(5) PRIMARY KEY,
    course_name     VARCHAR(50) NOT NULL,
    duration_months INT,
    total_fee       INT
);
 
INSERT INTO Course (course_id, course_name, duration_months, total_fee) VALUES
('C1', 'SQL',      2, 15000),
('C2', 'Excel',    1,  8000),
('C3', 'Python',   3, 25000),
('C4', 'Power BI', 2, 18000);
 
-- ---------- Enrollment ----------
CREATE TABLE Enrollment (
    enroll_id   VARCHAR(5) PRIMARY KEY,
    student_id  INT        NOT NULL,
    course_id   VARCHAR(5) NOT NULL,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);
 
INSERT INTO Enrollment (enroll_id, student_id, course_id, enroll_date) VALUES
('E1', 1, 'C1', '2026-01-10'),
('E2', 1, 'C2', '2026-02-05'),
('E3', 2, 'C1', '2026-01-15'),
('E4', 3, 'C3', '2026-02-01'),
('E5', 3, 'C1', '2026-02-10'),
('E6', 4, 'C2', '2026-03-01'),
('E7', 5, 'C3', '2026-03-05'),
('E8', 2, 'C3', '2026-03-12');
 
-- ---------- Fee ----------
CREATE TABLE Fee (
    fee_id       VARCHAR(5) PRIMARY KEY,
    enroll_id    VARCHAR(5) NOT NULL,
    amount_paid  INT,
    payment_date DATE,
    mode         VARCHAR(10),
    FOREIGN KEY (enroll_id) REFERENCES Enrollment(enroll_id)
);
 
INSERT INTO Fee (fee_id, enroll_id, amount_paid, payment_date, mode) VALUES
('F1', 'E1', 15000, '2026-01-10', 'UPI'),
('F2', 'E2',  4000, '2026-02-05', 'Cash'),
('F3', 'E2',  4000, '2026-02-20', 'UPI'),
('F4', 'E3', 10000, '2026-01-15', 'Card'),
('F5', 'E4', 25000, '2026-02-01', 'UPI'),
('F6', 'E5', 15000, '2026-02-10', 'Cash'),
('F7', 'E6',  8000, '2026-03-01', 'Card'),
('F8', 'E7', 12000, '2026-03-05', 'UPI');
 
-- ---------- Quick check ----------
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Fee;

-- 1.
select s.name, c.course_name 
from student s
inner join enrollment e 
on s.student_id=e.student_id
inner join course c
on e.course_id=c.course_id;

-- 2. 
select s.name, e.enroll_date
from student s
inner join enrollment e
on s.student_id=e.student_id;

-- 3. 
select c.course_name, e.enroll_date
from course c
inner join enrollment e
on c.course_id=e.course_id;

-- 4.
select s.name, c.course_name
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join course c
on c.course_id=e.course_id;

-- 5.
select e.enroll_id, f.amount_paid
from enrollment e
inner join fee f
on e.enroll_id=f.enroll_id;

-- 6.
select s.name, f.amount_paid
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on e.enroll_id=f.enroll_id;

-- 7. Show the student name and enroll_date for every enrollment
select s.name, e.enroll_date
from student s
inner join enrollment e
on s.student_id=e.student_id;

-- 8. Show the course_name and enroll_date for every enrollment.
select c.course_name, e.enroll_date
from course c
inner join enrollment e
on c.course_id=e.course_id;

-- 9. Show the student name and course_name for every enrollment.
select s.name, c.course_name
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join course c
on c.course_id=e.course_id;

-- 10. Show the enroll_id and amount_paid for every payment.
select e.enroll_id, f.amount_paid
from enrollment e
inner join fee f
on e.enroll_id=f.enroll_id;

-- 11. Show the student name and amount_paid for every payment.
select s.name, f.amount_paid
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on e.enroll_id=f.enroll_id;

-- 12. Show the course_name and total amount_paid for every payment.
select c.course_name, sum(f.amount_paid)
from course c
inner join enrollment e
on c.course_id=e.course_id
inner join fee f
on e.enroll_id=f.enroll_id
group by course_name;

-- 13. Show the student name, course_name and amount_paid for every payment .
select s.name, c.course_name, f.amount_paid
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join course c
on e.course_id=e.course_id
inner join fee f
on e.enroll_id=f.enroll_id;

-- 14. Show all students with the courses they enrolled in, including students who have not enrolled anywhere.
select s.name, c.course_name
from student s
left join enrollment e
on s.student_id=e.student_id
left join course c
on e.course_id=e.course_id;

-- 15. Show all courses with the names of students enrolled, including courses that have no students.
select s.name, c.course_name
from student s
inner join enrollment e
on s.student_id=e.student_id
right join course c
on e.course_id=c.course_id;

-- 16. Show every enrollment with its payments, including enrollments that have no payment yet.
select e.enroll_id, f.amount_paid
from fee f
right join enrollment e
on f.enroll_id=e.enroll_id;

-- 17
select s.name, s.city, c.course_name
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join course c
on c.course_id=e.course_id
where s.city="pune" and c.course_name="SQL";

-- 18
select s.name, sum(f.amount_paid) as total_fees
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on e.enroll_id=f.enroll_id
group by s.name
order by total_fees desc
limit 1;

-- 19
select c.course_name, count(s.student_id) as total_students
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join course c
on e.course_id=c.course_id
group by c.course_name
order by total_students desc;

-- 20
select s.name, count(f.course_name) as course_count
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on e.enroll_id=f.enroll_id
group by s.name
having count(c.course_name)>1;

-- 21
select c.course_name, sum(f.amount_paid) as fees_paid
from course c
inner join enrollment e
on c.course_id=e.course_id
inner join fee f
on e.enroll_id=f.enroll_id
group by c.course_name
having sum(f.amount_paid)>20000;

-- 22
select f.mode, sum(f.amount_paid) as total_amount
from fee f
inner join enrollment e
on f.enroll_id=e.enroll_id
group by f.mode
order by total_amount desc;

-- 23
select c.course_name, e.enroll_id 
from course c
left join enrollment e
on c.course_id=e.course_id
where e.enroll_id is null;

-- 24
select s.city, sum(f.amount_paid) as total_amount
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on f.enroll_id=e.enroll_id
group by s.city
having total_amount>15000;

-- 25
select s.name, sum(f.amount_paid) as total_fees
from student s
inner join enrollment e
on s.student_id=e.student_id
inner join fee f
on e.enroll_id=f.enroll_id
group by s.name
order by sum(f.amount_paid) desc
limit 3;