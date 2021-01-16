-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid,player FROM goal 
  WHERE teamid LIKE 'GER%'

-- Show id, stadium, team1, team2 for just game 1012
SELECT DISTINCT id,stadium,team1,team2
  FROM game
JOIN goal ON game.id=1012 AND goal.matchid=1012

-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid='GER'

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1,team2,player
FROM goal
JOIN game ON (id=matchid)
WHERE player LIKE 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid,coach,gtime
 FROM goal 
JOIN eteam ON (teamid=id)
 WHERE gtime<=10

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
 SELECT mdate,teamname
FROM game
JOIN eteam ON (team1=eteam.id)
WHERE coach='Fernando Santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal
JOIN game ON (id=matchid)
WHERE stadium='National Stadium, Warsaw'

-- Show teamname and the total number of goals scored.
SELECT teamname,COUNT(player)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 ORDER BY teamname

