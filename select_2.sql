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

-- Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE 'United%'

-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name,population,area
FROM world
WHERE area>3000000 OR population>250000000

-- Exclusive OR (XOR). 
SELECT name,population,area
FROM world
WHERE area>3000000 XOR population>250000000

-- For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2)
FROM world
WHERE continent='South America'
