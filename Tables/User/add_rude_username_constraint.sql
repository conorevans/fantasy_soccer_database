ALTER TABLE fantasy_soccer.`user`
ADD CONSTRAINT no_rude_username CHECK(username NOT IN ('rude','list','of','words'));