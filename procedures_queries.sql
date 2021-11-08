---Jacob---
---STORED PROCEDURE 1---
CREATE OR REPLACE PROCEDURE validateUserAccess(userlogin varchar2, userpassword varchar2)
IS
    grant_access INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO grant_access
    FROM USERS u
    WHERE
        u.uemail = userlogin
    AND
        u.upass = userpassword;

    CASE
    WHEN grant_access = 1
    THEN dbms_output.put_line('ACCESS GRANTED');
    ELSE dbms_output.put_line('ACCESS DENIED');
    END CASE;

END;

/*
EXECUTE validateUserAccess('dohamnes@stcloudstate.edu','Jacob');
EXECUTE validateUserAccess('dohamnes@stcloudstate.edu','WRONG');
EXECUTE validateUserAccess('WRONG','WRONG');
*/

---STORED PROCEDURE 2---

CREATE OR REPLACE PROCEDURE authorIDfromPublicationID (publicationID int)
IS
    authorID INTEGER;
BEGIN

    SELECT DISTINCT w.AID
    INTO authorID
    FROM Writes w
    WHERE publicationID = w.PID;
        
    dbms_output.put_line('The author of publication ' || publicationID || ' is: ' || authorID); 

END;

/*
EXECUTE authorIDfromPublicationID(67651);
*/


---STORED PROCEDURE 3---

CREATE OR REPLACE PROCEDURE trackAuthorByID (authorID int)
IS
    email varchar(150);
    street varchar(150);
    city varchar(50);
    state varchar(25);
    zip varchar(15);
BEGIN

    SELECT u.uemail,a.street,a.city,a.state,a.zip
    INTO email,street,city,state,zip
    FROM Users u, Person p, Address a
    WHERE 
        u.USERID = authorID
    AND
        p.PID = authorID
    AND
        p.street = a.street;
        
    dbms_output.put_line(authorID || ' tracking information: '); 
    dbms_output.put_line(''); 
    
    dbms_output.put_line('Email: '); 
    dbms_output.put_line(email); 
    dbms_output.put_line(''); 
    
    dbms_output.put_line('Address: '); 
    dbms_output.put_line(street);
    dbms_output.put_line(city || ', ' || state);
    dbms_output.put_line(zip);

END;

/*
EXECUTE trackAuthorByID (122);
*/

--Rose-------------------------------
--stored procedure 4
--displays the user who most recently accessed content

CREATE OR REPLACE PROCEDURE MOST_RECENT AS
id INTEGER;
name VARCHAR(50);
title VARCHAR(150);
time DATE;
BEGIN
SELECT* into id, name, title, time
FROM(
SELECT U.userid, P.name, PB.title, PA.view_date 
FROM USERS U, PERSON P, PUBLICATION PB, PUBACCESSES PA
WHERE U.userid = P.pid AND
      PA.pid = PB.pid AND
      U.userid = PA.userid
ORDER BY PA.view_date DESC)
WHERE rownum <= 1;
 dbms_output.put_line('ID'||'     NAME'||'             TITLE'||'                           DATE');
 dbms_output.put_line(id||'   '||name||'  '||title||'   '||time);
END;


EXECUTE MOST_RECENT;

--Justification: It makes sure all the ids match up together and then sorts the dates in decending order to get the most recent
--date on the top then outputs the id, name, title, and date.
