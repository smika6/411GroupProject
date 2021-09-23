#CREATETABLE STATEMENTS
CREATE TABLE Address (
    streetID int NOT NULL PRIMARY KEY,
    street varchar(255),
    city varchar(255),
    state varchar(2)
);

CREATE TABLE PersonAddress (
    pstreetID int NOT NULL PRIMARY KEY,
    pstreet varchar(255),
    pcity varchar(255),
    pstate varchar(2)

);

CREATE TABLE SupplierLocation (
    wsstreetID int NOT NULL PRIMARY KEY,
    wsstreet varchar(255),
    wscity varchar(255),
    wsstate varchar(2)
);

CREATE TABLE Person (
    personID int NOT NULL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE Employee (
    employeeID int NOT NULL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE Customer (
    customerID int NOT NULL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE Supplier (
    supplierID int NOT NULL PRIMARY KEY,
    name varchar(255)
);

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
