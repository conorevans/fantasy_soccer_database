DROP VIEW global_leaderboard;
CREATE VIEW global_leaderboard
AS
SELECT ft.`name`, ft.logo, u.username, ft.points_total
FROM fantasy_team as ft
JOIN `user` as u
ON ft.user_id = u.username
ORDER BY ft.points_total DESC;