DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS nodes;
DROP TABLE IF EXISTS services;

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