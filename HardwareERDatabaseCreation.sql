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

# addresses of people(pid, streetAddress, city, state):
INSERT INTO  (10234,"342 streetA","Monticello","MN");
INSERT INTO  (11567,"65 streetS","St Cloud","MN");
INSERT INTO  (3289,"892 streetM","Minneapolis","MN");
INSERT INTO  (17645,"342 streetB","Monticello","MN");
INSERT INTO  (88331,"342 streetC","Monticello","MN");
INSERT INTO  (74591,"999 streetG","Duluth","MN");
INSERT INTO  (,"344 streetA","Monticello","MN");

#wholesale suppliers address (wid, streetAddress, city, state)
INSERT INTO  (7760,"60 steetG","St. Paul","MN");
INSERT INTO  (7760,"75 streetT","Duluth","MN");
INSERT INTO  (7761,"6 streetA","St. Paul","MN");
INSERT INTO  (98760,"798 StreetE","Duluth","MN");

#employees (pid, name)
INSERT INTO  (10234,"Able");
INSERT INTO  (11567,"Baker");
INSERT INTO  (3289,"George");
INSERT INTO  (88331,"Alice");


# customers(pid, name)
INSERT INTO  (3289,"George");
INSERT INTO  (88331,"Alice");
INSERT INTO  (74591,"Jane");
INSERT INTO  (10234,"Able");

#neither customers nor employees(pid, name)
INSERT INTO Person (17645,"Bill");

# Wholesale Suppliers (wid, name)
INSERT INTO  (7760,"ABC-Supply");
INSERT INTO  (7761,"MyHWCo");
INSERT INTO  (98760,"LightCo");


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

#Customer purchases (pid, iid, quantity, price)
INSERT INTO  (3289,100,2,2);
INSERT INTO  (3289,101,1,1);
INSERT INTO  (3289,29,1,300);
INSERT INTO  (88331,26,32,160);
INSERT INTO  (88331,24,2,20);
INSERT INTO  (88331,20,2,25);
INSERT INTO  (88331,4,7,70);
INSERT INTO  (74591,4,3,90);
INSERT INTO  (74591,28,1,5);
INSERT INTO  (74591,20,4,12);
INSERT INTO  (74591,103,1,10);
INSERT INTO  (10234,2,25,125);
INSERT INTO  (10234,14,100,5);
INSERT INTO  (10234,16,150,15);
INSERT INTO  (10234,100,1,1);

#Deliveries  (customer pid, iid, streetAddress, city, state, date, employee pid)
INSERT INTO  (3289,29,"65 streetS","St. Cloud","MN","8/31/21",3289);
INSERT INTO  (74591,4,"344 streetA","Monticello","MN","9/10/21",3289);

# wholesale supplier hardware store purchases (iid, wid, quantity, unit-cost)
INSERT INTO (2,7760,50,3);
INSERT INTO (16,7760,1440,0.05);
INSERT INTO (29,7761,10,200);
INSERT INTO (24,98760,100,5);
INSERT INTO (26,98760,250,6);
INSERT INTO (14,7761,20000,0.02);
INSERT INTO (28,7760,288,2);

#employeed performed servicesice (employee-pid, customer-pid, iid, date, hours)
INSERT INTO (11567,3289,100,"09/09/21",0.1);
INSERT INTO (11567,3289,101,"09/08/21",0.1);
INSERT INTO (10234,10231,100,"09/12/21",0.1);

