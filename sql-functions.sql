USE employees;

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE first_name = 'Maya' ORDER BY last_name;

--select the dates everyone named Maya was hired
SELECT hire_date FROM employees WHERE first_name = 'Maya';

-- what if we just want the Day? For Date strings, we can also use YEAR() or MONTH()
SELECT DAY(hire_date) FROM employees WHERE first_name = 'Maya';

--lets organise this jumbled mess:
SELECT DAY(hire_date) FROM employees WHERE first_name = 'Maya' ORDER BY DAY(hire_date);

SELECT DATEDIFF(0000-01-12, 0001-02-11);
