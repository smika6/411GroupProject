
CREATE TABLE PUBLICATION
(
  pid int NOT NULL PRIMARY KEY,
  type varchar(50),
  title varchar(50),
  publish_date date,
  publisher varchar(50)
);

CREATE TABLE AUTHOR
(
  aid int NOT NULL PRIMARY KEY,
  aname varchar(50),
  address varchar(50),
  email varchar(50)
);

CREATE TABLE USER
(
  uid int NOT NULL PRIMARY KEY,
  access varchar(50),
  password varchar(50)
);
 
CREATE TABLE VIEW
(
  pid int,
  uid int,
  view_date date,
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

CREATE TABLE REFERENCES
(
  pid1 int,
  pid2 int,
  FOREIGN KEY(pid1) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(pid2) REFERENCES PUBLICATION(pid)
);



INSERT INTO AUTHOR VALUES (111, 'Ernest Hemingway','907 Whitehead Street, Key West, FL','hemingway.or.the@highway.com');
INSERT INTO AUTHOR VALUES (137, 'Natsume Akatsuki','1345 Shouta, Tokyo, Japan','Jitakukeibihei@kadokawa.com');
INSERT INTO AUTHOR VALUES (156, 'J.K. Rowling', '557 Broadway, New York, NY', 'info@jkrowling.com');
INSERT INTO AUTHOR VALUES (746, 'Michael J. Donahoo', '30 Corporate Dr, Suite 400, Burlington, MA', 'mdonahoo@mkp.com');
INSERT INTO AUTHOR VALUES (645, 'Harry R. Lewis', '1563 Main, Upper Saddle River, NJ', 'hlewis1@prenticehall.com');
