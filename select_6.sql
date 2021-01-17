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

-- Show the stadium and the number of goals scored in each stadium.
 SELECT stadium,COUNT(player)
FROM goal
JOIN game ON matchid=id
GROUP BY stadium
ORDER BY stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, COUNT(teamid)
FROM game 
JOIN goal ON goal.matchid = game.id 
WHERE 'POL' IN(team1,team2)
GROUP BY matchid, mdate

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid,mdate,COUNT(player)
FROM game
JOIN goal ON goal.matchid = game.id 
WHERE 'GER' IN(teamid)
GROUP BY matchid,mdate

-- List every match with the goals scored by each team as shown.
SELECT game.mdate,
  game.team1,
  SUM(CASE WHEN goal.teamid=game.team1 THEN 1 ELSE 0 END) AS score1,
  game.team2,
  SUM(CASE WHEN goal.teamid=game.team2 THEN 1 ELSE 0 END) AS score2

FROM game LEFT OUTER JOIN goal ON game.id = goal.matchid 
GROUP BY game.mdate,goal.matchid,game.team1,game.team2
