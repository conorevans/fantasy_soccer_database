CREATE VIEW highest_scoring_players
AS
SELECT p.avatar, p.fname, p.lname, pos.`name`, p.team_name, p.fantasy_value, SUM(et.point_value)
FROM player AS p
JOIN `event` AS e
ON e.player_id = p.id
JOIN position AS pos
ON pos.`name` = p.position
JOIN event_type AS et
ON e.event_type_name = et.event_name AND e.event_type_position = et.position
ORDER BY et.point_value DESC
LIMIT 50;