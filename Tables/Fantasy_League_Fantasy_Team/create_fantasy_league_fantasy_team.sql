CREATE TABLE fantasy_league_fantasy_team(
	fantasy_league_id INT NOT NULL,
	fantasy_team_id INT NOT NULL,
    FOREIGN KEY(fantasy_team_id) REFERENCES fantasy_team(id),
    FOREIGN KEY(fantasy_league_id) REFERENCES fantasy_league(id),
    PRIMARY KEY(fantasy_league_id, fantasy_team_id)
);