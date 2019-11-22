CREATE TABLE event_type(
	event_name varchar(255) NOT NULL,
    position varchar(255) NOT NULL,
    point_value INT NOT NULL,
    FOREIGN KEY (position) REFERENCES `position`(name),
    PRIMARY KEY (event_name, position)
);