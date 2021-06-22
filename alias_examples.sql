USE employees;

SELECT MIN(DATEDIFF(hire_date, birth_date)/365) AS 'Youngest employee' FROM employees;

SELECT CONCAT(first_name, ' ', last_name) AS Name,
    DATEDIFF(hire_date, birth_date)/365 AS 'Age on hire'
FROM employees
ORDER BY DATEDIFF(hire_date, birth_date)/365 DESC
LIMIT 50;