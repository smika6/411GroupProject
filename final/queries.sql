/*problem a) */
SELECT e.ename, a.astreet, a.acity, a.astate
FROM ADDRESS a, CUSTOMER c, EMPLOYEE e
WHERE
a.astreetID = c.customerID AND
a.astreetID = e.employeeID;


/*problem b) */
SELECT i.itemID, i.iname, i.idescription, a.astreet, a.acity, a.astate
FROM ITEMS i, ADDRESS a, DELIVERIES d
WHERE d.streetAddress NOT IN (SELECT a.astreet
                            FROM ADDRESS a, CUSTOMER c
                            WHERE a.astreetID = c.customerID ) 
AND d.streetAddress NOT IN (SELECT a.astreet
                        FROM ADDRESS a, SUPPLIER s
                        WHERE a.astreetID = s.supplierID )
AND i.itemID = d.itemID

AND d.streetAddress = a.astreet;

/*problem c */
SELECT count (distinct a.customerID)  "hardware only customers count"
FROM CustomerPurchases a
LEFT JOIN 
(SELECT cpt.customerID
FROM CustomerPurchases cpt, Services S
WHERE cpt.itemID = s.serviceID) b
ON a.customerID = b.customerID
WHERE b.customerID IS NULL;

/*problem d */
SELECT c.cname, c.customerID, cp.itemID,  cp.price*cp.quantity
FROM CustomerPurchases cp, CUSTOMER c
WHERE
c.customerID = cp.customerID AND
cp.price * cp.quantity = (SELECT MIN(cp.price*cp.quantity)
FROM CustomerPurchases cp, Hardware h
WHERE
cp.itemID = h.hardwareID);

/*problem e */
SELECT DISTINCT c.customerID, c.cname
FROM EmployeePerformService eps, CUSTOMER c
WHERE 
eps.customer_pid = c.customerID
AND
eps.employee_pid != eps.customer_pid;

/*UNTESTED*/

/*problem f*/
SELECT s.serviceID, s.sname, s.sdescription, h.hardwareID, h.hname, h.hdescription
FROM Services s, Hardware h, HardwareInServiceUse hsu
WHERE
hsu.serviceID = s.serviceID
AND
hsu.hardwareID = h.hardwareID;


