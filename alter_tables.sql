ALTER TABLE fantasy_team
ADD COLUMN points_total INT DEFAULT(0);

ALTER TABLE gameweek
ADD COLUMN finished varchar(255) NOT NULL DEFAULT('false');

ALTER TABLE gameweek
ADD CONSTRAINT valid_finished_value CHECK(finished IN('false', 'true'));

ALTER TABLE position
ADD CONSTRAINT valid_position CHECK(position.`name` IN('Goalkeeper','Defender','Midfielder','Forward'));

ALTER TABLE fantasy_soccer.`user`
ADD CONSTRAINT verify_email_format CHECK(email LIKE '%@%' AND email LIKE '%.%');

ALTER TABLE fantasy_soccer.`user`
ADD CONSTRAINT no_rude_username CHECK(username NOT IN ('rude','list','of','words'));

ALTER TABLE team
ADD COLUMN abbreviation char(3) UNIQUE;

ALTER TABLE team
ADD CONSTRAINT abbreviation_length CHECK(char_length(abbreviation) = 3);