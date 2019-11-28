CREATE VIEW fl_2_personal_details
AS
SELECT fl.`name`, u.username, u.email
FROM fantasy_league AS fl
JOIN fantasy_soccer.`user` AS u
ON fl.admin_user_id = 'jangirl';

CREATE VIEW global_leaderboard
AS
SELECT ft.`name`, ft.logo, u.username, ft.points_total
FROM fantasy_team as ft
JOIN `user` as u
ON ft.user_id = u.username
ORDER BY ft.points_total DESC;

CREATE VIEW highest_scoring_players
AS
SELECT p.avatar, p.fname, p.lname, pos.`name`, p.team_name, p.fantasy_value, SUM(et.point_value)
FROM player AS p
JOIN `event` AS e
ON e.player_id = p.id
JOIN position AS pos
ON pos.`name` = p.position
JOIN event_type AS et
ON e.event_type_name = et.event_name AND e.event_type_position = et.position
ORDER BY et.point_value DESC
LIMIT 50;

CREATE VIEW individual_user_teams
AS 
SELECT ft.`name`, ft.logo, ft.points_total 
FROM fantasy_team AS ft
WHERE ft.user_id = 'jangirl';

