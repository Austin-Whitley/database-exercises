USE employees;

SELECT * FROM employees WHERE hire_date = '1985-01-01';

-- We can use the LIKE keyword to look for strings that contain 'sus' % signs are wildcards;
SELECT first_name FROM employees WHERE first_name LIKE '%sus%';

-- We can search for a range of numbers by using the BETWEEN keyword with the AND keyword
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

-- If we want to search for a group of names, we can create a SET using the keyword IN like so:
SELECT emp_no, first_name, last_name FROM employees
WHERE last_name IN ('Herbner', 'Dredge', 'Lipner', 'Baek');

-- grab everything before a section with the < or > signs
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no < 10026;

-- lets chain together what we learned
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no < 20000
AND last_name IN ('Herber', 'Baek')
OR first_name = 'Shridhar';

SELECT * FROM salaries WHERE salary BETWEEN 50000 AND 100000;
-- or we can say:
SELECT * FROM salaries WHERE NOT salary BETWEEN 50000 AND 100000;

SELECT birth_date FROM employees
WHERE birth_date NOT LIKE '195%';

SELECT birth_date, hire_date FROM employees
WHERE birth_date NOT LIKE '195%'
  AND hire_date NOT LIKE '199%';