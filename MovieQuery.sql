SELECT *
FROM ['Working file$']


-- Drop Movie_title duplicate
ALTER TABLE ['Working file$']
DROP COLUMN movie_title

--Convert release Date

SELECT original_release_date, CONVERT(Date, original_release_date)
FROM ['Working file$']

UPDATE ['Working file$']
SET original_release_date = CONVERT(Date, original_release_date)


ALTER Table ['Working file$']
ADD original_release_date_converted DATE

UPDATE ['Working file$']
SET original_release_date_converted = CONVERT(Date, original_release_date)

Select *
FROM ['Working file$']

-- Drop original release date
ALTER TABLE ['Working file$']
DROP COLUMN original_release_date

Select *
FROM ['Working file$']


-- Number of movies in database is 17,712
SELECT COUNT(Movie_Title_corrected)
FROM ['Working file$']


-- Number of movies in database with at least 10 critics or more is 14,354
SELECT COUNT(Movie_Title_corrected)
FROM ['Working file$']
WHERE tomatometer_count >= 10



-- First movie in the database to most recent is 06/01/1914 - 09/30/2020
SELECT MIN(original_release_date_converted), MAX(original_release_date_converted)  
FROM ['Working file$']
WHERE tomatometer_count >= 10


-- Number of Fresh to Certified-fresh movies with at least 10 critics is 8,422
SELECT COUNT(tomatometer_status)
FROM ['Working file$']
WHERE tomatometer_status IN ('Fresh', 'Certified-Fresh') 
AND tomatometer_count >= 10



-- Number of  Rotten movies with at least 10 critics is 5,932
SELECT COUNT(tomatometer_status)
FROM ['Working file$']
WHERE tomatometer_status IN ('Rotten') 
AND tomatometer_count >= 10



-- 1,554 movies where the critics ratings are less than 60% and the audience is 60% or greater

SELECT Movie_Title_corrected, genres, tomatometer_rating, audience_rating
FROM ['Working file$']
WHERE tomatometer_rating <'60' AND audience_rating >='60'
AND tomatometer_count >= 10
ORDER BY tomatometer_rating



-- Find the movies where the Audience is less than 60% and the critics is greater than 60%

SELECT Movie_Title_corrected, genres, tomatometer_rating, audience_rating
FROM ['Working file$']
WHERE tomatometer_rating >='60' AND audience_rating <'60'
AND tomatometer_count >= 10
ORDER BY tomatometer_rating



-- Find an even larger gap?



-- Find what Movies are Fresh or Certified-fresh that are genre Movies including Action &Adventure, Horror, Mystery & Suspense and Science Fiction 
SELECT Movie_Title_corrected, Genres
FROM ['Working file$']
