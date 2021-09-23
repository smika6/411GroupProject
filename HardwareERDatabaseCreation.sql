#CREATETABLE STATEMENTS
CREATE TABLE Address ();

CREATE TABLE PersonAddress (
    PersonId


);

CREATE TABLE SupplierLocation ();

CREATE TABLE Person ();

CREATE TABLE Employee ();

CREATE TABLE Customer (
    itemId int FOREIGN KEY REFERENCES item(ItemID)

);

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

CREATE TABLE CustomerPurchases (

     quantity varchar(255),
     Price varchar(255),
     customerID int FOREIGN KEY REFERENCES Customer(CustomerID),
     itemID int FOREIGN KEY REFERENCES Item(ItemID)


);

CREATE TABLE Deliveries (
    date varchar(40),



);

CREATE TABLE PurchaseFromSupplier (


);

CREATE TABLE EmployeePerformService (
    hours varchar(255),
    date varchar(40),
    PRIMARY ?
    Foreign ?


);


#INSERT STATEMENTS

INSERT INTO Services (100,"duplicate","type 1 key");
INSERT INTO Services (101,"duplicate","type 2 key");
INSERT INTO Services (102,"repair","re-glaze window");
INSERT INTO Services (103,"rent","seed spreader");
