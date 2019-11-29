DROP VIEW fl_2_personal_details;
DROP VIEW global_leaderboard;
DROP VIEW highest_scoring_players;
DROP VIEW individual_user_teams;

DROP TABLE event;
DROP TABLE event_type;
DROP TABLE gameweek;
DROP TABLE fantasy_team_player;
DROP TABLE fantasy_league_fantasy_team;
ALTER TABLE fantasy_league DROP FOREIGN KEY fantasy_league_ibfk_1;
ALTER TABLE fantasy_team DROP FOREIGN KEY fantasy_team_ibfk_1;
DROP TABLE fantasy_soccer.user;
DROP TABLE fantasy_team;
DROP TABLE fantasy_league;
DROP TABLE player;
DROP TABLE position;
DROP TABLE team;
DROP TABLE league;