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