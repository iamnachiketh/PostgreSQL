CREATE OR REPLACE PROCEDURE update_salary_dept(
edept VARCHAR,
sal DECIMAL
)
AS $$
	BEGIN 
		UPDATE employees
		SET salary = salary * sal
		WHERE dept = edept;
	END
$$ LANGUAGE plpgsql


CALL update_salary_dept('IT', 0.5);

DROP PROCEDURE update_salary_dept;

SELECT * FROM employees;

