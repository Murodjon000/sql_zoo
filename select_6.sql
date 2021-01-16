-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid,player FROM goal 
  WHERE teamid LIKE 'GER%'

-- Show id, stadium, team1, team2 for just game 1012
SELECT DISTINCT id,stadium,team1,team2
  FROM game
JOIN goal ON game.id=1012 AND goal.matchid=1012

