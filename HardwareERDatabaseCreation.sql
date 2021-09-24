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
    wID int NOT NULL PRIMARY KEY,
    wID int,
    StreetAddress varchar(10),
    City varchar(10),
    State varchar(2),
    FOREIGN KEY (Street, City, State) REFERENCES Address
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

#hardware items (iid, name, description)
INSERT INTO  (2,"cement","60 lb , bag of cement");
INSERT INTO  (4,"paint","gallon of white paint");
INSERT INTO  (10,"nail","2 in nail");
INSERT INTO  (12,"nail","3 in nail");
INSERT INTO  (14,"nail","4 in nail");
INSERT INTO  (16,"bolt","2 in bolt");
INSERT INTO  (20,"light bulb","40 watt");
INSERT INTO  (22,"light bulb","60 watt");
INSERT INTO  (24,"light bulb","10 watt LED");
INSERT INTO  (26,"light bulb","14 watt LED");
INSERT INTO  (28,"glaze","16 ounces");
INSERT INTO  (29,"grill","40lb barbeque");
INSERT INTO  (30,"key","key blank - type 1");
INSERT INTO  (32,"key","key blank - type 2");
INSERT INTO  (34,"grass seed","1 pound");

#services (iid, name, description)
INSERT INTO Services (100,"duplicate","type 1 key");
INSERT INTO Services (101,"duplicate","type 2 key");
INSERT INTO Services (102,"repair","re-glaze window");
INSERT INTO Services (103,"rent","seed spreader");

#ServiceHardwareUse (service-iid, hardware-iid)
INSERT INTO HardwareInServiceUse (100,30);
INSERT INTO HardwareInServiceUse (101,32);
INSERT INTO HardwareInServiceUse (102,28);
INSERT INTO HardwareInServiceUse (103,34);

INSERT INTO  ();
INSERT INTO  ();
INSERT INTO  ();
INSERT INTO  ();
INSERT INTO  ();

INSERT INTO  (,"","");
INSERT INTO  (,"","");


