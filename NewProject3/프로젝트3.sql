
/* Drop Triggers */

DROP TRIGGER TRI_BBS_bbsID ;
DROP TRIGGER TRI_reply_replyID ;



/* Drop Tables */

DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP TABLE USER1 CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BBS_bbsID ;
DROP SEQUENCE SEQ_reply_replyID ;




/* Create Sequences */

CREATE SEQUENCE SEQ_BBS_bbsID  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_replyID  INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE BBS
(
	bbsID  number NOT NULL,
	bbsTitle  varchar2(50),
	userID  varchar2(20),
	bbsDATE  varchar2(20),
	bbsContent  varchar2(2000),
	bbsAvailable  number,
	PRIMARY KEY (bbsID )
);


CREATE TABLE reply
(
	userID  varchar2(20),
	replyID  number NOT NULL,
	replyContent  varchar2(20),
	bbsID  number,
	replyAvailable  number,
	PRIMARY KEY (replyID )
);


CREATE TABLE USER1
(
	userID varchar2(20) NOT NULL,
	userPassword varchar2(20),
	userName varchar2(20),
	userGender varchar2(20),
	userEmail varchar2(50),
	PRIMARY KEY (userID)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bbsID )
	REFERENCES BBS (bbsID )
;


ALTER TABLE BBS
	ADD FOREIGN KEY (userID )
	REFERENCES USER1 (userID)
;


ALTER TABLE reply
	ADD FOREIGN KEY (userID )
	REFERENCES USER1 (userID)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_BBS_bbsID  BEFORE INSERT ON BBS
FOR EACH ROW
BEGIN
	SELECT SEQ_BBS_bbsID .nextval
	INTO :new.bbsID 
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reply_replyID  BEFORE INSERT ON reply
FOR EACH ROW
BEGIN
	SELECT SEQ_reply_replyID .nextval
	INTO :new.replyID 
	FROM dual;
END;

/

insert into USER1 (userID, userPassword, userName, userGender, userEmail)
    values('test1', '1111', '테스트원', '남자', 'test1@네이버');
    
insert into USER1 (userID, userPassword, userName, userGender, userEmail)
    values('ttl', '2222', '테스트투', '여자', 'test2@네이버');


commit;

SELECT * FROM REPLY WHERE replyID=1  AND replyAvailable=1 AND bbsID='2'
ORDER BY replyID DESC ; 
