USE employees;

-- Part ONE:
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT * FROM employees WHERE last_name LIKE 'E%';

SELECT * FROM employees WHERE last_name LIKE '%q%';

--Part TWO:
SELECT * FROM employees WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';

--Show only the Males with these names (long horrible way)
-- SELECT * FROM employees WHERE first_name = 'Irena' AND gender = 'M'
-- OR first_name = 'Vidya' AND gender = 'M'
-- OR first_name = 'Maya' AND gender = 'M';

-- Short example (better way)
SELECT * FROM employees
WHERE (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya') AND gender = 'M';

--starts or ends with E
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

--starts AND ends with E
SELECT * FROM employees WHERE last_name LIKE 'E%E';

--with Q but not QU
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';