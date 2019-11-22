ALTER TABLE gameweek
ADD CONSTRAINT valid_finished_value CHECK(finished IN('false', 'true'));