USE employees;

-- this will return the number of rows in a table
SELECT COUNT(*) FROM employees;

-- this will present two numbers, one for M one for F
SELECT COUNT(*), gender FROM employees GROUP BY gender;

-- lets grab a count of the number of repeat last names
SELECT COUNT(*), last_name FROM employees GROUP BY last_name ORDER BY COUNT(*) DESC;

-- count aggregates the data, it forces everything into something like a bar of butter.
-- We have to use the GROUP BY clause to slice through that butter and get nice organised
-- sections.

-- WE can also use the AVERAGE function:
SELECT AVG(DATEDIFF(hire_date, birth_date)/365) FROM employees;
-- This will display the average age our employees were hired at: 31.5 years old

-- WE can also use MAX and MIN to find the largest or smallest piece of info in a list
SELECT MAX(DATEDIFF(hire_date, birth_date)/365) FROM employees;
SELECT MIN(DATEDIFF(hire_date, birth_date)/365) FROM employees;

-- GROUP BY combines duplicates into one single value for each group
-- GROUP BY consolidates rows based on a common column
-- this is going to give us around 450,000 titles. each title for each employee.
SELECT title FROM titles;

-- lets do this but just just show new instances of employees
SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY last_name;

SELECT DISTINCT first_name, last_name FROM employees
WHERE last_name LIKE 'E%e';

SELECT COUNT(last_name), last_name FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name
ORDER BY last_name;

