DROP DATABASE IF EXISTS map;

CREATE DATABASE map;

USE map;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS nodes;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS toilet;
DROP TABLE IF EXISTS fuel;
DROP TABLE IF EXISTS atm;
DROP TABLE IF EXISTS bank;
DROP TABLE IF EXISTS maintenance;


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
    isworking boolean,
    address varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE toilet_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    isworking boolean,
    confident int,
    address varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE fuel(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    address varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE fuel_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    confident int,
    address varchar(255),
	PRIMARY KEY (id)
);


CREATE TABLE atm(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    bank_id int(10),
    address varchar(255),
    FOREIGN KEY (bank_id) REFERENCES bank (id), 
	PRIMARY KEY (id)
);

CREATE TABLE atm_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    bank_id int(10),
    confident int,
    address varchar(255),
    FOREIGN KEY (bank_id) REFERENCES bank (id), 
	PRIMARY KEY (id)
);

CREATE TABLE bank(
    id int(10) AUTO_INCREMENT,
    name varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE maintenance(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    iscallable boolean,
    address varchar(255),
    phone varchar(10),
    owner int(10),
    CONSTRAINT maintenance_key
	PRIMARY KEY (id)
);

CREATE TABLE maintenance_ucf(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    iscallable boolean,
    address varchar(255),
    phone varchar(10),
    confident int,
	PRIMARY KEY (id)
);

CREATE TABLE review(
	id int(10) NOT NULL AUTO_INCREMENT,
    score int NOT NULL,
    body varchar(255),
    PRIMARY KEY (id)
);
