USE employees;

--how we would grab data normally
SELECT * FROM employees WHERE birth_date LIKE '1954-01%';
-- this is messy, unorganised data... lets make it nice and ordered so we can filter
--through it more easily

--we will use the ORDER BY clause
SELECT * FROM employees WHERE birth_date LIKE '1954-01%' ORDER BY birth_date;

-- we can organise the organised order ;P add an extra variable to the ORDER BY clause
--anyone with the same birthday will be ordered by first name(alphabetically)
SELECT * FROM employees WHERE birth_date LIKE '1954-01%' ORDER BY birth_date, first_name;

--chain the ORDER BY clause by adding a comma
SELECT first_name, last_name FROM employees ORDER BY last_name DESC, first_name ASC;
