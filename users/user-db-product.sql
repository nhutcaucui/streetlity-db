CREATE DATABASE IF NOT EXISTS user;
USE user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_infos;
DROP TABLE IF EXISTS tokens;
DROP TABLE IF EXISTS device_tokens;
DROP TABLE IF EXISTS maintenance_order;

CREATE TABLE users
(
    id varchar(32) NOT NULL,
    passwd varchar(255),
    acces_level int,
    PRIMARY KEY (id)
);

CREATE TABLE user_infos
(
    id varchar(32) NOT NULL,
    name varchar(128),
    email varchar(64),
    specific_info varchar(255),
    phone_number varchar(13),
    address varchar(255),
    avatar varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE tokens
(
    id varchar(32) NOT NULL,
    refresh_token varchar(255),
    active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE device_tokens
(
    token varchar(255) NOT NULL,
    user_id varchar(32) NOT NULL,
    PRIMARY KEY (token, user_id)
);

ALTER TABLE user_infos ADD FOREIGN KEY fk_user (id) REFERENCES users (id);
ALTER TABLE tokens ADD FOREIGN KEY fk_user (id) REFERENCES users (id);
ALTER TABLE device_tokens ADD FOREIGN KEY fk_user (user_id) REFERENCES users (id);
