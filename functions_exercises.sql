USE employees;

SELECT CONCAT(first_name, ' ', last_name) FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

SELECT * FROM employees
WHERE DAY(birth_date) = 25
AND MONTH(birth_date) = 12;

SELECT * FROM employees
WHERE DAY(birth_date) = 25
AND MONTH(birth_date) = 12
AND YEAR(hire_date) LIKE '199%'
ORDER BY birth_date, hire_date DESC;

SELECT *, DATEDIFF(hire_date, CURDATE()) FROM employees
WHERE DAY(birth_date) = 25
AND MONTH(birth_date) = 12
AND YEAR(hire_date) LIKE '199%'

-- Part ONE:
-- SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;

--in descending order
-- SELECT * FROM employees WHERE last_name LIKE '%E%' ORDER BY emp_no DESC;

