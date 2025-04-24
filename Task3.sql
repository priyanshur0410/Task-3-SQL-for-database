create database employe;

use employe;

create table employees( 
emp_no INT PRIMARY KEY,
birth_date DATE,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(1),
hire_date DATE
);

CREATE TABLE SALARIES(
salary INT,
from_date DATE,
to_date DATE,
employ_no INT,
FOREIGN KEY (employ_no) references employees(emp_no)
);
replace into employees(emp_no ,first_name , last_name)
values (102,'aman','chauhan');

 

select * from salaries;
select * from employees;
insert into salaries values(9000,'2003-10-2','2005-12-3');
insert into employees values('2003-10-13','prakul','chauhan','m','2012-09-02');
select e.* ,s.* from employees as e  right JOIN salaries as s
 on e.emp_no = s.emp_no;
 update employees set  gender = 'M' , birth_date='2003-10-21',hire_date ='2024-10-25' where emp_no = 102;
update employees set hire_date ='2024-10-25' where emp_no=101;

-- 1. Active customers in 2023 (placed ≥2 orders)
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY customer_id
HAVING COUNT(order_id) >= 2
ORDER BY order_count DESC;

-- 2. Top-selling products by revenue
SELECT p.product_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;