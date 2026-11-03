create database bookstore_db;
use bookstore_db;

create table customers(
customer_id int,
full_name varchar(100),
email varchar(100),
phone varchar(20),
city varchar(100),
created_date date);

alter table customers add constraint c_pk primary key(customer_id);

create table books(
book_id int,
title varchar(100),
author varchar(50),
category varchar(100),
price float,
stock_qty float);

alter table books add constraint b_pk primary key(book_id);

create table orders(
order_id int,
customer_id int,
foreign key(customer_id) references customers(customer_id),
order_date date,
o_status varchar(100));

alter table orders add constraint o_pk primary key(order_id);

create table order_items(
order_item_id int,
order_id int,
foreign key(order_id) references orders(order_id),
book_id int,
foreign key(book_id) references books(book_id),
quantity float);

alter table customers add column country varchar(100);

alter table order_items add column discount float;

alter table customers modify phone varchar(15);

alter table books rename column stock_qty to stock_quantity;

alter table customers modify full_name varchar(100) not null;

alter table books modify title varchar(100) not null;

alter table books modify price float not null;

alter table orders modify order_date date not null;

alter table customers add constraint unique(email);

alter table books add constraint p_chk check(price>0);

alter table order_items add constraint q_chk check(quantity>0); 

alter table books add constraint sq_chk check(stock_quantity>=0); 

alter table orders alter o_status set default "pending";

alter table customers alter created_date set default (current_date);

insert into customers values(1,"AA BB","aabb@gmail.com","1122334455","pune","2026-05-12","india");

insert into customers values(2,"CC","aabb@gmail.com","9988334455","pune","2026-08-20","india");

insert into books values(1,"book","cdfg","philosophy",-999,5);

insert into orders values(1,4,"2026-08-15","complete");

insert into customers values(3,"abd@gmail.com","9988331155","pune","2026-05-21","india");

delete from customers where customer_id=3;

insert into customers values(2,"BB CC","bbcc@gmail.com","9988774455","nashik","2026-12-09","india");
insert into customers values(3,"CC DD","ccdd@gmail.com","1122331122","maumbai","2025-02-18","india");
insert into customers values(5,"DD EE","ddee@gmail.com","9977664455","nagpur","2025-01-19","india");
insert into customers values(4,"EE FF","eeff@gmail.com","8877664455","nanded","2026-09-10","india");

select * from customers;

insert into books values(11,"B1","James","funny",950,5);
insert into books values(12,"B2","Kalis","biography",1000,2);
insert into books values(13,"B3","Kohli","mindset",1500,18);
insert into books values(14,"B4","Raj","funny",300,6);
insert into books values(15,"B5","Sharma","autobiography",999,8);
insert into books values(16,"B6","Simon","autobiography",799,4),(17,"B7","Luke","Moral",599,10),(18,"B8","Radhika","wellness",749,7),(19,"B9","Viren","biography",559,9),(20,"B10","ross","mindset",579,4);

select * from books;

insert into orders values(21,1,"2025-09-21",default);
insert into orders values(22,2,"2025-03-16","complte");
insert into orders values(23,3,"2025-07-02","incomplete");
insert into orders values(24,2,"2026-03-07","complete");
insert into orders values(25,4,"2026-11-01",default),(26,5,"2026-05-25","complete");

select * from orders;

insert into order_items values(31,21,18,20,20);
insert into order_items values(32,23,12,10,12);
insert into order_items values(33,24,11,12,15);
insert into order_items values(34,22,15,7,9);
insert into order_items values(35,25,17,5,0);
insert into order_items values(36,25,16,25,22),(37,22,13,1,0),(38,26,14,27,25),(39,26,19,11,10),(40,21,20,35,40);

select * from order_items;

update books set price=price*1.10 where category="mindset";

update orders set o_status="shipped" where order_id=21;

update customers set city="banglore" where customer_id=3;