/*CREATETABLE STATEMENTS*/
CREATE TABLE Address (
    astreetID int,
    astreet varchar(255) NOT NULL PRIMARY KEY,
    acity varchar(255),
    astate varchar(2)
);

CREATE TABLE PersonAddress (
    pstreetID int,
    pstreet varchar(255) NOT NULL PRIMARY KEY,
    pcity varchar(255),
    pstate varchar(2)

);

CREATE TABLE SupplierLocation (
    wsstreetID int,
    wsstreet varchar(255) NOT NULL PRIMARY KEY,
    wscity varchar(255),
    wsstate varchar(2)
);

CREATE TABLE Person (
    personID int NOT NULL PRIMARY KEY,
    pname varchar(255)
);

CREATE TABLE Employee (
    employeeID int NOT NULL PRIMARY KEY,
    ename varchar(255)
);

CREATE TABLE Customer (
    customerID int NOT NULL PRIMARY KEY,
    cname varchar(255)
);

CREATE TABLE Supplier (
    supplierID int NOT NULL PRIMARY KEY,
    sname varchar(255)
);

CREATE TABLE Items (
    itemID int NOT NULL PRIMARY KEY,
    iname varchar(255),
    idescription varchar(255)
);

CREATE TABLE Hardware (
    hardwareID int NOT NULL PRIMARY KEY,
    hname varchar(255),
    hdescription varchar(255)
);

CREATE TABLE Services (
    serviceID int NOT NULL PRIMARY KEY,
    sname varchar(255),
    sdescription varchar(255)
); 

CREATE TABLE HardwareInServiceUse (
   serviceID int,
   hardwareID int,
   FOREIGN KEY(serviceID) REFERENCES Services(serviceID),
   FOREIGN KEY(hardwareID) REFERENCES Hardware(hardwareID)
   
   /*ON DELETE SET NULL*/
);

CREATE TABLE CustomerPurchases (
    customerID int,
    itemID int,
    quantity int,
    price float,
    FOREIGN KEY(customerID) REFERENCES Customer(customerID),
    FOREIGN KEY(itemID) REFERENCES Items(itemID)
);

CREATE TABLE Deliveries (
    customerID int,
    itemID int,
    streetAddress varchar(250),
    city varchar(250),
    sstate varchar(250),
    deliveryDate varchar(250),
    employeeID int,
    FOREIGN KEY(customerID) REFERENCES Customer(customerID),
    FOREIGN KEY(itemID) REFERENCES Items(itemID),
    FOREIGN KEY(streetAddress) REFERENCES PersonAddress(pstreet),
    FOREIGN KEY(employeeID) REFERENCES Employee(employeeID)
);

CREATE TABLE PurchaseFromSupplier (
    itemID int,
    supplierID int,
    quantity int,
    unitCost float,
    FOREIGN KEY(itemID) REFERENCES Items(itemID),
    FOREIGN KEY(supplierID) REFERENCES Supplier(supplierID)
);

CREATE TABLE EmployeePerformService (
    employee_pid int,
    customer_pid int,
    iid int,
    sDate varchar(250),
    sHours float,
    FOREIGN KEY(employee_pid) REFERENCES Employee(employeeID),
    FOREIGN KEY(customer_pid) REFERENCES Customer(customerID),
    FOREIGN KEY(iid) REFERENCES Items(itemID)
);

INSERT INTO PersonAddress VALUES (10234,'342 streetA','Monticello','MN');
INSERT INTO PersonAddress VALUES (11567,'65 streetS','St Cloud','MN');
INSERT INTO PersonAddress VALUES (3289,'892 streetM','Minneapolis','MN');
INSERT INTO PersonAddress VALUES (17645,'342 streetB','Monticello','MN');
INSERT INTO PersonAddress VALUES (88331,'342 streetC','Monticello','MN');
INSERT INTO PersonAddress VALUES (74591,'999 streetG','Duluth','MN');
INSERT INTO PersonAddress VALUES (NULL,'344 streetA','Monticello','MN');

INSERT INTO SupplierLocation VALUES (7760,'60 steetG','St. Paul','MN');
INSERT INTO SupplierLocation VALUES (7760,'75 streetT','Duluth','MN');
INSERT INTO SupplierLocation VALUES (7761,'6 streetA','St. Paul','MN');
INSERT INTO SupplierLocation VALUES (98760,'798 StreetE','Duluth','MN');

INSERT INTO Address VALUES (10234,'342 streetA','Monticello','MN');
INSERT INTO Address VALUES (11567,'65 streetS','St Cloud','MN');
INSERT INTO Address VALUES (3289,'892 streetM','Minneapolis','MN');
INSERT INTO Address VALUES (17645,'342 streetB','Monticello','MN');
INSERT INTO Address VALUES (88331,'342 streetC','Monticello','MN');
INSERT INTO Address VALUES (74591,'999 streetG','Duluth','MN');
INSERT INTO Address VALUES (74591,'344 streetA','Monticello','MN');
INSERT INTO Address VALUES (7760,'60 steetG','St. Paul','MN');
INSERT INTO Address VALUES (7760,'75 streetT','Duluth','MN');
INSERT INTO Address VALUES (7761,'6 streetA','St. Paul','MN');
INSERT INTO Address VALUES (98760,'798 StreetE','Duluth','MN');

INSERT INTO Person VALUES (10234,'Able');
INSERT INTO Person VALUES (11567,'Baker');
INSERT INTO Person VALUES (3289,'George');
INSERT INTO Person VALUES (88331,'Alice');
INSERT INTO Person VALUES (74591,'Jane');
INSERT INTO Person VALUES (17645,'Bill');



INSERT INTO Employee VALUES (10234,'Able');
INSERT INTO Employee VALUES (11567,'Baker');
INSERT INTO Employee VALUES (3289,'George');
INSERT INTO Employee VALUES (88331,'Alice');

INSERT INTO Customer VALUES (3289,'George');
INSERT INTO Customer VALUES (88331,'Alice');
INSERT INTO Customer VALUES (74591,'Jane');
INSERT INTO Customer VALUES (10234,'Able');

INSERT INTO Supplier VALUES (7760,'ABC-Supply');
INSERT INTO Supplier VALUES (7761,'MyHWCo');
INSERT INTO Supplier VALUES (98760,'LightCo');

INSERT INTO Hardware VALUES (2,'cement','60 lb , bag of cement');
INSERT INTO Hardware VALUES (4,'paint','gallon of white paint');
INSERT INTO Hardware VALUES (10,'nail','2 in nail');
INSERT INTO Hardware VALUES (12,'nail','3 in nail');
INSERT INTO Hardware VALUES (14,'nail','4 in nail');
INSERT INTO Hardware VALUES (16,'bolt','2 in bolt');
INSERT INTO Hardware VALUES (20,'light bulb','40 watt');
INSERT INTO Hardware VALUES (22,'light bulb','60 watt');
INSERT INTO Hardware VALUES (24,'light bulb','10 watt LED');
INSERT INTO Hardware VALUES (26,'light bulb','14 watt LED');
INSERT INTO Hardware VALUES (28,'glaze','16 ounces');
INSERT INTO Hardware VALUES (29,'grill','40lb barbeque');
INSERT INTO Hardware VALUES (30,'key','key blank - type 1');
INSERT INTO Hardware VALUES (32,'key','key blank - type 2');
INSERT INTO Hardware VALUES (34,'grass seed','1 pound');

INSERT INTO Services VALUES (100,'duplicate','type 1 key');
INSERT INTO Services VALUES (101,'duplicate','type 2 key');
INSERT INTO Services VALUES (102,'repair','re-glaze window');
INSERT INTO Services VALUES (103,'rent','seed spreader');

INSERT INTO Items VALUES (2,'cement','60 lb , bag of cement');
INSERT INTO Items VALUES (4,'paint','gallon of white paint');
INSERT INTO Items VALUES (10,'nail','2 in nail');
INSERT INTO Items VALUES (12,'nail','3 in nail');
INSERT INTO Items VALUES (14,'nail','4 in nail');
INSERT INTO Items VALUES (16,'bolt','2 in bolt');
INSERT INTO Items VALUES (20,'light bulb','40 watt');
INSERT INTO Items VALUES (22,'light bulb','60 watt');
INSERT INTO Items VALUES (24,'light bulb','10 watt LED');
INSERT INTO Items VALUES (26,'light bulb','14 watt LED');
INSERT INTO Items VALUES (28,'glaze','16 ounces');
INSERT INTO Items VALUES (29,'grill','40lb barbeque');
INSERT INTO Items VALUES (30,'key','key blank - type 1');
INSERT INTO Items VALUES (32,'key','key blank - type 2');
INSERT INTO Items VALUES (34,'grass seed','1 pound');
INSERT INTO Items VALUES (100,'duplicate','type 1 key');
INSERT INTO Items VALUES (101,'duplicate','type 2 key');
INSERT INTO Items VALUES (102,'repair','re-glaze window');
INSERT INTO Items VALUES (103,'rent','seed spreader');

INSERT INTO HardwareInServiceUse VALUES (100,30);
INSERT INTO HardwareInServiceUse VALUES (101,32);
INSERT INTO HardwareInServiceUse VALUES (102,28);
INSERT INTO HardwareInServiceUse VALUES (103,34);

INSERT INTO CustomerPurchases VALUES (3289,100,2,2);
INSERT INTO CustomerPurchases VALUES (3289,101,1,1);
INSERT INTO CustomerPurchases VALUES (3289,29,1,300);
INSERT INTO CustomerPurchases VALUES (88331,26,32,160);
INSERT INTO CustomerPurchases VALUES (88331,24,2,20);
INSERT INTO CustomerPurchases VALUES (88331,20,2,25);
INSERT INTO CustomerPurchases VALUES (88331,4,7,70);
INSERT INTO CustomerPurchases VALUES (74591,4,3,90);
INSERT INTO CustomerPurchases VALUES (74591,28,1,5);
INSERT INTO CustomerPurchases VALUES (74591,20,4,12);
INSERT INTO CustomerPurchases VALUES (74591,103,1,10);
INSERT INTO CustomerPurchases VALUES (10234,2,25,125);
INSERT INTO CustomerPurchases VALUES (10234,14,100,5);
INSERT INTO CustomerPurchases VALUES (10234,16,150,15);
INSERT INTO CustomerPurchases VALUES (10234,100,1,1);

INSERT INTO Deliveries VALUES (3289,29,'65 streetS','St. Cloud','MN','8/31/21',3289);
INSERT INTO Deliveries VALUES (74591,4,'344 streetA','Monticello','MN','9/10/21',3289);

INSERT INTO PurchaseFromSupplier VALUES (2,7760,50,3);
INSERT INTO PurchaseFromSupplier VALUES (16,7760,1440,0.05);
INSERT INTO PurchaseFromSupplier VALUES (29,7761,10,200);
INSERT INTO PurchaseFromSupplier VALUES (24,98760,100,5);
INSERT INTO PurchaseFromSupplier VALUES (26,98760,250,6);
INSERT INTO PurchaseFromSupplier VALUES (14,7761,20000,0.02);
INSERT INTO PurchaseFromSupplier VALUES (28,7760,288,2);

INSERT INTO EmployeePerformService VALUES (11567,3289,100,'09/09/21',0.1);
INSERT INTO EmployeePerformService VALUES (11567,3289,101,'09/08/21',0.1);
INSERT INTO EmployeePerformService VALUES (10234,10234,100,'09/12/21',0.1);
