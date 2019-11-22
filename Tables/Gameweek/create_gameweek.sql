CREATE TABLE gameweek(
	week_number INT NOT NULL,
    fantasy_team_id INT NOT NULL,
    CONSTRAINT valid_week_number CHECK(week_number BETWEEN 1 AND 38),
    FOREIGN KEY (fantasy_team_id) REFERENCES fantasy_team(id),
    PRIMARY KEY (week_number, fantasy_team_id)
);