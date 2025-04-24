
# Employee Database Management System

A simple SQL database system for managing employee records and salaries, built using MySQL.

---

## 📁 **Database Structure**

### **Tables**
1. **`employees`**  
   Stores employee personal information:
   ```sql
   CREATE TABLE employees(
       emp_no INT PRIMARY KEY,
       birth_date DATE NOT NULL,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       gender VARCHAR(1) NOT NULL,
       hire_date DATE NOT NULL
   );
salaries
Tracks employee salary history:

sql
CREATE TABLE salaries(
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
🛠️ Setup Instructions
1. Prerequisites
MySQL or MariaDB installed.

Database client (e.g., MySQL Workbench, DBeaver, or command-line interface).

2. Database Creation
Run the following SQL commands:

sql
CREATE DATABASE IF NOT EXISTS employe;
USE employe;
-- Then execute the table creation queries (provided above).
3. Sample Data Insertion
Example queries to populate tables:

sql
-- Insert into employees
INSERT INTO employees VALUES
(101, '1985-08-20', 'prakul', 'chauhan', 'M', '2012-09-02'),
(102, '1990-05-15', 'aman', 'chauhan', 'M', '2020-01-01');

-- Insert into salaries
INSERT INTO salaries VALUES
(9000, '2003-10-02', '2005-12-03', 102);
🔍 Key Queries
1. Retrieve All Data
sql
SELECT * FROM employees;
SELECT * FROM salaries;
2. Update Employee Details
sql
UPDATE employees 
SET hire_date = '2024-10-25' 
WHERE emp_no = 101;
3. Join Employees & Salaries
sql
SELECT e.*, s.* 
FROM employees AS e 
RIGHT JOIN salaries AS s ON e.emp_no = s.emp_no;
Shows all salary records, even if employee details are missing.

📊 Sample Outputs
Employees Table
emp_no | birth_date | first_name | last_name | gender | hire_date
---------------------------------------------------------------
101    | 1985-08-20 | prakul    | chauhan   | M      | 2012-09-02
102    | 1990-05-15 | aman      | chauhan   | M      | 2020-01-01
Salaries Table
salary | from_date   | to_date     | emp_no
-------------------------------------------
9000   | 2003-10-02  | 2005-12-03  | 102
JOIN Result
emp_no | birth_date | first_name | ... | salary | from_date   | to_date
-----------------------------------------------------------------------
102    | 1990-05-15 | aman       | ... | 9000   | 2003-10-02  | 2005-12-03
🚀 Next Steps
Add Indexes for faster queries:

sql
CREATE INDEX idx_emp_name ON employees(first_name, last_name);
Expand Functionality:

Add departments and dept_emp tables for department management.

Implement triggers for salary history auditing.

Data Validation:

Add constraints (e.g., CHECK(gender IN ('M', 'F'))).
