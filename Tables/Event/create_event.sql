CREATE TABLE event(
	id INT NOT NULL AUTO_INCREMENT,
    event_type_name varchar(255) NOT NULL,
    event_type_position varchar(255) NOT NULL,
    player_id INT NOT NULL,
    gameweek_id INT NOT NULL,
    FOREIGN KEY(event_type_name, event_type_position) REFERENCES `event_type`(event_name, position),
    FOREIGN KEY(player_id) REFERENCES player(id),
    PRIMARY KEY(id)
);