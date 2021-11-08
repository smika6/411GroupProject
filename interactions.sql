
---basic query 1 - names of people who have edited their own writes---

SELECT p.name AS "Self Editing Authors"
FROM Person p
WHERE p.pid IN (SELECT DISTINCT aid FROM EDITS)
AND p.pid IN (SELECT DISTINCT aid FROM WRITES);
    
---basic query 2 - names of people who have not edited or written anything---

SELECT p.name AS "Non Authors"
FROM Person p
WHERE p.pid NOT IN (SELECT aid FROM AUTHOR);
    
---basic query 3 - name of user with the most publication access---
SELECT userid, COUNT(*) AS "Number of Publications"
FROM PUBACCESSES
GROUP BY userid
ORDER BY "Number of Publications" DESC;

---basic query 4 - title and type of publications which had an editor other than the writer ---
SELECT DISTINCT pub.title, pub.type
FROM PUBLICATION pub, WRITES w, EDITS e
WHERE pub.pid = w.pid
AND w.pid <> e.pid;

---basic query 5: show the number of publications for each type---
SELECT type, count(pubid) AS "Number of Publications"
FROM Publication, Publishes
WHERE publishes.pid = publication.pid
GROUP BY type
ORDER BY "Number of Publications";


---STORED PROCEDURE QUERY 1---
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

---STORED PROCEDURE QUERY 2---

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


---STORED PROCEDURE QUERY 3---

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

---STORED PROCEDURE QUERY 4---

CREATE OR REPLACE PROCEDURE accessAllPublications (userID int)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications: ');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (SELECT title, pubcontent FROM Publication p) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessAllPublications(0000);
EXECUTE deleteUserPerson(0000);
*/


---STORED PROCEDURE QUERY 5---

CREATE OR REPLACE PROCEDURE accessWrittenPublications (userID int)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications written by ' || userID || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT title, pubcontent 
                FROM Publication p, Writes w
                WHERE p.pid = w.pid
                AND w.aid = userID) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE accessWrittenPublications(120);

EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessWrittenPublications(0000);
EXECUTE deleteUserPerson(0000);
*/

---STORED PROCEDURE QUERY 6---

CREATE OR REPLACE PROCEDURE accessEditedPublications (userID int)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications edited by ' || userID || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT title, pubcontent 
                FROM Publication p, Edits e
                WHERE p.pid = e.pid
                AND e.aid = userID) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE accessEditedPublications(102);

EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessEditedPublications(0000);
EXECUTE deleteUserPerson(0000);
*/


---STORED PROCEDURE QUERY 7---


CREATE OR REPLACE PROCEDURE accessPublicationsOfType (userID int, type varchar2)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications of type ' || type || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT title, pubcontent 
                FROM Publication p
                WHERE p.type = type) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessPublicationsOfType(0000, 'books');
EXECUTE deleteUserPerson(0000);
*/

---STORED PROCEDURE QUERY 8---

CREATE OR REPLACE PROCEDURE accessPubsOfPublisher (userID int, givenid int)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications from publisher ' || givenid || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT type, title, pubcontent 
                FROM Publication pubs, Publishes p
                WHERE pubs.pid = p.pid
                AND p.pubid = givenid) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Type: ' || cursor.type);
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessPubsOfPublisher(0000, 31677);
EXECUTE deleteUserPerson(0000);
*/


---STORED PROCEDURE QUERY 9---

CREATE OR REPLACE PROCEDURE accessPubsThatReference (userID int, apid int)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications who refernce ' || apid || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT type, title, pubcontent 
                FROM Publication pubs, References r
                WHERE pubs.pid = r.pid1
                AND r.pid2 = apid) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Type: ' || cursor.type);
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessPubsThatReference(0000, 34195);
EXECUTE deleteUserPerson(0000);
*/

---STORED PROCEDURE QUERY 10---

CREATE OR REPLACE PROCEDURE accessPubsofDate (userID int, adate varchar2)
IS
BEGIN

    DBMS_OUTPUT.PUT_LINE('All Publications from date ' || adate || ':');
    DBMS_OUTPUT.PUT_LINE('[');
    
    FOR cursor IN (
                SELECT type, title, pubcontent 
                FROM Publication pubs, Publishes p
                WHERE pubs.pid = p.pid
                AND p.publish_date = adate) 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Type: ' || cursor.type);
    DBMS_OUTPUT.PUT_LINE('Title: ' || cursor.title);
    DBMS_OUTPUT.PUT_LINE('Content: ' || cursor.pubcontent);
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(']');
    
    updatePubAccess(userID);
    
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE accessPubsOfDate(0000, '28-MAR-2015');
EXECUTE deleteUserPerson(0000);
*/



---Stored Procedure NON-QUERY 1---
CREATE OR REPLACE PROCEDURE addUserPerson(id int, useremail varchar2, userpassword varchar2, name varchar2, street varchar2, city varchar2, state varchar2, zip int)
IS
    userPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO userPresent
    FROM USERS u
    WHERE u.USERID = id;
    
    IF (userPresent = 0)
    THEN
        INSERT INTO ADDRESS VALUES (street,city,state,zip);
        INSERT INTO PERSON VALUES (id, name, street);
        INSERT INTO USERS VALUES (id, useremail, userpassword);
        DBMS_OUTPUT.put_line( 'User Added Succesfully! ' );
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add user to the Database, possibly already in the table!' );
    END IF;

END;

---stored procedure NON-QUERY 2---
CREATE OR REPLACE PROCEDURE deleteUserPerson(id int)
IS
    userPresent INTEGER;
    userStreet varchar(150);
BEGIN

    SELECT COUNT(*)
    INTO userPresent
    FROM USERS u
    WHERE u.USERID = id;
    
    IF (userPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete user, already not present!' );
    ELSE
    
        SELECT p.street 
        INTO userStreet
        FROM Person p 
        WHERE p.pid = id;
        
        DELETE
        FROM Users u
        WHERE u.userid = id;
        
        DELETE
        FROM Person p
        WHERE p.pid = id;
        
        DELETE
        FROM Address a
        WHERE a.street = userStreet;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted user!' );
        
    END IF;

END;

/*
EXECUTE deleteUserPerson(0000);
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE deleteUserPerson(0000);
*/

---Stored Procedure NON-QUERY 3---
CREATE OR REPLACE PROCEDURE addPerson(id int, name varchar2, street varchar2, city varchar2, state varchar2, zip int)
IS
    personPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO personPresent
    FROM Person
    WHERE pid = id;
    
    IF (personPresent = 0)
    THEN
        INSERT INTO ADDRESS VALUES (street,city,state,zip);
        INSERT INTO PERSON VALUES (id, name, street);
        DBMS_OUTPUT.put_line( 'Person Added Succesfully! ' );
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add person to the Database, possibly already in the table!' );
    END IF;

END;

---Stored Procedure NON-QUERY 4---
CREATE OR REPLACE PROCEDURE deletePerson(id int)
IS
    personPresent INTEGER;
    personStreet varchar(150);
BEGIN

    SELECT COUNT(*)
    INTO personPresent
    FROM Person
    WHERE pid = id;
    
    IF (personPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete person, already not present!' );
    ELSE
    
        SELECT p.street 
        INTO personStreet
        FROM Person p 
        WHERE p.pid = id;
        
        DELETE
        FROM Person p
        WHERE p.pid = id;
        
        DELETE
        FROM Address a
        WHERE a.street = personStreet;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted person!' );
        
    END IF;

END;

/*
EXECUTE deletePerson(0000);
EXECUTE addPerson(00000, 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE addPerson(00000, 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE deletePerson(0000);
*/

---Stored Procedure NON-QUERY 5---
CREATE OR REPLACE PROCEDURE addUser(id int, useremail varchar2, userpassword varchar2)
IS
    userPresent INTEGER;
    personPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO userPresent
    FROM USERS u
    WHERE u.USERID = id;
    
    SELECT COUNT(*)
    INTO personPresent
    FROM PERSON 
    WHERE pid = id;
    
    IF (personPresent = 1)
    THEN
        IF (userPresent = 0)
        THEN
            INSERT INTO USERS VALUES (id, useremail, userpassword);
            DBMS_OUTPUT.put_line( 'User Added Succesfully! ' );
        ELSE
            DBMS_OUTPUT.put_line( 'Failed to Add User, possibly already present! ' );
        END IF;
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add user to the Database, no such person exists in the parent table!' );
    END IF;

END;

---stored procedure NON-QUERY 6---
CREATE OR REPLACE PROCEDURE deleteUser(id int)
IS
    userPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO userPresent
    FROM USERS u
    WHERE u.USERID = id;
    
    IF (userPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete user, already not present!' );
    ELSE
        
        DELETE
        FROM Users u
        WHERE u.userid = id;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted user!' );
        
    END IF;

END;

/*
EXECUTE addUser(0000, 'test@test.test', 'testpassword');

EXECUTE addPerson(0000, 'testname', '123 test st', 'test', 'ts', 12343);

EXECUTE deleteUser(0000);
EXECUTE addUser(0000, 'test@test.test', 'testpassword');
EXECUTE addUser(0000, 'test@test.test', 'testpassword');
EXECUTE deleteUser(0000);

EXECUTE deletePerson(0000);
*/

---stored procedure NON-QUERY 7---
CREATE OR REPLACE PROCEDURE addAuthor(id int)
IS
    authorPresent INTEGER;
    personPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO authorPresent
    FROM Author a
    WHERE a.aid = id;
    
    SELECT COUNT(*)
    INTO personPresent
    FROM PERSON 
    WHERE pid = id;
    
    IF (personPresent = 1)
    THEN
        IF (authorPresent = 0)
        THEN
            INSERT INTO Author VALUES (id);
            DBMS_OUTPUT.put_line( 'Author Added Succesfully! ' );
        ELSE
            DBMS_OUTPUT.put_line( 'Failed to Add Author, possibly already present! ' );
        END IF;
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add Author to the Database, no such person exists in the parent table!' );
    END IF;

END;

---stored procedure NON-QUERY 8---
CREATE OR REPLACE PROCEDURE deleteAuthor(id int)
IS
    authorPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO authorPresent
    FROM Author a
    WHERE a.aid = id;
    
    IF (authorPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete author, already not present!' );
    ELSE
        
        DELETE
        FROM Author a
        WHERE a.aid = id;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted author!' );
        
    END IF;

END;

/*
EXECUTE addAuthor(0000);

EXECUTE addPerson(0000, 'testname', '123 test st', 'test', 'ts', 12343);

EXECUTE deleteAuthor(0000);
EXECUTE addAuthor(0000);
EXECUTE addAuthor(0000);
EXECUTE deleteAuthor(0000);

EXECUTE deletePerson(0000);
*/


---stored procedure NON-QUERY 9---
CREATE OR REPLACE PROCEDURE addPublisher(id int, name varchar2)
IS
    publisherPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO publisherPresent
    FROM Publisher
    WHERE pubid = id;
    
    IF (publisherPresent = 0)
    THEN
        INSERT INTO Publisher VALUES (id,name);
        DBMS_OUTPUT.put_line( 'Publisher Added Succesfully! ' );
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to Add Publisher, possibly already present! ' );
    END IF;

END;

---stored procedure NON-QUERY 10---
CREATE OR REPLACE PROCEDURE deletePublisher(id int)
IS
    publisherPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO publisherPresent
    FROM Publisher
    WHERE pubid = id;
    
    IF (publisherPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete publisher, already not present!' );
    ELSE
        
        DELETE
        FROM Publisher p
        WHERE p.pubid = id;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted publisher!' );
        
    END IF;

END;

/*
EXECUTE deletePublisher(0000);
EXECUTE addPublisher(0000,'test');
EXECUTE addPublisher(0000,'test');
EXECUTE deletePublisher(0000);
*/

---sql stored procedure non query 11 ---
CREATE OR REPLACE PROCEDURE updatePubAccess (userID int)
IS
    currentDate varchar(50);
BEGIN

    SELECT CURRENT_DATE
    INTO currentDate
    FROM dual;

    INSERT INTO PUBACCESSES VALUES (userID, currentDate);
    
    DBMS_OUTPUT.put_line('PUBACCESS UPDATED FOR ' || userID || ' at ' || currentdate);
END;

/*
EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE updatePubAccess(00000);
EXECUTE deleteUserPerson(0000);
*/

--stored procedure  12--
CREATE OR REPLACE PROCEDURE addPublication (pid int,type varchar2,title varchar2,pubcontent varchar2, apubid int, pubdate varchar2)
IS
    publisherExists INTEGER;
BEGIN
    
    SELECT COUNT(*)
    INTO publisherExists
    FROM PUBLISHER p
    WHERE p.pubid = apubid;

    
    IF (publisherExists = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to add publication, no such publisher!' );
    ELSE
    
        INSERT INTO PUBLICATION VALUES (pid,type,title,pubcontent);
        INSERT INTO PUBLISHES VALUES (pid,apubid,pubdate);
        
        DBMS_OUTPUT.put_line( 'Successfully added publication!' );
        
    END IF;

    
END;

/*
EXECUTE addPublisher(10000,'test');
EXECUTE addPublication(00000, 'test', 'test', 'tes test testestsetset', 10000, '30-JAN-2021');
EXECUTE deletePublisher(10000);
*/

---stored procedure 13---
CREATE OR REPLACE PROCEDURE deletePublication(id int)
IS
    publicationPresent INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO publicationPresent
    FROM Publication
    WHERE pid = id;
    
    IF (publicationPresent = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete publication, already not present!' );
    ELSE
        
        DELETE
        FROM Publication p
        WHERE p.pid = id;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted Publication!' );
        
    END IF;

END;

/*
EXECUTE addPublisher(10000,'test');
EXECUTE addPublication(00000, 'test', 'test', 'tes test testestsetset', 10000, '30-JAN-2021');
EXECUTE deletePublication(0000);
EXECUTE deletePublisher(10000);
*/

--stored procedure  14--
CREATE OR REPLACE PROCEDURE addWriter (apubid int, aaid int)
IS
    writerExists INTEGER;
    authorExists INTEGER;
BEGIN
    
    SELECT COUNT(*)
    INTO writerExists
    FROM Writes w
    WHERE w.aid = aaid;
    
    SELECT COUNT(*)
    INTO authorExists
    FROM Author a
    WHERE a.aid = aaid;
    
    IF (writerExists = 0)
    THEN 
    
        IF (authorExists = 0)
        THEN
            DBMS_OUTPUT.put_line( 'Failed to add writer, author does not exist!' );
        ELSE
            INSERT INTO WRITES VALUES (apubid,aaid);
            DBMS_OUTPUT.put_line( 'Successfully added writer!' );
        END IF;
        
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add writer, possibly already exists!' );
        
    END IF;

    
END;

---stored procedure 15---
CREATE OR REPLACE PROCEDURE deleteWriter(id int)
IS
    writerExists INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO writerExists
    FROM Writes w
    WHERE w.aid = aid;
    
    IF (writerExists = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete writer, already not present!' );
    ELSE
        
        DELETE
        FROM Writes w
        WHERE w.aid = aid;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted writer!' );
        
    END IF;

END;

/*
EXECUTE addWriter(74589,00000);
EXECUTE deleteWriter(00000);

EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE addAuthor(0000);
EXECUTE addWriter(74589,00000);
EXECUTE deleteWriter(00000);
EXECUTE deleteAuthor(0000);
EXECUTE deleteUserPerson(0000);
*/


--stored procedure  16--
CREATE OR REPLACE PROCEDURE addEditor (apubid int, aaid int)
IS
    editorExists INTEGER;
    authorExists INTEGER;
BEGIN
    
    SELECT COUNT(*)
    INTO editorExists
    FROM Edits e
    WHERE e.aid = aaid;
    
    SELECT COUNT(*)
    INTO authorExists
    FROM Author a
    WHERE a.aid = aaid;
    
    IF (editorExists = 0)
    THEN 
    
        IF (authorExists = 0)
        THEN
            DBMS_OUTPUT.put_line( 'Failed to add editor, author does not exist!' );
        ELSE
            INSERT INTO EDITS VALUES (apubid,aaid);
            DBMS_OUTPUT.put_line( 'Successfully added editor!' );
        END IF;
        
    ELSE
        DBMS_OUTPUT.put_line( 'Failed to add editor, possibly already exists!' );
        
    END IF;

    
END;

---stored procedure 17---
CREATE OR REPLACE PROCEDURE deleteEditor(aaid int)
IS
    editorExists INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO editorExists
    FROM Edits e
    WHERE e.aid = aaid;
    
    IF (editorExists = 0)
    THEN
        DBMS_OUTPUT.put_line( 'Failed to delete editor, already not present!' );
    ELSE
        
        DELETE
        FROM Edits e
        WHERE e.aid = aid;
        
        DBMS_OUTPUT.put_line( 'Successfully deleted editor!' );
        
    END IF;

END;

/*
EXECUTE addEditor(74589,00000);
EXECUTE deleteEditor(00000);

EXECUTE addUserPerson(00000, 'test@test.test', 'tespassword', 'testname', '123 test st', 'test', 'ts', 12343);
EXECUTE addAuthor(0000);
EXECUTE addEditor(74589,00000);
EXECUTE deleteEditor(00000);
EXECUTE deleteAuthor(0000);
EXECUTE deleteUserPerson(0000);
*/