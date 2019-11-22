delimiter //
CREATE TRIGGER player_age 
BEFORE INSERT ON fantasy_team_player 
FOR EACH ROW
BEGIN
	DECLARE max_age INT;
    DECLARE player_dob DATE;
    DECLARE error_msg varchar(255);
    
    SELECT MIN(max_player_age) 
    INTO max_age
	FROM fantasy_league as fl
    JOIN fantasy_league_fantasy_team as flft
    ON flft.fantasy_team_id = new.fantasy_team_id;
    
    SELECT date_of_birth
    INTO player_dob
    FROM player
    WHERE player.id = new.player_id;
    
    IF ((max_age * 365) < DATEDIFF(CURDATE(),player_dob)) THEN
		SET error_msg = "You cannot add this player to your team because he is older than the maximum player age the league you are entering allows.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
	END IF;
END;//