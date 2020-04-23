DROP DATABASE IF EXISTS user;

CREATE DATABASE user;

USE user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tokens;

CREATE TABLE users (
	id varchar(15) NOT NULL,
    username varchar(32),
    passwd varchar(32),
    role int,
    CONSTRAINT user_key
    PRIMARY KEY (id)
);

CREATE TABLE user_info (
    id varchar(15) NOT NULL,
    email varchar(64),
    CONSTRAINT user_key
    PRIMARY KEY (id)
);

CREATE TABLE tokens (
    id varchar(15) NOT NULL,
    refresh_token varchar(255)
);