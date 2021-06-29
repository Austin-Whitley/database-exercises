USE employees;

#Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT CONCAT(first_name, ' ', last_name), hire_date FROM employees
WHERE hire_date IN (SELECT hire_date FROM employees WHERE emp_no = 101010);

#Find all the titles held by all employees with the first name Aamod.
SELECT title FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod');
# ^ (in plain english) -- select every title if the employee number matches the employee number of the people with the first name 'Aamod'.

# Find all the current department managers that are female.
SELECT CONCAT(first_name, ' ', last_name), gender FROM employees
WHERE gender = 'F' AND emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date LIKE '9999%'); # we could also use: "WHERE to_date > NOW()"

SELECT dept_name FROM departments
WHERE dept_no IN (SELECT dept_no FROM dept_manager
WHERE to_date > NOW() AND emp_no IN(SELECT emp_no FROM employees WHERE gender = 'F'));

SELECT first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    WHERE salary = (
        SELECT MAX(salary)
        FROM salaries));
