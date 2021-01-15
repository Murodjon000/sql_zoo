-- Show the total population of the world
SELECT SUM(population)
FROM world

-- List all the continents - just once each
SELECT DISTINCT continent
FROM world
