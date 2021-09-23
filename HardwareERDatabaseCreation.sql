#CREATETABLE STATEMENTS

CREATE TABLE Items (
    itemID int NOT NULL PRIMARY KEY,
    name varchar(255),
    description varchar(255)
);

CREATE TABLE Services (
    serviceID int NOT NULL PRIMARY KEY,
    name varchar(255),
    description varchar(255)
); 

CREATE TABLE ItemInServiceUse (
    itemID int FOREIGN KEY REFERENCES Items(itemID),
    serviceID int FOREIGN KEY REFERENCES Services(serviceID),
);

CREATE TABLE People ();

CREATE TABLE Supplier ();

CREATE TABLE Employee ();

CREATE TABLE Customer ();

CREATE TABLE Items ();

#INSERT STATEMENTS

INSERT INTO Services (100,"duplicate","type 1 key");
INSERT INTO Services (101,"duplicate","type 2 key");
INSERT INTO Services (102,"repair","re-glaze window");
INSERT INTO Services (103,"rent","seed spreader");
