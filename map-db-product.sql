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
DROP TABLE IF EXISTS maintenance;


CREATE TABLE streets (
	id varchar(15) NOT NULL,
    generalinfo varchar(1024),
	cost float,
    oneway BOOLEAN DEFAULT 0,
	onewayfrom varchar(50),
CONSTRAINT street_key
    PRIMARY KEY (id)
);

CREATE TABLE nodes (
	id bigint NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    streets varchar(500),
    CONSTRAINT node_key
    PRIMARY KEY (id)
);

CREATE TABLE services(
	id int(10) NOT NULL AUTO_INCREMENT,
    name varchar(50),
    CONSTRAINT service_key
	PRIMARY KEY (id)
);

CREATE TABLE toilet(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    isworking boolean,
    CONSTRAINT toilet_key
	PRIMARY KEY (id)
);

CREATE TABLE fuel(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    CONSTRAINT fuel_key
	PRIMARY KEY (id)
);

CREATE TABLE atm(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    CONSTRAINT atm_key
	PRIMARY KEY (id)
);

CREATE TABLE maintenance(
	id int(10) NOT NULL AUTO_INCREMENT,
    lat float,
    lon float,
    iscallable boolean,
    phone varchar(10),
    CONSTRAINT maintenance_key
	PRIMARY KEY (id)
);

CREATE TABLE review(
	id int(10) NOT NULL AUTO_INCREMENT,
    score int NOT NULL,
    body varchar(255),
    belono int(10),
    CONSTRAINT review_key
	PRIMARY KEY (id),
    CONSTRAINT belong_key
    FOREIGN KEY (belono) REFERENCES maintenance (id)
);
