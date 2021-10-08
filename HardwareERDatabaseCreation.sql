#CREATETABLE STATEMENTS
CREATE Address TABLE (
    PRIMARY KEY(streetAddress),
    street varchar(255),
    city varchar(255),
    state varchar(2)
);

CREATE PersonAddress TABLE(
    PRIMARY KEY(StreetAddress, City, State, pid)
    

);

CREATE SupplierLocation Table (
    PRIMARY KEY(wsstreetAddress),
    wsstreet varchar(255),
    wscity varchar(255),
    wsstate varchar(2)
);

CREATE Person Table (
    PRIMARY KEY (pid),
    pid varchar(250),
    name varchar(255),
    personAddress varchar(250) FOREIGN KEY REFERENCES (streetAddress, city, state),
    FOREIGN KEY employeeID REFERENCES Employee(employeeID),
    customerID int FOREIGN KEY REFERENCES Customer(customerID),

);

CREATE Employee TABLE (
    PRIMARY KEY(employeeID),
    employeeID varchar(250), 
    name varchar(255),
    employeeAddress varchar(250) FOREIGN KEY REFERENCES (streetAddress, city, state)
    FOREIGN KEY pid References Person(pid),

   **Do we need the customerID in here since its connected to Employee?** customerID int FOREIGN KEY REFERENCES Customer(customerID),
);

CREATE Customer  TABLE(
    PRIMARY KEY(customerID),
    name varchar(255),
    employeeAddress varchar(250) FOREIGN KEY REFERENCES (streetAddress, city, state),
    itemID int FOREIGN KEY REFERENCES Item(itemID)
);

CREATE Supplier TABLE (
    PRIMARY KEY(supplierID),
    supplier_id INTEGER,
    name varchar(255)
);

CREATE Items TABLE(
    PRIMARY KEY(itemID),
    name varchar(255),
    description varchar(255)
);

CREATE Hardware TABLE(
    PRIMARY KEY(hardwareID),
    name varchar(255),
    description varchar(255)
);

CREATE Services TABLE(
    PRIMARY KEY(serviceID),
    name varchar(255),
    description varchar(255)
); 

CREATE HardwareInServiceUse TABLE (
    FOREIGN KEY hardwareID REFERENCES Hardware(hardwareID),
    FOREIGN KEY serviceID REFERENCES Services(serviceID),
);

CREATE CustomerPurchases TABLE (
    customerID int FOREIGN KEY REFERENCES Customer(customerID),
    itemID int FOREIGN KEY REFERENCES Item(itemID),
    quantity int,
    price REAL,
);

CREATE Deliveries TABLE (
    itemID int FOREIGN KEY REFERENCES CustomerPurchases(itemID),
    customerID int FOREIGN KEY REFERENCES CustomerPurchases(customerID),
    employeeID int FOREIGN KEY REFERENCES Employee(EmployeeID),
    deliveryDate charvar(250),
    customerAddress varchar(250) FOREIGN KEY REFERENCES (
        SELECT PA.pstreet, PA.pcity, PA.pstate 
        FROM Customer C, PersonAddress PA
        WHERE C.customerID = PA.pstreetID )
    
    
);

CREATE PurchaseFromSupplier TABLE(
    quantity int,
    unitCost REAL,
    itemID int FOREIGN KEY REFERENCES Item(itemID),
    supplierID int FOREIGN KEY REFERENCES Supplier(supplierID)
);

CREATE EmployeePerformService TABLE (
    hours varchar(10),
    date varchar(40),

    employeeID int FOREIGN KEY REFERENCES Employee(employeeID),
    serviceID int FOREIGN KEY REFERENCES Service(serviceID)

);

#INSERT STATEMENTS 

#Address of Person(pid, streetAddress, city, state):
INSERT INTO PersonAddress (10234,'342 streetA','Monticello','MN');
INSERT INTO PersonAddress (11567,'65 streetS','St Cloud','MN');
INSERT INTO PersonAddress (3289,'892 streetM','Minneapolis','MN');
INSERT INTO PersonAddress (17645,'342 streetB','Monticello','MN');
INSERT INTO PersonAddress (88331,'342 streetC','Monticello','MN');
INSERT INTO PersonAddress (74591,'999 streetG','Duluth','MN');
INSERT INTO PersonAddress (74591,'344 streetA','Monticello','MN');

#Wholesale Suppliers Address (wid, streetAddress, city, state)
INSERT INTO SupplierLocation (7760,'60 steetG','St. Paul','MN');
INSERT INTO SupplierLocation (7760,'75 streetT','Duluth','MN');
INSERT INTO SupplierLocation (7761,'6 streetA','St. Paul','MN');
INSERT INTO SupplierLocation (98760,'798 StreetE','Duluth','MN');

#Employee (pid, name)
INSERT INTO Employee (10234,'Able');
INSERT INTO Employee (11567,'Baker');
INSERT INTO Employee (3289,'George');
INSERT INTO Employee (88331,'Alice');


#Customers (pid, name)
INSERT INTO Customer (3289,'George');
INSERT INTO Customer (88331,'Alice');
INSERT INTO Customer (74591,'Jane');
INSERT INTO Customer (10234,'Able');

#Neither customers nor employees(pid, name)
INSERT INTO Person (17645,'Bill');

#Wholesale Suppliers (wid, name)
INSERT INTO Supplier (7760,'ABC-Supply');
INSERT INTO Supplier (7761,'MyHWCo');
INSERT INTO Supplier (98760,'LightCo');


#Hardware items (iid, name, description)
INSERT INTO Hardware (2,'cement','60 lb , bag of cement');
INSERT INTO Hardware (4,'paint','gallon of white paint');
INSERT INTO Hardware (10,'nail','2 in nail');
INSERT INTO Hardware (12,'nail','3 in nail');
INSERT INTO Hardware (14,'nail','4 in nail');
INSERT INTO Hardware (16,'bolt','2 in bolt');
INSERT INTO Hardware (20,'light bulb','40 watt');
INSERT INTO Hardware (22,'light bulb','60 watt');
INSERT INTO Hardware (24,'light bulb','10 watt LED');
INSERT INTO Hardware (26,'light bulb','14 watt LED');
INSERT INTO Hardware (28,'glaze','16 ounces');
INSERT INTO Hardware (29,'grill','40lb barbeque');
INSERT INTO Hardware (30,'key','key blank - type 1');
INSERT INTO Hardware (32,'key','key blank - type 2');
INSERT INTO Hardware (34,'grass seed','1 pound');

#Services (iid, name, description)
INSERT INTO Services (100,'duplicate','type 1 key');
INSERT INTO Services (101,'duplicate','type 2 key');
INSERT INTO Services (102,'repair','re-glaze window');
INSERT INTO Services (103,'rent','seed spreader');

#ServiceHardwareUse (service-iid, hardware-iid)
INSERT INTO HardwareInServiceUse (100,30);
INSERT INTO HardwareInServiceUse (101,32);
INSERT INTO HardwareInServiceUse (102,28);
INSERT INTO HardwareInServiceUse (103,34);

#Customer purchases (pid, iid, quantity, price)
INSERT INTO CustomerPurchases (3289,100,2,2);
INSERT INTO CustomerPurchases (3289,101,1,1);
INSERT INTO CustomerPurchases (3289,29,1,300);
INSERT INTO CustomerPurchases (88331,26,32,160);
INSERT INTO CustomerPurchases (88331,24,2,20);
INSERT INTO CustomerPurchases (88331,20,2,25);
INSERT INTO CustomerPurchases (88331,4,7,70);
INSERT INTO CustomerPurchases (74591,4,3,90);
INSERT INTO CustomerPurchases (74591,28,1,5);
INSERT INTO CustomerPurchases (74591,20,4,12);
INSERT INTO CustomerPurchases (74591,103,1,10);
INSERT INTO CustomerPurchases (10234,2,25,125);
INSERT INTO CustomerPurchases (10234,14,100,5);
INSERT INTO CustomerPurchases (10234,16,150,15);
INSERT INTO CustomerPurchases (10234,100,1,1);

#Deliveries  (customer pid, iid, streetAddress, city, state, date, employee pid)
INSERT INTO Deliveries (3289,29,'65 streetS','St. Cloud','MN','8/31/21',3289);
INSERT INTO Deliveries (74591,4,'344 streetA','Monticello','MN','9/10/21',3289);

#Wholesale supplier hardware store purchases (iid, wid, quantity, unit-cost)
INSERT INTO PurchaseFromSupplier (2,7760,50,3);
INSERT INTO PurchaseFromSupplier (16,7760,1440,0.05);
INSERT INTO PurchaseFromSupplier (29,7761,10,200);
INSERT INTO PurchaseFromSupplier (24,98760,100,5);
INSERT INTO PurchaseFromSupplier (26,98760,250,6);
INSERT INTO PurchaseFromSupplier (14,7761,20000,0.02);
INSERT INTO PurchaseFromSupplier (28,7760,288,2);

#Employee performed service (employee-pid, customer-pid, iid, date, hours)
INSERT INTO EmployeePerformService (11567,3289,100,'09/09/21',0.1);
INSERT INTO EmployeePerformService (11567,3289,101,'09/08/21',0.1);
INSERT INTO EmployeePerformService (10234,10231,100,'09/12/21',0.1);


#query E

SELECT DISTINCT p.pid, p.name
FROM Person p, Services s, CustomerPurchases cp, Customer c 
WHERE p.pid = c.id 
AND
c.id = cp.id
AND
cp.id = s.id
AND
s.id EXCEPT
(SELECT pe.id
FROM Performs pe
WHERE p.id = pe.id ) 


