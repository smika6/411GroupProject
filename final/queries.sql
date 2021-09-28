/*problem a) */
SELECT e.ename, a.astreet, a.acity, a.astate
FROM ADDRESS a, CUSTOMER c, EMPLOYEE e
WHERE
a.astreetID = c.customerID AND
a.astreetID = e.employeeID;
