USE employees;

-- format for the limit clause:
-- SELECT columns FROM table LIMIT count [OFFSET count];

SELECT * FROM employees
WHERE birth_date
LIKE '1954-01%'
ORDER BY birth_date, last_name
LIMIT 20;

-- we can also add an OFFSET to determine which row we want to start on
--each number in offset == one line so this v says to skip 40 employees then start printing
SELECT * FROM employees
WHERE birth_date
LIKE '1954-01%'
ORDER BY birth_date, last_name
LIMIT 20 OFFSET 40;

-- to only return unique results use the DISTINCT keyword in this format:
-- SELECT DISTINCT title FROM titles;