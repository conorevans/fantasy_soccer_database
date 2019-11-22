INSERT INTO `event` VALUES(NULL, 'goal', 'goalkeeper', 14, 1);

UPDATE gameweek
SET finished = 'false'
WHERE week_number = 1;

SELECT points_total FROM fantasy_team;