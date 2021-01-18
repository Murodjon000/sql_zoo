-- How many stops are in the database.
SELECT COUNT(name)
FROM stops

-- Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops 
WHERE name = 'Craiglockhart'
