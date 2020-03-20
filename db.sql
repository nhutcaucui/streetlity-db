USE ixPwflxQAF;

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
    generalinfo varchar(255),
    nodenum int,
    nodes varchar(500),
	cost float,
    oneway BOOLEAN DEFAULT 0,
	onewayfrom varchar(50),
CONSTRAINT street_key
    PRIMARY KEY (id)
);

CREATE TABLE nodes (
	id int(10) NOT NULL AUTO_INCREMENT,
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

INSERT INTO streets(id, generalinfo, nodenum, nodes,cost, oneway,onewayfrom) VALUES 
("1", "abc", 3, "1;2;3", 0, 0, NULL),
("2", "xyz", 3, "4;2;5", 0, 0, NULL),
("3", "help", 2, "6;4", 0, 0, NULL),
("4", "me", 3, "6,3,5", 0, 0, NULL);

INSERT INTO nodes(lat,lon,streets) VALUES
(0,0,"1"),
(0,10,"1;2"),
(0,20,"1;4"),
(-10,10, "2;3"),
(10,10,"2;4"),
(-10,60,"3;4");

INSERT INTO services (name) VALUES ("Nhà vệ sinh"),
("Đổ xăng"),
("ATM"),
("Sửa xe");

INSERT INTO toilet (lat,lon,isworking) VALUES (10,10,1);
INSERT INTO fuel (lat,lon) VALUES (-10,-10);
INSERT INTO atm (lat,lon) VALUES (15,0);
INSERT INTO maintenance (lat,lon,iscallable,phone) VALUES (5,5,1,"012345678");
INSERT INTO review (score,body,belono) VALUES (5,"xinso",1);