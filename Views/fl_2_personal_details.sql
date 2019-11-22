CREATE VIEW fl_2_personal_details
AS
SELECT fl.`name`, u.username, u.email
FROM fantasy_league AS fl
JOIN fantasy_soccer.`user` AS u
ON fl.admin_user_id = 'jangirl';