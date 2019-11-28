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

delimiter //
CREATE TRIGGER gameweek_counted_only_once 
BEFORE UPDATE ON gameweek
FOR EACH ROW
BEGIN
  DECLARE error_msg varchar(255);

  IF(old.finished = 'true' AND new.finished = 'false') THEN
		SET error_msg = "You cannot 'unfinish' a gameweek.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END IF;
END;//

delimiter //
CREATE TRIGGER tally_points
AFTER UPDATE ON gameweek
FOR EACH ROW
BEGIN
	DECLARE points INT;
	IF old.finished = 'false' AND new.finished = 'true' THEN
		SELECT SUM(et.point_value)
		INTO points
		FROM event_type as et
		JOIN `event` as e
		ON e.event_type_name = et.event_name AND e.event_type_position = et.position
		JOIN fantasy_team_player as ftp
		ON e.player_id = ftp.player_id;
		
		UPDATE fantasy_team
		SET points_total = points_total + points
		WHERE fantasy_team.id = new.fantasy_team_id;
	END IF;
END;//

delimiter //
CREATE TRIGGER event_type_matches_player_position 
BEFORE INSERT ON `event`
FOR EACH ROW
BEGIN
	DECLARE player_position varchar(255);
    DECLARE error_msg varchar(255);
    
    SELECT p.position
    INTO player_position
	FROM player AS p
    WHERE p.id = new.player_id;
    
    IF (player_position != new.event_type_position) THEN
		SET error_msg = "You cannot create this event as the position for the event does not match its player's position";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
	END IF;
END;//