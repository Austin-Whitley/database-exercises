# database design lecture with Jay

USE codeup_test_db;

# =============== Copy and pasted these from the lecture =========================

# We are refactoring the quotes table so we can be a little easier on data storage
# So we are deleting the authors_name and replacing it with an author_ID that we can use to reference another table.
# similar to how the emp_no table was used to link employees to departments and salaries in that database
# we create an author id because it is less taxing (memory wise) to store an integer beside every quote than it would be to store a String.

# New table that stores author name and creates a linked ID for each author
CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(50),
                         last_name  VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id)
);

# populate that table with data like so:
INSERT INTO authors(first_name, last_name) VALUES
('Douglas', 'Adams'),
('Mark', 'Twain'),
('Kurt', 'Vonnegut');

# make sure to delete the old quotes table, since it displayed the author name by every quote
DROP TABLE if exists quotes;

# refactor the table to take in some integer (author_id) instead of a string
CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        content TEXT NOT NULL,
                        author_id INT UNSIGNED NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (author_id) REFERENCES authors (id)
);

# Seeds - We need some number for author_ID and some content for the quote itself, but this is the cool part!
# We dont have to know what the ID is to enter the information. We can select it from another data table and say "give me the ID of the author named 'mark twain' and pass that into the INSERT"
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), # <<< psh that's pretty freaking sweet! You probably already knew you could do this but it blew my mind.
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');

# ============================== End of lecture copy ==============================

# what about sorting quotes into certain topics? Or any type of storing... we can use the author ID to compare our info tables

#--------------------|
# topics             |
#--------------------|
# id INT(primary key)|
# name VARCHAR(50)   |
#--------------------|

DROP TABLE IF EXISTS topics;

# create a description of the table we are creating
CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);

#populate said table with content
INSERT INTO topics(name) VALUES
('Space and Time'),
('Humor'),
('Office Life'),
('Hitchhiker''s Guide to the Galaxy');

# create second table to link with the other
CREATE TABLE quote_topic (
    quote_id INT UNSIGNED NOT NULL,
    topic_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

#populate
INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1,2), (1,3), (2,4), (3,1),
       (3,2), (3,3), (3,4), (4,2),
       (5,1);

#Show all the linked tables together
#Organise everything based on the quote topic
SELECT first_name, last_name, content, t.name AS 'topic' FROM quotes
    JOIN quote_topic qt on quotes.id = qt.quote_id # if the quote id is equal to quote topic id
    JOIN topics t on qt.topic_id = t.id
    JOIN authors a on quotes.author_id = a.id;

# This lecture was mainly theory, talking about why we would link tables together or
# re-create a table entirely to handle certain pieces of information.
# It's very important to link these ideas together beforehand through physical drawings or drawIO files to get a visual
# representation of the tables you are creating
# Here's the further reading on database design: https://en.wikipedia.org/wiki/Database_normalization

# ************ Exercise **************
# The exercise for this lecture is to create a drawing of a database and its components, there is nothing to turn in.

# users
#--------
# id (auto increment)
# email
# password

# ad listing
#------------
# description
# category
# creator_id
