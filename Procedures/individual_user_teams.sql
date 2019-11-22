DELIMITER //
CREATE PROCEDURE individual_user_teams(username varchar(255))
BEGIN
	SELECT `name`, logo, points_total
    FROM fantasy_team
    WHERE user_id = username;
END //
DELIMITER ;