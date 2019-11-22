INSERT INTO gameweek VALUES(1, 1, 'false');

UPDATE gameweek
SET finished = 'true'
WHERE week_number = 1 AND fantasy_team_id = 4;

UPDATE gameweek
SET finished = 'false'
WHERE week_number = 1 AND fantasy_team_id = 4;