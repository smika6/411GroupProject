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

