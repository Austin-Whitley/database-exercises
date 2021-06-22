USE employees;

-- 1
SELECT DISTINCT title FROM titles;

-- 2
SELECT last_name FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name
ORDER BY last_name;

-- 3
SELECT last_name, first_name FROM employees
WHERE last_name LIKE 'E%e'
  AND first_name LIKE 'E%e'
GROUP BY last_name, first_name
ORDER BY last_name;

-- 4
SELECT last_name FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 5
SELECT COUNT(last_name), last_name FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 6
SELECT COUNT(*), gender FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
GROUP BY gender;
