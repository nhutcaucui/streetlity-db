DROP DATABASE IF EXISTS user;
CREATE DATABASE user;
USE user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_infos;
DROP TABLE IF EXISTS tokens;


CREATE TABLE users
(
    id varchar(32) NOT NULL,
    passwd varchar(32),
    acces_level int,
    -- info_id varchar(15),
    # CONSTRAINT info_key FOREIGN KEY (info_id) REFERENCES user_infos(id),
    CONSTRAINT user_key PRIMARY KEY (id)
);

CREATE TABLE user_infos
(
    id varchar(15) NOT NULL,
    email varchar(64),
    CONSTRAINT info_key PRIMARY KEY (id)
);

CREATE TABLE tokens
(
    id varchar(15) NOT NULL,
    refresh_token varchar(255),
    CONSTRAINT user_key FOREIGN KEY (id) REFERENCES users(id),
    CONSTRAINT token_key PRIMARY KEY (id)
);