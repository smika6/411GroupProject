CREATE TABLE PERSON
(
  int pid NOT NULL PRIMARY KEY,
  name varchar(50)
  int aid,
  FOREIGN KEY(aid) REFERENCES ADDRESS(address_id)
);

CREATE TABLE ADDRESS
(
  address_id int NOT NULL PRIMARY KEY,
  street varchar(50),
  city varchar(50),
  state varchar(2),
  zip varchar(5)
);

CREATE TABLE PUBLISHER
(
  int pubid NOT NULL PRIMARY KEY,
  pname varchar(50)
  int aid,
  FOREIGN KEY(aid) REFERENCES ADDRESS(address_id)
);

CREATE TABLE PUBLICATION
(
  pid int NOT NULL PRIMARY KEY,
  type varchar(50),
  title varchar(50),
  publish_date varchar(10),
  pubid int,
  content varchar(250),
  FOREIGN KEY(pubid) REFERENCES PUBLISHER(pubid)
);

CREATE TABLE AUTHOR
(
  aid int NOT NULL PRIMARY KEY,
  aemail varchar(50),
  FOREIGN KEY(aid) REFERENCES PERSON(pid)
);

CREATE TABLE USER
(
  uid int NOT NULL PRIMARY KEY,
  uemail varchar(50),
  access_type varchar(50),
  password varchar(50),
  FOREIGN KEY(uid) REFERENCES PERSON(pid)
);
 
CREATE TABLE VIEW
(
  pid int,
  uid int,
  view_date varchar(10),
  FOREIGN KEY(pid) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(uid) REFERENCES USER(uid)
);

CREATE TABLE WROTE
(
  pid int,
  aid int,
  FOREIGN KEY(pid) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(aid) REFERENCES AUTHOR(aid)
);

CREATE TABLE REFERENCE
(
  pid1 int,
  pid2 int,
  FOREIGN KEY(pid1) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(pid2) REFERENCES PUBLICATION(pid)
);


/*
INSERT INTO AUTHOR VALUES (111, 'Ernest Hemingway','907 Whitehead Street, Key West, FL','hemingway.or.the@highway.com');
INSERT INTO AUTHOR VALUES (137, 'Natsume Akatsuki','1345 Shouta, Tokyo, Japan','Jitakukeibihei@kadokawa.com');
INSERT INTO AUTHOR VALUES (156, 'J.K. Rowling', '557 Broadway, New York, NY', 'info@jkrowling.com');
INSERT INTO AUTHOR VALUES (746, 'Michael J. Donahoo', '30 Corporate Dr, Suite 400, Burlington, MA', 'mdonahoo@mkp.com');
INSERT INTO AUTHOR VALUES (645, 'Harry R. Lewis', '1563 Main, Upper Saddle River, NJ', 'hlewis1@prenticehall.com');
INSERT INTO AUTHOR VALUES (375, 'Christos H. Papadimitiou', '1563 Main, Upper Saddle River, NJ', 'chpapa@prenticehall.com');
INSERT INTO AUTHOR VALUES (876, 'Kenneth L. Calvert', '30 Corporate Dr, Suite 401, Burlington, MA', 'kcalvert@mkp.com');

INSERT INTO USER VALUES (001, 'Patrick Beech', 'admin', '0x15323bcf34');
INSERT INTO USER VALUES (020, 'Kwinton Dropps', 'granted', 'theDrippinDropp$');
INSERT INTO USER VALUES (621, 'Jacob Hopkins', 'fee's due', 'xD9_smika');
INSERT INTO USER VALUES (423, 'Rose Hughes', 'author', 'green_discordFace1');

INSERT INTO PUBLICATION VALUES (133412, 'textbook', 'TCP/IP SOCKETS in C', '03/03/2009', 'MKP', 'This textbook is about sockets in C');
INSERT INTO PUBLICATION VALUES (124953, 'ancient tome', 'Elements of the theory of computation', '05/14/1998', 'Pretence Hall', 'to out daughters...');
INSERT INTO PUBLICATION VALUES (837593, 'literary fiction', 'The old man and the sea', '06/17/1952', 'Charles Scribners Sons', 'Yo its me that old man by the sea.');
INSERT INTO PUBLICATION VALUES (923856, 'light novel', 'Kono Subarashii Sekai ni Shukufuku o! Vol. 1', '12/20/2012', 'Yen Press', 'Oh man, I was hit by a truck... nvm dead.');
INSERT INTO PUBLICATION VALUES (147384, 'fiction', 'Harry Potter and the Stone or something', '11/24/2012', 'Bloomsbury Publishing', 'You are a hairy wizard, Harry');

INSERT INTO WROTE VALUES (837593, 111);
INSERT INTO WROTE VALUES (923856, 137);
INSERT INTO WROTE VALUES (147384, 156);
INSERT INTO WROTE VALUES (124953, 645);
INSERT INTO WROTE VALUES (124953, 876);
INSERT INTO WROTE VALUES (133412, 746);
INSERT INTO WROTE VALUES (133412, 375);

INSERT INTO REFERENCE VALUES (133412, 124953);
INSERT INTO REFERENCE VALUES (124953, 837593);

INSERT INTO VIEW VALUES (837593, 020, '10/22/2021');
INSERT INTO VIEW VALUES (837593, 001, '10/21/2021');
INSERT INTO VIEW VALUES (837593, 001, '10/22/2021');
INSERT INTO VIEW VALUES (123953, 621, '10/14/2021');
INSERT INTO VIEW VALUES (923856, 423, '09/09/2021');
*/
