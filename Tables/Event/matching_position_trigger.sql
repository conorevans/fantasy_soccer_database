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