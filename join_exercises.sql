USE join_test_db;

#==============JOIN EXAMPLE DATABASE CREATION AND MANIPULATION===================

# first we must create the tables we want to join:
# create a new table named roles that will hold an id and a name
CREATE TABLE roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

#next create a table named users that will hold and id, name, email, and role id
CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);
# populate the roles table with roles we can use to assign to people later
INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

# populate the users table with userInfo and use the ID of the roles we just added to our other table
INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

#english reading of the line bellow:
#print the name of a user if they are inside the user TABLE. Using the role_id associated with that user's name
#test if it will equal an ID from the roles TABLE then (if they are equal) print out that role to the right of the user's name
SELECT u.name, r.name FROM users u JOIN roles r ON u.role_id = r.id;

#Use a left join so we can see everyone's name regardless of if they have a role
#(literally just add the word LEFT before 'JOIN')
SELECT u.name, r.name FROM users u LEFT JOIN roles r ON u.role_id = r.id;
#We see more with this join because there are more users than there are roles. And we just gave precedence to the USERS table

#right join will show every role, even if someone isn't assigned because now it has precedence;
SELECT u.name, r.name FROM users u RIGHT JOIN roles r ON u.role_id = r.id;

#join the two tables, using the COUNT operator to list how many users share the same role
SELECT COUNT(u.role_id) AS 'Total roles', r.name AS 'Role' FROM users u JOIN roles r on r.id = u.role_id GROUP BY role_id;

#===================EMPLOYEES DATABASE===================
USE employees;

#use this format to create the correct output for the the exercise examples:
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;
# The above code outputs as:
#+----------------+-------------+
#| full_name      | dept_name   |
#+----------------+-------------+
#| Georgi Facello | Development |
#+----------------+-------------+

#write a query that shows each department along with the name of the current manager
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no WHERE dm.to_date LIKE '9%' 10;

#Find the name of all departments currently managed by women.