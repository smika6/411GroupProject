
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
