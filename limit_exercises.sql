USE employees;

SELECT DISTINCT first_name FROM employees ORDER BY first_name DESC LIMIT 10;

SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 5;

--update to show the "10th page"
SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 5 OFFSET 45;