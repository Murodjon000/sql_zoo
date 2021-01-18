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

-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53)
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)=2


SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
WHERE a.stop=53 AND b.stop = 149

-- The query shown is similar to the previous one, 
-- however by joining two copies of the stops table we can
-- refer to stops by name rather than by number.
--  Change the query so that the services between 
-- 'Fairmilehead' and 'Tollcross' are shown.

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
JOIN stops AS stopa ON a.stop=stopa.id
JOIN stops AS stopb ON b.stop=stopb.id
WHERE stopa.name = 'Fairmilehead' AND stopb.name = 'Tollcross';