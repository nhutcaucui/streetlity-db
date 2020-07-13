CREATE DATABASE IF NOT EXISTS services;

USE services;

DROP TABLE IF EXISTS atm_review;
DROP TABLE IF EXISTS fuel_review;
DROP TABLE IF EXISTS maintenance_review;
DROP TABLE IF EXISTS toilet_review;
DROP TABLE IF EXISTS toilet;
DROP TABLE IF EXISTS toilet_ucf;
DROP TABLE IF EXISTS fuel;
DROP TABLE IF EXISTS fuel_ucf;
DROP TABLE IF EXISTS atm;
DROP TABLE IF EXISTS atm_ucf;
DROP TABLE IF EXISTS bank;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS maintenance_ucf;
DROP TABLE IF EXISTS maintenance_history;
DROP TABLE IF EXISTS maintenance_order;


CREATE TABLE toilet(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    isworking boolean,
    images varchar(2048),
    contributor varchar(32),
    confident int,
    name varchar(128),
	PRIMARY KEY (id)
);

CREATE TABLE toilet_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    confident int,
    images varchar(2048),
    contributor varchar(32),
	PRIMARY KEY (id)
);

CREATE TABLE fuel(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    images varchar(2048),
    contributor varchar(32),
    confident int,
    name varchar(64),
	PRIMARY KEY (id)
);

CREATE TABLE fuel_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    images varchar(2048),
    confident int,
    contributor varchar(32),
	PRIMARY KEY (id)
);

CREATE TABLE bank(
    id int(10) AUTO_INCREMENT,
    name varchar(255),
    PRIMARY KEY (id, name)
);

CREATE TABLE atm(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    images varchar(2048),
    bank_id int(10),
    contributor varchar(32),
    confident int,
	PRIMARY KEY (id)
);

CREATE TABLE atm_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(256),
    address varchar(256),
    images varchar(2048),
    bank_id int(10),
    confident int,
    contributor varchar(32),
	PRIMARY KEY (id)
);


CREATE TABLE maintenance(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(512),
    address varchar(256),
    images varchar(2048),
    iscallable boolean,
    phone varchar(10),
    maintainer varchar(4096),
    name varchar(64),
    contributor varchar(32),
    confident int,
    CONSTRAINT maintenance_key
	PRIMARY KEY (id)
);

CREATE TABLE maintenance_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(512),
    address varchar(256),
    images varchar(2048),
    phone varchar(10),
    iscallable boolean,
    name varchar(64),
    confident int,
    contributor varchar(32),
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
    PRIMARY KEY (id)
);

CREATE TABLE fuel_review(
	id int(10) NOT NULL AUTO_INCREMENT,
    service_id int,
    reviewer varchar(32),
    score float NOT NULL,
    body varchar(1024),
    PRIMARY KEY (id)
);

CREATE TABLE atm_review(
	id int(10) NOT NULL AUTO_INCREMENT,
    service_id int,
    reviewer varchar(32),
    score float NOT NULL,
    body varchar(1024),
    PRIMARY KEY (id)
);

CREATE TABLE maintenance_review(
	id int(10) NOT NULL AUTO_INCREMENT,
    service_id int,
    reviewer varchar(32),
    score float NOT NULL,
    body varchar(1024),
    PRIMARY KEY (id)
);

CREATE TABLE toilet_review(
	id int(10) NOT NULL AUTO_INCREMENT,
    service_id int,
    reviewer varchar(32),
    score float NOT NULL,
    body varchar(1024),
    PRIMARY KEY (id)
);

ALTER TABLE atm ADD FOREIGN KEY (bank_id) REFERENCES bank (id);
ALTER TABLE atm_ucf ADD FOREIGN KEY (bank_id) REFERENCES bank (id);
ALTER TABLE fuel_review ADD FOREIGN KEy (service_id) REFERENCES fuel(id);
ALTER TABLE atm_review ADD FOREIGN KEy (service_id) REFERENCES atm(id);
ALTER TABLE maintenance_review ADD FOREIGN KEy (service_id) REFERENCES maintenance(id);
ALTER TABLE toilet_review ADD FOREIGN KEy (service_id) REFERENCES toilet(id);
ALTER TABLE bank ADD FULLTEXT bank(name);