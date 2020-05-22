DROP DATABASE IF EXISTS user;
CREATE DATABASE user;
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
    email varchar(64),
    specific_info varchar(255),
    phone_number varchar(13),
    address varchar(255),
    FOREIGN KEY (id) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE tokens
(
    id varchar(32) NOT NULL,
    refresh_token varchar(255),
    active boolean,
    FOREIGN KEY (id) REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE TABLE device_tokens
(
    token varchar(255) NOT NULL,
    user_id varchar(32) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (token, user_id)
);

CREATE TABLE maintenance_order (
    
)