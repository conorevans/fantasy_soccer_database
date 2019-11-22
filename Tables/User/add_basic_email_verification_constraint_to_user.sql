ALTER TABLE fantasy_soccer.`user`
ADD CONSTRAINT verify_email_format CHECK(email LIKE '%@%' AND email LIKE '%.%')