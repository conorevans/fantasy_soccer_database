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