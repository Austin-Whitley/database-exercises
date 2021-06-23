USE employees;

SELECT employees.last_name, salaries.salary
FROM employees JOIN salaries
on employees.emp_no = salaries.emp_no
LIMIT 50;