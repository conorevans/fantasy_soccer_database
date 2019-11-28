## The order for creating tables has been outlined in the report but for brevity, it is here too:

League/create_league.sql

Team/create_team.sql

Position/create_position.sql

Player/create_player.sql

User/create_user.sql

Fantasy_League/create_fantasy_league.sql

Fantasy_Team/create_fantasy_team.sql

Fantasy_League_Fantasy_Team/create_fantasy_league_fantasy_team.sql

Fantasy_Team_Player/create_fantasy_team_player.sql

Gameweek/create_gameweek.sql

Event_Type/create_event_type.sql

Event/create_event.sql

## These tables are then altered in the following fashion:

Fantasy_Team/add_points_total_to_fantasy_team.sql

Gameweek/add_finished_to_gameweek.sql

Gameweek/add_constraint_on_finished_to_gameweek.sql

Position/valid_position_constraint.sql

## I would then advise creating the triggers so that insertions can be tested by these triggers:

Event/matching_position_trigger.sql

Fantasy_Team_Player/age_trigger.sql

Fantasy_Team_Player/max_num_players_from_team_trigger.sql

Gameweek/cant_unfinish_gameweek_trigger.sql

Gameweek/tally_points_trigger.sql

## Each of these triggers has an accompanying test SQL file which you may run to test them.

Once these are added, you can test insertions/updates:

NOTE: some insertions might fail due to an arity mismatch, this is because an ALTER TABLE ADD COLUMN was
added at some point between this insertion and the remaining insertions. I left these in there to show how
UPDATE was used to set values for these newly added attributes for tuples who had been added before the
attribute was part of the table schema.

## Each insertion/update follow the format of

TABLE/insert_table.sql

TABLE/update_attribute_of_tuple.sql

## The lone procedure is stored in PROCEDURES/ and you may use CALL with a parameter that is an existing username in the DB. If you need a sample parameter, run

SELECT * FROM fantasy_soccer.user;

Views and access granting are then under the VIEWS/ folder.

