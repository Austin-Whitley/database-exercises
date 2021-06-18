USE codeup_test_db;

SELECT 'All album names in your table' AS 'Query One';
SELECT * FROM albums;

SELECT 'All albums from the  90s' AS 'Query Two';
SELECT * FROM albums WHERE release_date < 1980;

SELECT 'Michael Jacksons albums' AS 'Query Three';
SELECT * FROM albums WHERE artist = 'Michael Jackson';

-- UPDATE albums
-- SET sales = (sales * 10);

-- UPDATE albums
-- SET release_date = release_date - 100
-- WHERE release_date <= 1980;
--
-- UPDATE albums
-- SET artist = 'Michael Jordan'
-- WHERE artist = 'Michael Jackson';

SELECT release_date FROM albums WHERE release_date < 1980;
