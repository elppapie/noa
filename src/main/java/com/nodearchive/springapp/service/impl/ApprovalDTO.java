package com.nodearchive.springapp.service.impl;

/*
CREATE TABLE MEMBERS
(
	M_ID varchar2(50) NOT NULL,
	EMP_CODE varchar2(100) NOT NULL,
	TEAM_NO number NOT NULL,
	M_TEAM_LEADER varchar2(50),
	M_DEPT_LEADER varchar2(50),
	M_SSN number(13) NOT NULL,
	M_PASSWORD varchar2(20) NOT NULL,
	M_ENABLED number(1) DEFAULT 1 NOT NULL,
	M_PRIVATE_CONTACT char(11),
	M_PRIVATE_EMAIL varchar2(70),
	M_EMP_CONTACT number(11),
	M_HIREDATE date DEFAULT SYSDATE NOT NULL,
	M_RESIGNDATE date,
	M_PROFILE_IMG nvarchar2(2000),
	M_STATUS nvarchar2(10) DEFAULT '''���''' NOT NULL,
	M_PROFILE_MSG nvarchar2(2000),
	M_SPARE_ANNUAL number(3) NOT NULL,
	PRIMARY KEY (M_ID)
);
 */

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

//@Getter
//@Setter
public class ApprovalDTO {//extends Members{

	private String approval_code;//문서 코드
	private String m_id;//기안자
	private String af_name;//문서양식명
	private String approval_title;//문서 제목
	private String approval_content;//문서 내용
	private Date approval_regidate;//문서 상신일
	private Date approval_update_date;//문서 수정일
	private Date approval_enddate;//최종결재일
	private int approval_delete;//삭제여부
	
	public String getApproval_code() {
		return approval_code;
	}
	public void setApproval_code(String approval_code) {
		this.approval_code = approval_code;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getAf_name() {
		return af_name;
	}
	public void setAf_name(String af_name) {
		this.af_name = af_name;
	}
	public String getApproval_title() {
		return approval_title;
	}
	public void setApproval_title(String approval_title) {
		this.approval_title = approval_title;
	}
	public String getApproval_content() {
		return approval_content;
	}
	public void setApproval_content(String approval_content) {
		this.approval_content = approval_content;
	}
	public Date getApproval_regidate() {
		return approval_regidate;
	}
	public void setApproval_regidate(Date approval_regidate) {
		this.approval_regidate = approval_regidate;
	}
	public Date getApproval_update_date() {
		return approval_update_date;
	}
	public void setApproval_update_date(Date approval_update_date) {
		this.approval_update_date = approval_update_date;
	}
	public Date getApproval_enddate() {
		return approval_enddate;
	}
	public void setApproval_enddate(Date approval_enddate) {
		this.approval_enddate = approval_enddate;
	}
	public int getApproval_delete() {
		return approval_delete;
	}
	public void setApproval_delete(int approval_delete) {
		this.approval_delete = approval_delete;
	}

	
	
}//////////////////////////

/*
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

 */