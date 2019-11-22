CREATE TABLE team(
    name varchar(255) NOT NULL,
    logo BLOB,
    league_name varchar(255) NOT NULL,
    PRIMARY KEY(name),
    FOREIGN KEY (league_name) REFERENCES league(name)
);