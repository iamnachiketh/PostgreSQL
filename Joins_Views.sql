CREATE TABLE dept(
	deptname VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO dept (deptname)
VALUES
('HR'),
('IT'),
('Finance'),
('Security');

ALTER TABLE dept
RENAME COLUMN deptname TO dept;
-- Joins
-- used to fetch data from multiple tables simultaneously

-- types
-- cross join
-- used to retrive data from multiple tables, it returns data in the form nxn

SELECT * FROM employees
CROSS JOIN dept;

-- inner join
-- used to retrive data from multiple table when there is matching values in col common to all the tables

SELECT * FROM employees e
INNER JOIN dept d
ON e.dept = d.dept;

-- Natural join

SELECT * FROM employees 
NATURAL JOIN dept;

-- Self join
-- Used to join self table self col multiple times
-- when that col has multiple data

SELECT e1.fname AS employee1, e2.fname AS employee2
FROM employees e1
JOIN employees e2
ON e1.dept = e2.dept
AND e1.empid != e2.empid;

-- Outer join
-- return matched , unmatched records and null values from 2 tables
-- left
-- from left table

SELECT * FROM employees e
LEFT JOIN dept d
ON e.dept = d.dept;

-- right
-- from right table

SELECT * FROM employees e
RIGHT JOIN dept d
ON d.dept = e.dept;

-- full outer

SELECT * FROM employees e
FULL OUTER JOIN dept d
ON e.dept = d.dept;

-- Views
-- views is logical stucture of a table, doesnt require space, used to achieve abstraction.

CREATE VIEW matching_dept AS 
SELECT e.fname, e.lname, e.hdate, e.dept, e.salary FROM employees e
INNER JOIN dept d
ON e.dept = d.dept
ORDER BY e.salary ASC;

SELECT * FROM matching_dept;

-- Materialized view 
-- this creates a physical view which takes space in database.

CREATE MATERIALIZED VIEW mat_high_salary_employees AS
SELECT fname, lname, salary
FROM employees
WHERE salary > 75000;

SELECT * FROM mat_high_salary_employees;



