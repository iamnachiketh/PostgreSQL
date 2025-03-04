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


-- Advance Joins

CREATE TABLE drivers 
	(driver_no SERIAL PRIMARY KEY,
	driver_name VARCHAR,
	team_name VARCHAR,
	FOREIGN KEY (team_name) REFERENCES teams(team_name)
	);

CREATE TABLE teams 
	(team_name VARCHAR PRIMARY KEY,
	driver_count INT
	);

CREATE TABLE cars 
	(car_no SERIAL PRIMARY KEY,
	driver_no SERIAL,
	car_name VARCHAR,
	FOREIGN KEY (driver_no) REFERENCES drivers(driver_no)
	);

CREATE TABLE winners 
	(team_name VARCHAR,
	win_year INT,
	FOREIGN KEY (team_name) REFERENCES teams(team_name)
	);

INSERT INTO teams VALUES 
	('oracle redbull racing',2),
	('scudarea ferrari',2),
	('mclaren',2),
	('mercedes amg petronas',2),
	('aston martin',2),
	('cadilac',2),
	('audi',2),
	('haas',2),
	('alpine',2),
	('williams',2),
	('visa cash app redbull',2);

INSERT INTO drivers(driver_name, team_name) VALUES
	('max verstappen','oracle redbull racing'),
	('liam lawson','oracle redbull racing'),
	('lando norris','mclaren'),
	('oscar piastri','mclaren'),
	('george russell','mercedes amg petronas'),
	('kimi antonelli','mercedes amg petronas'),
	('charles leclerc','scudarea ferrari'),
	('lewis hamilton','scudarea ferrari'),
	('fernando alonso','aston martin'),
	('stroll','aston martin'),
	('oliver bearman','haas'),
	('nico hulkenberg','haas'),
	('pierre gasly','alpine'),
	('esteban ocon','alpine'),
	('carlos sainz','williams'),
	('franco colapinto','williams'),
	('yuki tsunoda','visa cash app redbull'),
	('sergio perez','visa cash app redbull');

INSERT INTO cars(driver_no, car_name) VALUES
	(1,'ver'),
	(2,'law'),
	(3,'nor'),
	(4,'pia'),
	(5,'rus'),
	(6,'ant'),
	(7,'lec'),
	(8,'ham'),
	(9,'alo'),
	(10,'str'),
	(11,'bea'),
	(12,'hul'),
	(13,'gas'),
	(14,'oco'),
	(15,'sai'),
	(16,'col'),
	(17,'tsu'),
	(18,'per');

INSERT INTO winners(team_name, win_year) VALUES
	('mercedes amg petronas',2014),
	('mercedes amg petronas',2015),
	('mercedes amg petronas',2016),
	('mercedes amg petronas',2017),
	('mercedes amg petronas',2018),
	('mercedes amg petronas',2019),
	('mercedes amg petronas',2020),
	('mercedes amg petronas',2021),
	('oracle redbull racing',2022),
	('oracle redbull racing',2023),
	('mclaren',2024);

-- Inner join

SELECT 
    d.driver_name, 
    t.team_name, 
    c.car_name 
FROM 
    drivers d
INNER JOIN 
    teams t ON d.team_name = t.team_name
INNER JOIN 
    cars c ON d.driver_no = c.driver_no;

-- Left join

SELECT 
    t.team_name, 
    d.driver_name 
FROM 
    teams t
LEFT JOIN 
    drivers d ON t.team_name = d.team_name;

-- Right join

SELECT 
    d.driver_name, 
    t.team_name 
FROM 
    drivers d
RIGHT JOIN 
    teams t ON d.team_name = t.team_name;

-- Full outer join

SELECT 
    t.team_name, 
    d.driver_name 
FROM 
    teams t
FULL OUTER JOIN 
    drivers d ON t.team_name = d.team_name;

-- Cross join

SELECT 
    d.driver_name, 
    c.car_name 
FROM 
    drivers d
CROSS JOIN 
    cars c;

-- Self join

SELECT 
    d1.driver_name AS driver_1, 
    d2.driver_name AS driver_2, 
    d1.team_name 
FROM 
    drivers d1
INNER JOIN 
    drivers d2 ON d1.team_name = d2.team_name
WHERE 
    d1.driver_no != d2.driver_no and d1.driver_no < d2.driver_no;

-- Natural join

SELECT 
    driver_name, 
    team_name 
FROM 
    drivers 
NATURAL JOIN 
    teams;

-- Combination of multiple joins

SELECT 
    w.win_year, 
    t.team_name, 
    d.driver_name, 
    c.car_name 
FROM 
    winners w
INNER JOIN 
    teams t ON w.team_name = t.team_name
INNER JOIN 
    drivers d ON t.team_name = d.team_name
INNER JOIN 
    cars c ON d.driver_no = c.driver_no
WHERE 
    w.win_year = 2023;

-- Join with aggregation

SELECT 
    t.team_name, 
    COUNT(d.driver_no) AS driver_count 
FROM 
    teams t
LEFT JOIN 
    drivers d ON t.team_name = d.team_name
GROUP BY 
    t.team_name;

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



