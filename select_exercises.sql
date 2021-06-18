USE codeup_test_db;

SELECT 'Pink Floyd Albums' AS 'Query One';
SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT release_date FROM albums WHERE name = 'Sgt.Pepper''s Lonely Hearts Club Band';
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
SELECT * FROM albums WHERE genre = 'Nevermind';
SELECT * FROM albums WHERE sales < 20000000;
SELECT * FROM albums WHERE genre = 'Rock';