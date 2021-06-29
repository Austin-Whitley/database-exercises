Use employees;

SELECT first_name, last_name, birth_date FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager) LIMIT 10;
#We first make a top level query for first name, last name, birth date from the employees list:
#    SELECT first_name, last_name, birth_date FROM employees
#Then we force some kind of restriction on the top level query with a sub query.
#    WHERE emp_no IN (SELECT emp_no FROM dept_manager)
# That sub query requires the emp_no from employees to match the emp_no from the dept_manager list

# In the following statement we will see that we can stack these queries as high as we want:
# TOP LEVEL: select all department names
SELECT dept_name FROM departments
# SUB QUERY: find the department number inside the manager list
WHERE dept_no IN (SELECT dept_no FROM dept_manager
# SUB SUB QUERY: use the employee numbers from the managers and find them in the employees list IF their name is karsten sigstam
WHERE emp_no IN(SELECT emp_no FROM employees WHERE first_name = 'karsten' AND last_name = 'Sigstam'));

# Go to java.codeup.com and complete the lecture for sub-queries
