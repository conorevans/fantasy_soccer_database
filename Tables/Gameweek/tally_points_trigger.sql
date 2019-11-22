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