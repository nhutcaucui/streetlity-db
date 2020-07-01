CREATE DATABASE IF NOT EXISTS user;
USE user;

DROP TABLE IF EXISTS user_infos;
DROP TABLE IF EXISTS tokens;
DROP TABLE IF EXISTS device_tokens;
DROP TABLE IF EXISTS user_achievement;
DROP TABLE IF EXISTS user_achievement_progress;
DROP TABLE IF EXISTS achievement;
DROP TABLE IF EXISTS notification_history;
DROP TABLE IF EXISTS users;

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

CREATE TABLE emergency_maintenance
(
    id varchar(32) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE user_achievement
(
    id varchar(32) NOT NULL,
    reputation int,
    impact bigint,
    achievement_path varchar(128),
    PRIMARY KEY (id)
);

CREATE TABLE user_achievement_progress
(
    id varchar(32) NOT NULL,
    review_times int,
    contribute_times int,
    upvote_times int,
    downvote_times int,
    progress_path varchar(128),
    history_path varchar(128),
    PRIMARY KEY (id)
);

CREATE TABLE achievement
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(64),
    description varchar(256),
    condition_path varchar(128),
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

CREATE TABLE notification_history
(
    id int NOT NULL AUTO_INCREMENT,
    receiver varchar(32) NOT NULL,
    title varchar(32),
    body varchar(512),
    click_action varchar(64),
    image_url varchar(128),
    data varchar(1024),
    PRIMARY KEY (id)
);

ALTER TABLE user_infos ADD FOREIGN KEY fk_user (id) REFERENCES users (id);
ALTER TABLE tokens ADD FOREIGN KEY fk_user (id) REFERENCES users (id);
ALTER TABLE device_tokens ADD FOREIGN KEY fk_user (user_id) REFERENCES users (id);
ALTER TABLE user_achievement ADD FOREIGN KEY (id) REFERENCES users(id);
ALTER TABLE user_achievement_progress ADD FOREIGN KEY (id) REFERENCES users(id);