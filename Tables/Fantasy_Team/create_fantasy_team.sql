CREATE TABLE fantasy_team(
	id INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    logo BLOB,
    user_id varchar(255) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(username),
    PRIMARY KEY(id)
);