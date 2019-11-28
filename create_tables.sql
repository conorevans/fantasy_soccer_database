CREATE TABLE league(
  name varchar(255) NOT NULL,
  sponsor varchar(255),
  logo BLOB,
  PRIMARY KEY(name)
);

CREATE TABLE team(
    name varchar(255) NOT NULL,
    logo BLOB,
    league_name varchar(255) NOT NULL,
    PRIMARY KEY(name),
    FOREIGN KEY (league_name) REFERENCES league(name)
);

CREATE TABLE `position`(
	`name` varchar(255) NOT NULL PRIMARY KEY
);

CREATE TABLE player(
  id INT NOT NULL AUTO_INCREMENT,
  date_of_birth DATE NOT NULL,
  avatar BLOB,
  fantasy_value FLOAT NOT NULL,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  position VARCHAR(255) NOT NULL,
  team_name VARCHAR(255) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(team_name) REFERENCES team(name),
  FOREIGN KEY(position) REFERENCES `position`(name)
);

CREATE TABLE `user`(
	username varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY(username)
);

CREATE TABLE fantasy_team(
	id INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    logo BLOB,
    user_id varchar(255) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(username),
    PRIMARY KEY(id)
);

CREATE TABLE fantasy_league(
	id INT NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    max_player_age INT,
    logo BLOB,
	admin_user_id varchar(255) NOT NULL,
    FOREIGN KEY(admin_user_id) REFERENCES `user`(username),
    PRIMARY KEY(id)
);

CREATE TABLE fantasy_team_player(
	fantasy_team_id INT NOT NULL,
    player_id INT NOT NULL,
    FOREIGN KEY(fantasy_team_id) REFERENCES fantasy_team(id),
    FOREIGN KEY(player_id) REFERENCES player(id),
    PRIMARY KEY(fantasy_team_id, player_id)
);

CREATE TABLE fantasy_league_fantasy_team(
	fantasy_league_id INT NOT NULL,
	fantasy_team_id INT NOT NULL,
    FOREIGN KEY(fantasy_team_id) REFERENCES fantasy_team(id),
    FOREIGN KEY(fantasy_league_id) REFERENCES fantasy_league(id),
    PRIMARY KEY(fantasy_league_id, fantasy_team_id)
);

CREATE TABLE gameweek(
	week_number INT NOT NULL,
    fantasy_team_id INT NOT NULL,
    CONSTRAINT valid_week_number CHECK(week_number BETWEEN 1 AND 38),
    FOREIGN KEY (fantasy_team_id) REFERENCES fantasy_team(id),
    PRIMARY KEY (week_number, fantasy_team_id)
);

CREATE TABLE event_type(
	event_name varchar(255) NOT NULL,
    position varchar(255) NOT NULL,
    point_value INT NOT NULL,
    FOREIGN KEY (position) REFERENCES `position`(name),
    PRIMARY KEY (event_name, position)
);

CREATE TABLE event(
	id INT NOT NULL AUTO_INCREMENT,
    event_type_name varchar(255) NOT NULL,
    event_type_position varchar(255) NOT NULL,
    player_id INT NOT NULL,
    gameweek_week_number INT NOT NULL,
    gameweek_fantasy_team_id INT NOT NULL,
    FOREIGN KEY(event_type_name, event_type_position) REFERENCES `event_type`(event_name, position),
    FOREIGN KEY(gameweek_week_number, gameweek_fantasy_team_id) REFERENCES gameweek(week_number, fantasy_team_id),
    FOREIGN KEY(player_id) REFERENCES player(id),
    PRIMARY KEY(id)
);