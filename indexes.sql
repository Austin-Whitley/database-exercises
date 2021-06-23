USE employees;

#Indexes, also referred to as indices, are used to optimize queries and ensure integrity of data.

SHOW INDEXES from employees;

# Lets say I want to view some salary information
SELECT salary FROM salaries WHERE salary BETWEEN 50000 AND 70000;

ALTER TABLE salaries ADD INDEX salary_index(salary);

USE codeup_test_db;

CREATE TABLE quotes2 (
    id INT NOT NULL AUTO_INCREMENT,
    content VARCHAR(240) NOT NULL,
    author VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE quotes2 ADD UNIQUE (content);

INSERT INTO quotes2 (content, author)
VALUES ('The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.', 'Rando on Twitter');

USE employees;

DROP INDEX salary_index ON salaries;

USE codeup_test_db;

ALTER TABLE albums ADD UNIQUE unique_artist_and_name (artist, name);

ALTER TABLE albums DROP INDEX unique_artist_and_name;