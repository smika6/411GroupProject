#CREATETABLE STATEMENTS
CREATE TABLE Address ();

CREATE TABLE PersonAddress ();

CREATE TABLE SupplierLocation ();

CREATE TABLE Person ();

CREATE TABLE Employee ();

CREATE TABLE Customer ();

CREATE TABLE Supplier ();

CREATE TABLE Items (
    itemID int NOT NULL PRIMARY KEY,
    name varchar(255),
    description varchar(255)
);

CREATE TABLE Hardware (
    hardwareID int NOT NULL PRIMARY KEY,
    name varchar(255),
    description varchar(255)
);

CREATE TABLE Services (
    serviceID int NOT NULL PRIMARY KEY,
    name varchar(255),
    description varchar(255)
); 

CREATE TABLE HardwareInServiceUse (
    hardwareID int FOREIGN KEY REFERENCES Hardware(hardwareID),
    serviceID int FOREIGN KEY REFERENCES Services(serviceID),
);

CREATE TABLE CustomerPurchases ();

CREATE TABLE Deliveries ();

CREATE TABLE PurchaseFromSupplier ();

CREATE TABLE EmployeePerformService ();


#INSERT STATEMENTS

INSERT INTO Services (100,"duplicate","type 1 key");
INSERT INTO Services (101,"duplicate","type 2 key");
INSERT INTO Services (102,"repair","re-glaze window");
INSERT INTO Services (103,"rent","seed spreader");
