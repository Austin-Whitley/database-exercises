USE employees;

-- Part ONE:
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

--in descending order
SELECT * FROM employees WHERE last_name LIKE '%E%' ORDER BY emp_no DESC;