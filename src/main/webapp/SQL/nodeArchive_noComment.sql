
/* Drop Tables */

DROP TABLE ALAM CASCADE CONSTRAINTS;
DROP TABLE ANNUAL_USAGE_LIST CASCADE CONSTRAINTS;
DROP TABLE APPROVAL_REF CASCADE CONSTRAINTS;
DROP TABLE APPROVER CASCADE CONSTRAINTS;
DROP TABLE APPROVAL CASCADE CONSTRAINTS;
DROP TABLE APPROVAL_FORM CASCADE CONSTRAINTS;
DROP TABLE ATTACHFILE_LIST CASCADE CONSTRAINTS;
DROP TABLE ATTENDANCE CASCADE CONSTRAINTS;
DROP TABLE AUTHO_GRANT CASCADE CONSTRAINTS;
DROP TABLE AUTHORITIES CASCADE CONSTRAINTS;
DROP TABLE CHAT_MSG CASCADE CONSTRAINTS;
DROP TABLE CHAT_M_LIST CASCADE CONSTRAINTS;
DROP TABLE CHAT CASCADE CONSTRAINTS;
DROP TABLE CHECKLIST CASCADE CONSTRAINTS;
DROP TABLE GROUP_M_LIST CASCADE CONSTRAINTS;
DROP TABLE EMP_GROUP CASCADE CONSTRAINTS;
DROP TABLE MAIL_M_LIST CASCADE CONSTRAINTS;
DROP TABLE MAIL CASCADE CONSTRAINTS;
DROP TABLE MR_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE NOTICE_LINECOMMENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE PROJ_M_LIST CASCADE CONSTRAINTS;
DROP TABLE TASK_M_LIST CASCADE CONSTRAINTS;
DROP TABLE TASK CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE REPORT_REF CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE SCHE_REF CASCADE CONSTRAINTS;
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;
DROP TABLE VTC_M_LIST CASCADE CONSTRAINTS;
DROP TABLE VTC CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE DEPT CASCADE CONSTRAINTS;
DROP TABLE EMP_ROLES CASCADE CONSTRAINTS;
DROP TABLE MEETING_ROOM CASCADE CONSTRAINTS;
DROP TABLE POSITION CASCADE CONSTRAINTS;
DROP TABLE EMP CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ALAM
(
	ALAM_NO number NOT NULL,
	ALAM_TYPE nvarchar2(20) NOT NULL,
	ALAM_CONTENT nvarchar2(1000) NOT NULL,
	ALAM_URL nvarchar2(2000) NOT NULL,
	ALAM_REGIDATE timestamp DEFAULT SYSDATE NOT NULL,
	ALAM_CHECK number(1) DEFAULT 0 NOT NULL,
	M_ID varchar2(50) NOT NULL,
	PRIMARY KEY (ALAM_NO)
);


CREATE TABLE ANNUAL_USAGE_LIST
(
	AUL_NO number NOT NULL,
	APPROVAL_CODE varchar2(3000) NOT NULL,
	SCHE_NO number NOT NULL,
	AUL_TYPE number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (AUL_NO)
);


CREATE TABLE APPROVAL
(
	APPROVAL_CODE varchar2(3000) NOT NULL,
	M_ID varchar2(50) NOT NULL,
	APPROVAL_STATUS varchar2(10) NOT NULL,
	AF_NAME nvarchar2(50),
	APPROVAL_TITLE nvarchar2(100) NOT NULL,
	APPROVAL_CONTENT nvarchar2(2000) NOT NULL,
	APPROVAL_REGIDATE date DEFAULT SYSDATE NOT NULL,
	APPROVAL_UPDATE_DATE date,
	APPROVAL_ENDDATE date,
	APPROVAL_DELETE number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (APPROVAL_CODE)
);


CREATE TABLE APPROVAL_FORM
(
	AF_NAME nvarchar2(50) NOT NULL,
	AF_FILE nvarchar2(2000) NOT NULL,
	PRIMARY KEY (AF_NAME)
);


CREATE TABLE APPROVAL_REF
(
	APPROVAL_CODE varchar2(3000) NOT NULL,
	M_ID varchar2(50) NOT NULL,
	APPREF_STATUS number(1) DEFAULT 0 NOT NULL,
	CONSTRAINT CK_APPREF UNIQUE (APPROVAL_CODE, M_ID)
);


CREATE TABLE APPROVER
(
	APPROVAL_CODE varchar2(3000) NOT NULL,
	M_ID varchar2(50) NOT NULL,
	APPROVER_PRIORITY number(2,0) NOT NULL,
	APPROVER_STATUS varchar2(10) DEFAULT '0' NOT NULL,
	APPROVER_APPDATE timestamp
);


CREATE TABLE ATTACHFILE_LIST
(
	AFL_NO number NOT NULL,
	AFL_NAME nvarchar2(1000) NOT NULL,
	AFL_DIR varchar2(1000) NOT NULL,
	AFL_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	M_ID varchar2(50) NOT NULL,
	PRIMARY KEY (AFL_NO)
);


CREATE TABLE ATTENDANCE
(
	ATT_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	ATT_STARTDATE timestamp DEFAULT SYSTIMESTAMP,
	ATT_ENDDATE timestamp DEFAULT SYSTIMESTAMP,
	ATT_DATE date DEFAULT SYSDATE,
	ATT_WORKTIME number,
	ATT_STATE number,
	PRIMARY KEY (ATT_NO)
);


CREATE TABLE AUTHORITIES
(
	AUTHO_NO number NOT NULL,
	AUTHO_NAME nvarchar2(30) NOT NULL,
	PRIMARY KEY (AUTHO_NO)
);


CREATE TABLE AUTHO_GRANT
(
	ER_CODE number NOT NULL,
	AUTHO_NO number NOT NULL,
	CONSTRAINT CK_AG UNIQUE (ER_CODE, AUTHO_NO)
);


CREATE TABLE CHAT
(
	CHAT_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	CHAT_NAME nvarchar2(30) DEFAULT '새로운 채팅' NOT NULL,
	CHAT_REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (CHAT_NO)
);


CREATE TABLE CHAT_MSG
(
	CM_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	CHAT_NO number NOT NULL,
	CM_CONTENT nvarchar2(2000) NOT NULL,
	CM_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	PRIMARY KEY (CM_NO)
);


CREATE TABLE CHAT_M_LIST
(
	M_ID varchar2(50) NOT NULL,
	CHAT_NO number NOT NULL,
	CML_REGIDATE date DEFAULT SYSDATE NOT NULL,
	CONSTRAINT CK_CML UNIQUE (M_ID, CHAT_NO)
);


CREATE TABLE CHECKLIST
(
	CL_NO number NOT NULL UNIQUE,
	M_ID varchar2(50) NOT NULL,
	CL_CONTENT nvarchar2(50) NOT NULL,
	CL_DEADLINE date DEFAULT SYSDATE NOT NULL,
	CL_CATEGORY nvarchar2(10) NOT NULL,
	CL_EXIST varchar2(10) DEFAULT '''EXIST''' NOT NULL,
	PRIMARY KEY (CL_NO)
);


CREATE TABLE DEPT
(
	DEPT_CODE varchar2(200) NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	DEPT_NAME nvarchar2(30) NOT NULL,
	DEPT_REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (DEPT_CODE)
);


CREATE TABLE EMP
(
	EMP_CODE varchar2(100) NOT NULL,
	EMP_NAME nvarchar2(30) NOT NULL,
	EMP_ADDR nvarchar2(100) NOT NULL,
	EMP_REGIDATE date NOT NULL,
	EMP_EMAIL varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (EMP_CODE)
);


CREATE TABLE EMP_GROUP
(
	GROUP_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	GROUP_NAME nvarchar2(30) NOT NULL,
	GROUP_REGIDATE date DEFAULT SYSDATE NOT NULL,
	GROUP_SEPARATOR nvarchar2(20) NOT NULL,
	PRIMARY KEY (GROUP_NO)
);


CREATE TABLE EMP_ROLES
(
	ER_CODE number NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	ER_NAME nvarchar2(30) NOT NULL,
	PRIMARY KEY (ER_CODE)
);


CREATE TABLE GROUP_M_LIST
(
	M_ID varchar2(50) NOT NULL,
	GROUP_NO number NOT NULL,
	GML_REGIDATE date DEFAULT SYSDATE NOT NULL,
	CONSTRAINT CK_GML UNIQUE (M_ID, GROUP_NO)
);


CREATE TABLE MAIL
(
	MAIL_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	MAIL_TYPE number(1) NOT NULL,
	MAIL_TITLE nvarchar2(200) NOT NULL,
	MAIL_CONTENT nvarchar2(2000) NOT NULL,
	MAIL_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	MAIL_MARK number(1) DEFAULT 0 NOT NULL,
	MAIL_CHECK number(1) DEFAULT 0 NOT NULL,
	MAIL_DELETE number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (MAIL_NO)
);


CREATE TABLE MAIL_M_LIST
(
	M_ID varchar2(50) NOT NULL,
	MAIL_NO number NOT NULL,
	CONSTRAINT CK_MML UNIQUE (M_ID, MAIL_NO)
);


CREATE TABLE MEETING_ROOM
(
	MR_CODE varchar2(200) NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	MR_NAME nvarchar2(50) NOT NULL,
	MR_INFO nvarchar2(1000) NOT NULL,
	MR_STATUS number(1) DEFAULT 1 NOT NULL,
	PRIMARY KEY (MR_CODE)
);


CREATE TABLE MEMBERS
(
	M_ID varchar2(50) NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	TEAM_NO number NOT NULL,
	M_TEAM_LEADER varchar2(50),
	M_DEPT_LEADER varchar2(50),
	POSITION_CODE varchar2(200) NOT NULL,
	ER_CODE number NOT NULL,
	M_NAME nvarchar2(10) NOT NULL,
	M_SSN number(13) NOT NULL,
	M_PASSWORD varchar2(200) NOT NULL,
	M_ENABLED number(1) DEFAULT 1 NOT NULL,
	M_PRIVATE_CONTACT char(11) NOT NULL,
	M_PRIVATE_EMAIL varchar2(70),
	M_EMP_CONTACT number(11),
	M_HIREDATE date DEFAULT SYSDATE NOT NULL,
	M_RESIGNDATE date,
	M_PROFILE_IMG nvarchar2(2000),
	M_STATUS nvarchar2(10) DEFAULT '출근' NOT NULL,
	M_PROFILE_MSG nvarchar2(2000),
	M_SPARE_ANNUAL number(3) NOT NULL,
	PRIMARY KEY (M_ID)
);


CREATE TABLE MR_RESERVATION
(
	MRR_NO number NOT NULL,
	SCHE_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	MR_CODE varchar2(200) NOT NULL,
	MRR_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	MRR_CONTENT nvarchar2(1000) NOT NULL,
	MRR_STATUS number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (MRR_NO)
);


CREATE TABLE NOTICE
(
	N_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	N_TITLE nvarchar2(100) NOT NULL,
	N_CONTENT nvarchar2(2000) NOT NULL,
	N_REGIDATE date NOT NULL,
	N_HITCOUNT number NOT NULL,
	PRIMARY KEY (N_NO)
);


CREATE TABLE NOTICE_LINECOMMENT
(
	NL_NO number NOT NULL,
	N_NO number NOT NULL,
	NL_CONTENT nvarchar2(500) NOT NULL,
	NL_REGIDATE date NOT NULL,
	PRIMARY KEY (NL_NO)
);


CREATE TABLE POSITION
(
	POSITION_CODE varchar2(200) NOT NULL,
	POSITION_NAME nvarchar2(20) NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	PRIMARY KEY (POSITION_CODE)
);


CREATE TABLE PROJECT
(
	PROJECT_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	SCHE_NO number NOT NULL,
	PROJECT_NAME nvarchar2(100) NOT NULL,
	PRIMARY KEY (PROJECT_NO)
);


CREATE TABLE PROJ_M_LIST
(
	PROJECT_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	CONSTRAINT CK_PML UNIQUE (PROJECT_NO, M_ID)
);


CREATE TABLE REPORT
(
	REPORT_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	REPORT_NAME nvarchar2(100) NOT NULL,
	REPORT_COMMENT nvarchar2(2000) NOT NULL,
	REPORT_REGIDATE date DEFAULT SYSDATE NOT NULL,
	REPORT_STARTDATE date NOT NULL,
	REPORT_ENDDATE date NOT NULL,
	PRIMARY KEY (REPORT_NO)
);


CREATE TABLE REPORT_REF
(
	M_ID varchar2(50) NOT NULL,
	REPORT_NO number NOT NULL,
	RR_REGIDATE date DEFAULT SYSDATE NOT NULL
);


CREATE TABLE SCHEDULE
(
	SCHE_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	SCHE_TITLE nvarchar2(100) NOT NULL,
	SCHE_CONTENT nvarchar2(2000) NOT NULL,
	SCHE_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	SCHE_STARTDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	SCHE_ENDDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	SCHE_MARK number(1) DEFAULT 0 NOT NULL,
	SCHE_STATUS number(1) DEFAULT 0 NOT NULL,
	SCHE_COLOR varchar2(20) DEFAULT '''white''' NOT NULL,
	SCHE_TYPE varchar2(10) DEFAULT '''PERSONAL''' NOT NULL,
	PRIMARY KEY (SCHE_NO)
);


CREATE TABLE SCHE_REF
(
	M_ID varchar2(50) NOT NULL,
	SCHE_NO number NOT NULL,
	SR_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	CONSTRAINT CK_SR UNIQUE (M_ID, SCHE_NO)
);


CREATE TABLE TASK
(
	TASK_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	PROJECT_NO number NOT NULL,
	SCHE_NO number NOT NULL,
	TASK_NAME nvarchar2(100) NOT NULL,
	TASK_CONTENT nvarchar2(2000) NOT NULL,
	TASK_CATEGORY number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (TASK_NO)
);


CREATE TABLE TASK_M_LIST
(
	M_ID varchar2(50) NOT NULL,
	TASK_NO number NOT NULL,
	CONSTRAINT CK_TML UNIQUE (M_ID, TASK_NO)
);


CREATE TABLE TEAM
(
	TEAM_NO number NOT NULL,
	DEPT_CODE varchar2(200) NOT NULL,
	TEAM_NAME nvarchar2(20) NOT NULL,
	TEAM_REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (TEAM_NO)
);


CREATE TABLE VTC
(
	VTC_NO number NOT NULL,
	M_ID varchar2(50) NOT NULL,
	VTC_PASSWORD varchar2(20),
	VTC_TITLE nvarchar2(100) NOT NULL,
	VTC_CONTENT nvarchar2(1000) NOT NULL,
	VTC_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	PRIMARY KEY (VTC_NO)
);


CREATE TABLE VTC_M_LIST
(
	M_ID varchar2(50) NOT NULL,
	VTC_NO number NOT NULL,
	CONSTRAINT CK_VML UNIQUE (M_ID, VTC_NO)
);



/* Create Foreign Keys */

ALTER TABLE ANNUAL_USAGE_LIST
	ADD FOREIGN KEY (APPROVAL_CODE)
	REFERENCES APPROVAL (APPROVAL_CODE)
	ON DELETE CASCADE
;


ALTER TABLE APPROVAL_REF
	ADD FOREIGN KEY (APPROVAL_CODE)
	REFERENCES APPROVAL (APPROVAL_CODE)
;


ALTER TABLE APPROVER
	ADD FOREIGN KEY (APPROVAL_CODE)
	REFERENCES APPROVAL (APPROVAL_CODE)
;


ALTER TABLE APPROVAL
	ADD FOREIGN KEY (AF_NAME)
	REFERENCES APPROVAL_FORM (AF_NAME)
	ON DELETE SET NULL
;


ALTER TABLE AUTHO_GRANT
	ADD FOREIGN KEY (AUTHO_NO)
	REFERENCES AUTHORITIES (AUTHO_NO)
;


ALTER TABLE CHAT_MSG
	ADD FOREIGN KEY (CHAT_NO)
	REFERENCES CHAT (CHAT_NO)
	ON DELETE CASCADE
;


ALTER TABLE CHAT_M_LIST
	ADD FOREIGN KEY (CHAT_NO)
	REFERENCES CHAT (CHAT_NO)
;


ALTER TABLE TEAM
	ADD FOREIGN KEY (DEPT_CODE)
	REFERENCES DEPT (DEPT_CODE)
	ON DELETE CASCADE
;


ALTER TABLE DEPT
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
;


ALTER TABLE EMP_ROLES
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
;


ALTER TABLE MEETING_ROOM
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
	ON DELETE CASCADE
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
	ON DELETE CASCADE
;


ALTER TABLE POSITION
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
	ON DELETE CASCADE
;


ALTER TABLE GROUP_M_LIST
	ADD FOREIGN KEY (GROUP_NO)
	REFERENCES EMP_GROUP (GROUP_NO)
;


ALTER TABLE AUTHO_GRANT
	ADD FOREIGN KEY (ER_CODE)
	REFERENCES EMP_ROLES (ER_CODE)
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (ER_CODE)
	REFERENCES EMP_ROLES (ER_CODE)
;


ALTER TABLE MAIL_M_LIST
	ADD FOREIGN KEY (MAIL_NO)
	REFERENCES MAIL (MAIL_NO)
;


ALTER TABLE MR_RESERVATION
	ADD FOREIGN KEY (MR_CODE)
	REFERENCES MEETING_ROOM (MR_CODE)
;


ALTER TABLE ALAM
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE APPROVAL
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE SET NULL
;


ALTER TABLE APPROVAL_REF
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE APPROVER
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE ATTACHFILE_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE SET NULL
;


ALTER TABLE ATTENDANCE
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE CHAT
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE CHAT_MSG
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE SET NULL
;


ALTER TABLE CHAT_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE CHECKLIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE EMP_GROUP
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE SET NULL
;


ALTER TABLE GROUP_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MAIL
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE MAIL_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (M_DEPT_LEADER)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (M_TEAM_LEADER)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE MR_RESERVATION
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE PROJECT
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE PROJ_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE REPORT
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE SET NULL
;


ALTER TABLE REPORT_REF
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE SCHEDULE
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE SCHE_REF
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE TASK
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE TASK_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
;


ALTER TABLE VTC
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE VTC_M_LIST
	ADD FOREIGN KEY (M_ID)
	REFERENCES MEMBERS (M_ID)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_LINECOMMENT
	ADD FOREIGN KEY (N_NO)
	REFERENCES NOTICE (N_NO)
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (POSITION_CODE)
	REFERENCES POSITION (POSITION_CODE)
	ON DELETE SET NULL
;


ALTER TABLE PROJ_M_LIST
	ADD FOREIGN KEY (PROJECT_NO)
	REFERENCES PROJECT (PROJECT_NO)
	ON DELETE CASCADE
;


ALTER TABLE TASK
	ADD FOREIGN KEY (PROJECT_NO)
	REFERENCES PROJECT (PROJECT_NO)
	ON DELETE CASCADE
;


ALTER TABLE REPORT_REF
	ADD FOREIGN KEY (REPORT_NO)
	REFERENCES REPORT (REPORT_NO)
	ON DELETE CASCADE
;


ALTER TABLE ANNUAL_USAGE_LIST
	ADD FOREIGN KEY (SCHE_NO)
	REFERENCES SCHEDULE (SCHE_NO)
;


ALTER TABLE MR_RESERVATION
	ADD FOREIGN KEY (SCHE_NO)
	REFERENCES SCHEDULE (SCHE_NO)
;


ALTER TABLE PROJECT
	ADD FOREIGN KEY (SCHE_NO)
	REFERENCES SCHEDULE (SCHE_NO)
;


ALTER TABLE SCHE_REF
	ADD FOREIGN KEY (SCHE_NO)
	REFERENCES SCHEDULE (SCHE_NO)
;


ALTER TABLE TASK
	ADD FOREIGN KEY (SCHE_NO)
	REFERENCES SCHEDULE (SCHE_NO)
;


ALTER TABLE TASK_M_LIST
	ADD FOREIGN KEY (TASK_NO)
	REFERENCES TASK (TASK_NO)
;


ALTER TABLE MEMBERS
	ADD FOREIGN KEY (TEAM_NO)
	REFERENCES TEAM (TEAM_NO)
	ON DELETE SET NULL
;


ALTER TABLE VTC_M_LIST
	ADD FOREIGN KEY (VTC_NO)
	REFERENCES VTC (VTC_NO)
;



