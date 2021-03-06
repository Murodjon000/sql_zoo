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

-- Obtain the cast list for the film 'Alien'
SELECT name
FROM actor JOIN casting on id=actorid
WHERE movieid = (SELECT id FROM movie WHERE title= 'Alien')

-- List the films in which 'Harrison Ford' has appeared
SELECT movie.title
FROM movie JOIN casting ON movie.id=casting.movieid
JOIN actor ON actor.id=casting.actorid
WHERE actor.name='Harrison Ford'


-- List the films where 'Harrison Ford' has appeared - but not in the starring role
SELECT movie.title
FROM movie JOIN casting ON movie.id=casting.movieid
JOIN actor ON actor.id=casting.actorid
WHERE actor.name='Harrison Ford' AND casting.ord<>1

-- List the films together with the leading star for all 1962 films.
SELECT DISTINCT title,actor.name
FROM movie JOIN casting ON movie.id=casting.movieid
JOIN actor ON actor.id=casting.actorid
WHERE movie.yr=1962 AND casting.ord=1

-- Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- Lead actor in Julie Andrews movies
SELECT title,name 
FROM movie JOIN casting ON (movie.id=movieid AND ord=1)
           JOIN actor ON (actor.id=actorid)
WHERE movie.id IN(
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')

)

-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor JOIN casting ON(actor.id=actorid AND ord=1 )
GROUP BY name
HAVING COUNT(ord)>=15

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON (movieid=movie.id AND movie.yr='1978')
GROUP BY title
ORDER BY COUNT(actorid) DESC,title

-- List all the people who have worked with 'Art Garfunkel'
SELECT name
FROM movie JOIN casting ON (movieid=movie.id)
           JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT casting.movieid
FROM casting
WHERE casting.actorid IN (
SELECT actor.id FROM actor
WHERE name='Art Garfunkel'
)
) AND actor.name<>'Art Garfunkel'