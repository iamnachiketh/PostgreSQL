-- DQL(data query language)

-- Projection
-- retrieve data from columns.

SELECT fname, lname, dept FROM employees;

-- DISTINCT 
-- Clause used to return distinct values

-- EXPRESSION 
-- combination of operators and operands

-- ALIAS
-- alternative name given to a col/exp

SELECT DISTINCT dept as dept FROM employees;


-- Selection
-- Retrieve from both rows and col.

SELECT * FROM employee
WHERE salary > 70000;


-- Operators

-- 1. Arithmetic operators

SELECT salary+10, salary-10, salary/10, salary*2 FROM employees;

-- 2. Relational

SELECT first_name, salary>60000, salary=60000 from employees;

-- 3. Logical

SELECT salary, fname from employees where salary>60000 and salary<70000;

SELECT salary, fname from employees where salary>60000 or salary<70000;

-- 4. Assignment

SELECT fname, lname from employees where salary=60000;

-- 5. Concatenation

SELECT fname||name from employees where salary=60000;

-- 6. Special operators
--     in
--     It accepts multiple values at rhs and single value at lhs

   	SELECT * from employees where salary in (60000,62000);

--     not in

	SELECT * from employees where salary not in (60000,62000);

--     -  like 
--     Used for pattern matching 

    SELECT * FROM employee WHERE fname LIKE 'A%';

--     - not like

    SELECT * FROM employees WHERE fname NOT LIKE 'A%';

--     - between
--     Used with range of values
--     COL/EXP BETWEEN LOW-RANGE AND HIGH-RANGE

    SELECT * FROM employees WHERE salary BETWEEN 60000 and 70000;

--     - not between

    SELECT * FROM employees WHERE salary NOT BETWEEN 60000 and 70000;

--     - is

	SELECT * FROM employees WHERE salary IS NULL;

--     - is not

	SELECT * FROM employees WHERE salary IS NOT NULL;


-- Set
-- used to merge more than one query.

-- union - merge and get unique data

SELECT fame, lname, dept FROM employees
WHERE dept = 'HR';
UNION
SELECT fname, lname, dept FROM employees
WHERE salary > 70000;

-- union all - merge and get all data

SELECT fname, lname, dept FROM employee
WHERE dept = 'HR';
UNION ALL
SELECT fname, lname, dept FROM employees
WHERE salary > 70000;

-- intersect - returns only common

SELECT fname, lname, dept FROM employees
WHERE dept = 'HR';
INTERSECT
SELECT fname, lname, dept FROM employees
WHERE salary > 70000;

-- Subquery

-- any - used instead of in as =any

SELECT fname, salary FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE dept = 'HR');

-- all -we cannot use multiple values at rhs while using relational operators so we use >all or<all

SELECT fname, salary FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE dept = 'HR');

-- exists 

SELECT * FROM employees WHERE EXISTS (SELECT 1 FROM employees b WHERE a.empid = b.empid);

-- not exists

-- Functions
-- Block of code used to perform specific task.

-- Types

-- -Single row function
-- Takes n input provides n output.
 
-- -character SRF

-- UPPER('ARG') - all caps

-- LOWER('ARG') - all small

-- INITCAP('ARG') - only first letter caps.

-- SUBSTR(OS,POS,LENG) - to extract string or letter. 

SELECT fname, SUBSTR(fname, 1, 3) AS short_name FROM employees;

-- REPLACE(OS,SUBS,NEWS) - to remove a string or char from original string and replace it with new string or character.

SELECT fname, REPLACE(fname, 'a', 'X') AS replaced_name FROM employees;

-- REGEXP_REPLACE(OS,[LETTERS]) remove all letters in the string.

SELECT fname, REGEXP_REPLACE(fname, '[aeiou]', '*', 'g') AS masked_name FROM employees;

-- REGEXP_REPLACE(OS,[^LETTERS]) remove string except the letters.

-- TRIM(LEADING/TRAILING/BOTH CHAR FROM OS) - to remove first/last/both letter from a string.

SELECT TRIM('   Alice   ') AS trimmed_name;

-- POSITION(subs IN original string) to find the nth occurance of a char/string in original string.

SELECT fname, POSITION('o' IN fname) AS position FROM employees;

-- CONCAT(ARG1,ARG2) - to concat more than 2 arg.

SELECT fname, POSITION('o' IN fname) AS position FROM employees;

-- REVERSE('SRT') - to reverse the string or value.

SELECT fname, REVERSE(fname) AS reversed_name FROM employees;

-- number SRF

-- MOD(DIVIDEND,DIVISOR) - this gives reminder value.

SELECT salary, MOD(salary, 10000) AS remainder FROM employees;

-- POWER(NUMBER,POWER VALUE) - returns nth power of a number.

SELECT POWER(salary, 2) AS squared_salary FROM employees;

-- SQRT(NUMBER) - returns square root of number.

SELECT SQRT(salary) AS salary_root FROM employees;

-- ROUND(NUMBER,SCALE) - to round of a number.
-- After point - starts with 0
-- Before point - starts with -1 
-- If n is b/w 0-4 then round off to 0
-- If n is b/w 5-9 then round off to 0 with increment of previous number

SELECT ROUND(salary, -3) AS rounded_salary FROM employees;

-- TRUNC(NUMBER,SCALE) - round of a floating point value to it's minimum value. Same as round but 0-9 round off to 0 with no increment

SELECT TRUNC(salary, -3) AS truncated_salary FROM employees;

-- date SRF

-- INTERVAL 'time'

SELECT hdate, hdate + INTERVAL '6 months' AS six_months_later FROM employees;

-- EXTREACT(DAYS/MONTHS/YEAR FROM AGE(date))

SELECT fname, EXTRACT(MONTH FROM AGE(hdate)) AS months_since_hire FROM employees;

-- general SRF

-- COALESCE(ARG1,ARG2) - replace null values in arg1 with arg2 else print arg1

-- ALTER TABLE employees ADD COLUMN email VARCHAR(100);
SELECT fname, COALESCE(email, 'No Email') AS email_status FROM employees;

-- multi row function
-- Takes n input provides 1 output

-- MAX(ARG)

SELECT MAX(salary) AS max_salary FROM employees;

-- MIN(ARG)

SELECT MIN(salary) AS min_salary FROM employees;

-- AVG(ARG)

SELECT AVG(salary) AS avg_salary FROM employees;

-- SUM(ARG)

SELECT SUM(salary) AS total_salary FROM employees;

-- COUNT(*/COLN)

SELECT COUNT(*) AS total_employees FROM employees;

-- Group by
-- Used to group the records
-- Can only use MRF or group by coln in select

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept;

-- Having
-- To give cond to group by
-- Can only use MRF and cond related to group by col

SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
HAVING AVG(salary) > 70000;

-- Order by
-- Used to sort record in ascending or descending

SELECT * FROM employees
ORDER BY salary DESC;
