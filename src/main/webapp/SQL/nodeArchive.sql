
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
DROP TABLE GROUP_M_LIST CASCADE CONSTRAINTS;
DROP TABLE EMP_GROUP CASCADE CONSTRAINTS;
DROP TABLE MAIL_M_LIST CASCADE CONSTRAINTS;
DROP TABLE MAIL CASCADE CONSTRAINTS;
DROP TABLE MR_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE PROJ_M_LIST CASCADE CONSTRAINTS;
DROP TABLE TASK_M_LIST CASCADE CONSTRAINTS;
DROP TABLE TASK CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE REPORT_REF CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE SCHE_REF CASCADE CONSTRAINTS;
DROP TABLE VTC_M_LIST CASCADE CONSTRAINTS;
DROP TABLE VTC CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE DEPT CASCADE CONSTRAINTS;
DROP TABLE EMP_ROLES CASCADE CONSTRAINTS;
DROP TABLE MEETRING_ROOM CASCADE CONSTRAINTS;
DROP TABLE POSITION CASCADE CONSTRAINTS;
DROP TABLE EMP CASCADE CONSTRAINTS;
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;




/* Create Tables */

-- 알람
CREATE TABLE ALAM
(
	-- 알람 일련번호
	ALAM_NO number NOT NULL,
	-- 알람 종류
	ALAM_TYPE nvarchar2(20) NOT NULL,
	-- 알람 내용
	ALAM_CONTENT nvarchar2(1000) NOT NULL,
	-- 알람 URL
	ALAM_URL nvarchar2(2000) NOT NULL,
	-- 발생 일시
	ALAM_REGIDATE timestamp DEFAULT SYSDATE NOT NULL,
	-- 확인 여부
	ALAM_CHECK number(1) DEFAULT 0 NOT NULL,
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	PRIMARY KEY (ALAM_NO)
);


-- 연차 사용 기록
CREATE TABLE ANNUAL_USAGE_LIST
(
	-- 연차사용 일련번호
	AUL_NO number NOT NULL,
	-- 문서 코드
	APPROVAL_CODE varchar2(3000) NOT NULL,
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 연차 유형
	AUL_TYPE number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (AUL_NO)
);


-- 전자결재문서
CREATE TABLE APPROVAL
(
	-- 문서 코드
	APPROVAL_CODE varchar2(3000) NOT NULL,
	-- 기안자
	M_ID varchar2(50) NOT NULL,
	-- 문서양식명
	AF_NAME nvarchar2(50),
	-- 문서 제목
	APPROVAL_TITLE nvarchar2(100) NOT NULL,
	-- 문서 내용
	APPROVAL_CONTENT nvarchar2(2000) NOT NULL,
	-- 문서 상신일
	APPROVAL_REGIDATE date DEFAULT SYSDATE NOT NULL,
	-- 문서 수정일
	APPROVAL_UPDATE_DATE date,
	-- 최종결재일
	APPROVAL_ENDDATE date,
	-- 삭제여부
	APPROVAL_DELETE number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (APPROVAL_CODE)
);


-- 전자결재 문서양식
CREATE TABLE APPROVAL_FORM
(
	-- 문서양식명
	AF_NAME nvarchar2(50) NOT NULL,
	-- 문서양식 파일
	AF_FILE nvarchar2(2000) NOT NULL,
	PRIMARY KEY (AF_NAME)
);


-- 결재 참조자
CREATE TABLE APPROVAL_REF
(
	-- 문서 코드
	APPROVAL_CODE varchar2(3000) NOT NULL,
	-- 참조자
	M_ID varchar2(50) NOT NULL,
	-- 문서 확인 상태
	APPREF_STATUS number(1) DEFAULT 0 NOT NULL,
	CONSTRAINT CK_APPREF UNIQUE (APPROVAL_CODE, M_ID)
);


-- 전자결재 결재자
CREATE TABLE APPROVER
(
	-- 문서 코드
	APPROVAL_CODE varchar2(3000) NOT NULL,
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	-- 우선순위
	APPROVER_PRIORITY number(2,0) NOT NULL,
	-- 결재상태
	APPROVER_STATUS number(1) DEFAULT 0 NOT NULL,
	-- 결재일
	APPROVER_APPDATE timestamp
);


-- 첨부파일 목록
CREATE TABLE ATTACHFILE_LIST
(
	-- 파일일련번호
	AFL_NO number NOT NULL,
	-- 파일명
	AFL_NAME nvarchar2(1000) NOT NULL,
	-- 저장경로
	AFL_DIR varchar2(1000) NOT NULL,
	-- 업로드날짜
	AFL_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	PRIMARY KEY (AFL_NO)
);


-- 근태기록
CREATE TABLE ATTENDANCE
(
	-- 근태번호
	ATT_NO number NOT NULL,
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	-- 출근시간
	ATT_STARTDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 퇴근시간
	ATT_ENDDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	PRIMARY KEY (ATT_NO)
);


-- 권한
CREATE TABLE AUTHORITIES
(
	-- 권한 일련번호
	AUTHO_NO number NOT NULL,
	-- 권한명
	AUTHO_NAME nvarchar2(30) NOT NULL,
	PRIMARY KEY (AUTHO_NO)
);


-- 권한부여
CREATE TABLE AUTHO_GRANT
(
	-- 역할코드
	ER_CODE number NOT NULL,
	-- 권한 일련번호
	AUTHO_NO number NOT NULL,
	CONSTRAINT CK_AG UNIQUE (ER_CODE, AUTHO_NO)
);


-- 채팅방
CREATE TABLE CHAT
(
	-- 채팅방일련번호
	CHAT_NO varchar2(2000) NOT NULL,
	-- 채팅방생성자
	M_ID varchar2(50) NOT NULL,
	PRIMARY KEY (CHAT_NO)
);


-- 채팅메세지
CREATE TABLE CHAT_MSG
(
	-- 메세지 일련번호
	CM_NO number NOT NULL,
	-- 메세지작성자
	M_ID varchar2(50) NOT NULL,
	-- 채팅방일련번호
	CHAT_NO varchar2(2000) NOT NULL,
	-- 메세지내용
	CM_CONTENT nvarchar2(2000) NOT NULL,
	-- 메세지 전송시간
	CM_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	PRIMARY KEY (CM_NO)
);


-- 채팅방 참여자 목록
CREATE TABLE CHAT_M_LIST
(
	-- 채팅방 참여자
	M_ID varchar2(50) NOT NULL,
	-- 채팅방일련번호
	CHAT_NO varchar2(2000) NOT NULL,
	CONSTRAINT CK_CML UNIQUE (M_ID, CHAT_NO)
);


-- 부서
CREATE TABLE DEPT
(
	-- 부서코드
	DEPT_CODE varchar2(200) NOT NULL,
	-- 부서명
	DEPT_NAME nvarchar2(30) NOT NULL,
	-- 부서생성일
	DEPT_REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (DEPT_CODE)
);


-- 기업
CREATE TABLE EMP
(
	-- 기업코드
	EMP_CODE varchar2(100) NOT NULL,
	-- 기업명
	EMP_NAME nvarchar2(30) NOT NULL,
	-- 기업주소
	EMP_ADDR nvarchar2(100) NOT NULL,
	-- 기업 등록일
	EMP_REGIDATE date NOT NULL,
	-- 기업 이메일
	EMP_EMAIL varchar2(20) NOT NULL UNIQUE,
	PRIMARY KEY (EMP_CODE)
);


-- 그룹
CREATE TABLE EMP_GROUP
(
	-- 그룹일련번호
	GROUP_NO number NOT NULL,
	-- 그룹장
	M_ID varchar2(50) NOT NULL,
	-- 그룹명
	GROUP_NAME nvarchar2(30) NOT NULL,
	-- 그룹생성일
	GROUP_REGIDATE date DEFAULT SYSDATE NOT NULL,
	-- 구분
	GROUP_SEPARATOR nvarchar2(20) NOT NULL,
	PRIMARY KEY (GROUP_NO)
);


-- 역할
CREATE TABLE EMP_ROLES
(
	-- 역할코드
	ER_CODE number NOT NULL,
	-- 기업코드
	EMP_CODE varchar2(100) NOT NULL,
	-- 역할명
	ER_NAME nvarchar2(30) NOT NULL,
	PRIMARY KEY (ER_CODE)
);


-- 그룹 참여자 목록
CREATE TABLE GROUP_M_LIST
(
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	-- 그룹일련번호
	GROUP_NO number NOT NULL,
	-- 그룹참여일
	GML_REGIDATE date DEFAULT SYSDATE NOT NULL,
	CONSTRAINT CK_GML UNIQUE (M_ID, GROUP_NO)
);


-- 메일
CREATE TABLE MAIL
(
	-- 메일일련번호
	MAIL_NO number NOT NULL,
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	-- 메일 종류
	MAIL_TYPE number(1) NOT NULL,
	-- 메일 제목
	MAIL_TITLE nvarchar2(200) NOT NULL,
	-- 메일 내용
	MAIL_CONTENT nvarchar2(2000) NOT NULL,
	-- 메일 작성일
	MAIL_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 중요메일
	MAIL_MARK number(1) DEFAULT 0 NOT NULL,
	-- 메일읽음
	MAIL_CHECK number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (MAIL_NO)
);


-- 메일 받는구성원 목록
CREATE TABLE MAIL_M_LIST
(
	-- 메일받는사람
	M_ID varchar2(50) NOT NULL,
	-- 메일일련번호
	MAIL_NO number NOT NULL,
	CONSTRAINT CK_MML UNIQUE (M_ID, MAIL_NO)
);


-- 회의실
CREATE TABLE MEETRING_ROOM
(
	-- 회의실 코드
	MR_CODE varchar2(200) NOT NULL,
	-- 기업코드
	EMP_CODE varchar2(100) NOT NULL,
	-- 회의실명
	MR_NAME nvarchar2(50) NOT NULL,
	-- 회의실 정보
	MR_INFO nvarchar2(1000) NOT NULL,
	-- 회의실 상태
	MR_STATUS number(1) DEFAULT 1 NOT NULL,
	PRIMARY KEY (MR_CODE)
);


-- 구성원
CREATE TABLE MEMBERS
(
	-- 아이디
	M_ID varchar2(50) NOT NULL,
	-- 기업코드
	EMP_CODE varchar2(100) NOT NULL,
	-- 팀 일련번호
	TEAM_NO number NOT NULL,
	-- 소속팀 팀장
	M_TEAM_LEADER varchar2(50),
	-- 아이디
	M_DEPT_LEADER varchar2(50),
	-- 주민번호
	M_SSN number(13) NOT NULL,
	-- 비밀번호
	M_PASSWORD varchar2(20) NOT NULL,
	-- 계정상태
	M_ENABLED number(1) DEFAULT 1 NOT NULL,
	-- 개인연락처
	M_PRIVATE_CONTACT char(11),
	-- 개인이메일
	M_PRIVATE_EMAIL varchar2(70),
	-- 사무실번호
	M_EMP_CONTACT number(11),
	-- 입사일
	M_HIREDATE date DEFAULT SYSDATE NOT NULL,
	-- 퇴사일
	M_RESIGNDATE date,
	-- 프로필사진
	M_PROFILE_IMG nvarchar2(2000),
	-- 근무상태
	M_STATUS nvarchar2(10) DEFAULT '출근' NOT NULL,
	-- 상태메세지
	M_PROFILE_MSG nvarchar2(2000),
	-- 남은 연차수
	M_SPARE_ANNUAL number(3) NOT NULL,
	PRIMARY KEY (M_ID)
);


-- 회의식 예약
CREATE TABLE MR_RESERVATION
(
	-- 예약 일련번호
	MRR_NO number NOT NULL,
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 예약 신청자
	M_ID varchar2(50) NOT NULL,
	-- 회의실 코드
	MR_CODE varchar2(200) NOT NULL,
	-- 예약등록일
	MRR_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 예약내용
	MRR_CONTENT nvarchar2(1000) NOT NULL,
	-- 예약상태
	MRR_STATUS number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (MRR_NO)
);


-- 직급
CREATE TABLE POSITION
(
	-- 직급코드
	POSITION_CODE varchar2(200) NOT NULL,
	-- 직급명
	POSITION_NAME nvarchar2(20) NOT NULL,
	-- 기업코드
	EMP_CODE varchar2(100) NOT NULL,
	PRIMARY KEY (POSITION_CODE)
);


-- 프로젝트
CREATE TABLE PROJECT
(
	-- 프로젝트 일련번호
	PROJECT_NO number NOT NULL,
	-- 프로젝트 담당자
	M_ID varchar2(50) NOT NULL,
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 프로젝트명
	PROJECT_NAME nvarchar2(100) NOT NULL,
	PRIMARY KEY (PROJECT_NO)
);


-- 프로젝트 참여자 목록
CREATE TABLE PROJ_M_LIST
(
	-- 프로젝트 일련번호
	PROJECT_NO number NOT NULL,
	-- 프로젝트 참여자
	M_ID varchar2(50) NOT NULL,
	CONSTRAINT CK_PML UNIQUE (PROJECT_NO, M_ID)
);


-- 업무리포트
CREATE TABLE REPORT
(
	-- 리포트 일련번호
	REPORT_NO number NOT NULL,
	-- 리포트 작성자
	M_ID varchar2(50) NOT NULL,
	-- 리포트 생성일
	REPORT_REGIDATE date DEFAULT SYSDATE NOT NULL,
	-- 리포트 시작일
	REPORT_STARTDATE date NOT NULL,
	-- 리포트 종료일
	REPORT_ENDDATE date NOT NULL,
	PRIMARY KEY (REPORT_NO)
);


-- 업무리포트 참조자 목록
CREATE TABLE REPORT_REF
(
	-- 리포트 참조자
	M_ID varchar2(50) NOT NULL,
	-- 리포트 일련번호
	REPORT_NO number NOT NULL,
	-- 참조일
	RR_REGIDATE date DEFAULT SYSDATE NOT NULL
);


-- 일정
CREATE TABLE SCHEDULE
(
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 일정제목
	SCHE_TITLE nvarchar2(100) NOT NULL,
	-- 일정내용
	SCHE_CONTENT nvarchar2(2000) NOT NULL,
	-- 일정 등록시간
	SCHE_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 일정시작시간
	SCHE_STARTDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 일정종료시간
	SCHE_ENDDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	-- 중요표시
	SCHE_MARK number(1) DEFAULT 0 NOT NULL,
	-- 일정상태
	SCHE_STATUS number(1) DEFAULT 0 NOT NULL,
	-- 일정색깔
	SCHE_COLOR varchar2(20) DEFAULT '''white''' NOT NULL,
	PRIMARY KEY (SCHE_NO)
);


-- 일정 참조자 목록
CREATE TABLE SCHE_REF
(
	-- 일정 참조자
	M_ID varchar2(50) NOT NULL,
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 일정 공유일시
	SR_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	CONSTRAINT CK_SR UNIQUE (M_ID, SCHE_NO)
);


-- 업무
CREATE TABLE TASK
(
	-- 업무 일련번호
	TASK_NO number NOT NULL,
	-- 업무 담당자
	M_ID varchar2(50) NOT NULL,
	-- 프로젝트 일련번호
	PROJECT_NO number NOT NULL,
	-- 일정 일련번호
	SCHE_NO number NOT NULL,
	-- 업무명
	TASK_NAME nvarchar2(100) NOT NULL,
	-- 업무내용
	TASK_CONTENT nvarchar2(2000) NOT NULL,
	-- 업무 카테고리
	TASK_CATEGORY number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (TASK_NO)
);


-- 업무 참여자 목록
CREATE TABLE TASK_M_LIST
(
	-- 업무 참여자
	M_ID varchar2(50) NOT NULL,
	-- 업무 일련번호
	TASK_NO number NOT NULL,
	CONSTRAINT CK_TML UNIQUE (M_ID, TASK_NO)
);


-- 팀
CREATE TABLE TEAM
(
	-- 팀 일련번호
	TEAM_NO number NOT NULL,
	-- 부서코드
	DEPT_CODE varchar2(200) NOT NULL,
	-- 팀명
	TEAM_NAME nvarchar2(20) NOT NULL,
	-- 팀 생성일
	TEAM_REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (TEAM_NO)
);


-- 화상회의
CREATE TABLE VTC
(
	-- 화상회의방 일련번호
	VTC_NO number NOT NULL,
	-- 방 생성자
	M_ID varchar2(50) NOT NULL,
	-- 화상회의방 비밀번호
	VTC_PASSWORD varchar2(20),
	-- 방제목
	VTC_TITLE nvarchar2(100) NOT NULL,
	-- 방설명
	VTC_CONTENT nvarchar2(1000) NOT NULL,
	-- 방 생성일
	VTC_REGIDATE timestamp DEFAULT SYSTIMESTAMP NOT NULL,
	PRIMARY KEY (VTC_NO)
);


-- 화상회의 참여자 목록
CREATE TABLE VTC_M_LIST
(
	-- 화상회의 참여자
	M_ID varchar2(50) NOT NULL,
	-- 화상회의방 일련번호
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


ALTER TABLE EMP_ROLES
	ADD FOREIGN KEY (EMP_CODE)
	REFERENCES EMP (EMP_CODE)
;


ALTER TABLE MEETRING_ROOM
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


ALTER TABLE MAIL_M_LIST
	ADD FOREIGN KEY (MAIL_NO)
	REFERENCES MAIL (MAIL_NO)
;


ALTER TABLE MR_RESERVATION
	ADD FOREIGN KEY (MR_CODE)
	REFERENCES MEETRING_ROOM (MR_CODE)
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



