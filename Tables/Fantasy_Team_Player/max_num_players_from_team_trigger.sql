DELIMITER //
CREATE TRIGGER max_num_players_from_team 
BEFORE INSERT ON fantasy_team_player
FOR EACH ROW
BEGIN
	DECLARE count INT;
    DECLARE error_msg varchar(255);

    SELECT COUNT(*)
    INTO count
    FROM team as t
    JOIN player as p
    JOIN fantasy_team_player AS ftp
    ON ftp.fantasy_team_id = new.fantasy_team_id
    WHERE t.`name` = p.team_name;
    
    IF(count > 2) THEN
		SET error_msg = "You cannot add this player to your team. You already have three players from this team";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END IF;
END;//