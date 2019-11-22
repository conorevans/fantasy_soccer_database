CREATE TABLE `user`(
	username varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY(username)
);