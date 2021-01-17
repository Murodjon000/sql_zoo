-- List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

-- Give year of 'Citizen Kane'.
 SELECT yr 
FROM movie
WHERE title='Citizen Kane'

-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title).
SELECT id,title,yr 
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

-- What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name='Glenn Close'

-- What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title='Casablanca'

-- Obtain the cast list for 'Casablanca'.
SELECT name
FROM actor JOIN casting on id=actorid
WHERE movieid=11768
