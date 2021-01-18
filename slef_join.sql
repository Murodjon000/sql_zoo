-- How many stops are in the database.
SELECT COUNT(name)
FROM stops

-- Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops 
WHERE name = 'Craiglockhart'

-- Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id,name 
FROM stops JOIN route ON (stop=id)
WHERE num='4'  AND company='LRT'
