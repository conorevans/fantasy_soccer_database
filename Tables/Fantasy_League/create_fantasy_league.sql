CREATE TABLE fantasy_league(
	id INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    max_player_age INT,
    logo BLOB,
	admin_user_id varchar(255) NOT NULL,
    FOREIGN KEY(admin_user_id) REFERENCES `user`(username),
    PRIMARY KEY(id)
);