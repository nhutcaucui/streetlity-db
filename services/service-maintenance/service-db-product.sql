CREATE DATABASE IF NOT EXISTS services;

USE services;

DROP TABLE IF EXISTS emergency_maintenance;
DROP TABLE IF EXISTS maintenance_history;
DROP TABLE IF EXISTS maintenance_order;

CREATE TABLE emergency_maintenance
(
    id varchar(32) NOT NULL,
    lat float,
    lon float,
    PRIMARY KEY (id)
);

CREATE TABLE maintenance_history(
    id int(15) NOT NULL AUTO_INCREMENT,
    maintenance_user varchar(32) NOT NULL,
    common_user varchar(32) NOT NULL,
    reason varchar(512),
    note varchar(128),
    timestamp int,
    PRIMARY KEY (id)
);

CREATE TABLE maintenance_order(
    id int(15) NOT NULL AUTO_INCREMENT,
    common_user varchar(32) NOT NULL,
    maintenance_user varchar(32),
    reason varchar(128),
    note varchar(128),
    timestamp int,
    receiver varchar(2048),
    status int(3),
    order_type int,
    PRIMARY KEY (id)
);
