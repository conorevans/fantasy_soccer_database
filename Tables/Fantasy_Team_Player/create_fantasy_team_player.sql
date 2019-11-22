CREATE TABLE fantasy_team_player(
	fantasy_team_id INT NOT NULL,
    player_id INT NOT NULL,
    FOREIGN KEY(fantasy_team_id) REFERENCES fantasy_team(id),
    FOREIGN KEY(player_id) REFERENCES player(id),
    PRIMARY KEY(fantasy_team_id, player_id)
);