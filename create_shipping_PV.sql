DROP DATABASE IF EXISTS shipping;

CREATE DATABASE shipping;

use shipping;

CREATE TABLE ports 
(portID VARCHAR(255) PRIMARY KEY NOT NULL,
city VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL );

CREATE TABLE ships
(shipID VARCHAR(255) PRIMARY KEY NOT NULL,
displacement INT(4) NOT NULL,
captainName VARCHAR(255) NOT NULL,
crewSize INT(3) NOT NULL,
homePort VARCHAR(255) NOT NULL,
yearBuilt YEAR NOT NULL,
UNIQUE (shipID),
foreign key(homePort) references ports(portID) );


CREATE TABLE containers 
(containerID CHAR(10) PRIMARY KEY NOT NULL,
dimensionHeight INT(2) NOT NULL,
dimensionWidth INT(2) NOT NULL,
dimensionLength INT(2) NOT NULL,
weight INT(5) NOT NULL,
shipID VARCHAR(255),
UNIQUE (containerID),
foreign key(shipID) references ships(shipID) );