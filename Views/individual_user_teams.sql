CREATE VIEW individual_user_teams
AS 
SELECT ft.`name`, ft.logo, ft.points_total 
FROM fantasy_team AS ft
WHERE ft.user_id = 'jangirl';