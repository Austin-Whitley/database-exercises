USE codeup_test_db;
SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE name = 'Sgt.Pepper''s Lonely Hearts Club Band';
SELECT name FROM albums WHERE release_date = 1990;
SELECT * FROM albums WHERE genre = 'Nevermind';
SELECT * FROM albums WHERE sales < 20000000;
SELECT * FROM albums WHERE genre = 'Rock';