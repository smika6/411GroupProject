CREATE TABLE ADDRESS(
  street varchar(50) NOT NULL PRIMARY KEY,
  city varchar(50),
  state varchar(35),
  zip varchar(5)
);

CREATE TABLE PERSON(
  pid int NOT NULL PRIMARY KEY,
  name varchar(50),
  street varchar(50),
  FOREIGN KEY(street) REFERENCES ADDRESS(street)
);

CREATE TABLE AUTHOR (
  aid int NOT NULL PRIMARY KEY,
  FOREIGN KEY(aid) REFERENCES PERSON (pid)
);

CREATE TABLE COAUTHOR(
  caid int NOT NULL PRIMARY KEY,
  FOREIGN KEY(caid) REFERENCES PERSON (pid)
);

CREATE TABLE USERS ( 
  userid int NOT NULL PRIMARY KEY,
  uemail varchar(50),
  upass varchar(50),
  FOREIGN KEY (userid) REFERENCES PERSON (pid)
);

CREATE TABLE PUBLISHER(
  pubid int NOT NULL PRIMARY KEY,
  publisherName varchar(50)
);

CREATE TABLE PUBLICATION(
  pid int NOT NULL PRIMARY KEY,
  pubid int,
  type varchar(50),     /* ex: 'conference proceedings','transactions','journals','books','magazines',etc */
  title varchar(150),
  pubcontent varchar(100),
  FOREIGN KEY(pubid) REFERENCES PUBLISHER(pubid)
);

CREATE TABLE REFERENCES(
  pid1 int,
  pid2 int,
  FOREIGN KEY(pid1) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(pid2) REFERENCES PUBLICATION(pid)
);

CREATE TABLE PUBACCESSES (
  pid int,
  userid int,
  view_date DATE,
  FOREIGN KEY(pid) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(userid) REFERENCES USERS(userid)
);


CREATE TABLE WRITES(
  pid int,
  aid int,
  FOREIGN KEY(pid) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(aid) REFERENCES AUTHOR(aid)
);

CREATE TABLE EDITS(
  pid int,
  aid int,
  FOREIGN KEY(pid) REFERENCES PUBLICATION(pid),
  FOREIGN KEY(aid) REFERENCES AUTHOR(aid)
);

CREATE TABLE PUBLISHES (
  pid int NOT NULL,
  pubid number NOT NULL,
  publish_date DATE,
  FOREIGN KEY (pubid) references PUBLISHER (pubid),
  FOREIGN KEY (pid) references PUBLICATION (pid) ON DELETE CASCADE
);

