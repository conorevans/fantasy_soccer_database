ALTER TABLE position
ADD CONSTRAINT valid_position CHECK(position.`name` IN('Goalkeeper','Defender','Midfielder','Forward'));