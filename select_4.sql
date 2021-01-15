-- List each country name where the population is larger than that of 'Russia'.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent='Europe' AND gdp/population > (SELECT gdp/population from world WHERE name='United Kingdom')


-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name,continent 
FROM world
WHERE continent IN(SELECT continent FROM world WHERE name IN ('Argentina' ,'Australia'))
ORDER BY name

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name,population
FROM world
WHERE population > (SELECT population FROM world WHERE name='Canada') AND population < (SELECT population FROM world WHERE name='Poland')

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name,CONCAT(ROUND(population/(SELECT population FROM world WHERE name='Germany')*100),'%') AS persantage
FROM world
WHERE continent='Europe';

