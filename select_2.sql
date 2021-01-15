--  Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population 
FROM world

-- Show the name for the countries that have a population of at least 200 million. 
SELECT name
FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp / population 
FROM world 
WHERE population>=200000000

-- Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population / 1000000
FROM world
WHERE continent = 'South America'