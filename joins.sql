USE employees;

SELECT employees.last_name, salaries.salary
FROM employees JOIN salaries
on employees.emp_no = salaries.emp_no
LIMIT 50;

USE codeup_test_db;

CREATE TABLE persons (
    person_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (person_id)
);

INSERT INTO persons(first_name, album_id) VALUES ('Olivia', 29), ('Austin', 23), ('Tareq', 15), ('Anaya', 10);

#Joining tables together
SELECT p.first_name, a.name FROM persons p JOIN albums a on p.album_id = a.id;
#Switch the rows from right to left now
SELECT p.first_name, a.name FROM albums a LEFT JOIN persons p on a.id = p.album_id;
# this one shows more data. instead of only showing people that have favorited an album
# we see every album and if that album has a person associated with it they will be displayed

# right join
SELECT p.first_name, a.name FROM persons p RIGHT JOIN albums a on a.id = p.album_id;
# same thing as the first "JOIN"
SELECT p.first_name, a.name FROM albums a Right JOIN persons p on a.id = p.album_id;

CREATE TABLE preferences(
    person_id INT NOT NULL,
    album_id INT NOT NULL
);

INSERT INTO preferences (person_id, album_id) VALUES (1,12), (1,5), (1,22), (1,29), (2,1), (2,31), (2,30), (3,11), (3,26), (3,25);

SELECT * FROM preferences;

# Now i can store a bunch of preferences for users and relate them to that person's ID but i cant see the alubms, just the album ID
# I need to join some tables together so i can view this as useful informations

SELECT p.first_name AS NAME, a.name AS album
FROM persons p
JOIN preferences pf ON p.person_id = pf.person_id
JOIN albums a ON pf.album_id = a.id;

