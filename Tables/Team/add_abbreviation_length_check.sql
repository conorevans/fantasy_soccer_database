ALTER TABLE team
ADD CONSTRAINT abbreviation_length CHECK(char_length(abbreviation) = 3);