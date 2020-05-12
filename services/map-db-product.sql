DROP DATABASE IF EXISTS services;

CREATE DATABASE services;

USE services;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS nodes;
DROP TABLE IF EXISTS services;
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

CREATE TABLE streets (
	id varchar(15) NOT NULL,
    generalinfo varchar(1024),
	cost float,
    oneway BOOLEAN DEFAULT 0,
	onewayfrom varchar(50),
    PRIMARY KEY (id)
);

CREATE TABLE nodes (
	id bigint NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    streets varchar(500),
    PRIMARY KEY (id)
);

CREATE TABLE services(
	id int(10) NOT NULL AUTO_INCREMENT,
    name varchar(50),
	PRIMARY KEY (id)
);

CREATE TABLE toilet(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    isworking boolean,
	PRIMARY KEY (id)
);

CREATE TABLE toilet_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    confident int,
	PRIMARY KEY (id)
);

CREATE TABLE fuel(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE fuel_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    confident int,
	PRIMARY KEY (id)
);

CREATE TABLE bank(
    id int(10) AUTO_INCREMENT,
    name varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE atm(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    bank_id int(10),
    FOREIGN KEY (bank_id) REFERENCES bank (id), 
	PRIMARY KEY (id)
);

CREATE TABLE atm_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    bank_id int(10),
    confident int,
    FOREIGN KEY (bank_id) REFERENCES bank (id), 
	PRIMARY KEY (id)
);


CREATE TABLE maintenance(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    iscallable boolean,
    phone varchar(10),
    owner varchar(32),
    name varchar(32),
    CONSTRAINT maintenance_key
	PRIMARY KEY (id)
);

CREATE TABLE maintenance_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    note varchar(255),
    address varchar(255),
    phone varchar(10),
    iscallable boolean,
    name varchar(32),
    confident int,
	PRIMARY KEY (id)
);

CREATE TABLE maintenance_history(
    id int(15) NOT NULL AUTO_INCREMENT,
    maintenance_user varchar(32) NOT NULL,
    common_user varchar(32) NOT NULL,
    timestamp DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE review(
	id int(10) NOT NULL AUTO_INCREMENT,
    score int NOT NULL,
    body varchar(255),
    PRIMARY KEY (id)
);

