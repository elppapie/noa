package com.nodearchive.springapp.service.impl;

import java.sql.Date;



import lombok.Getter;
import lombok.Setter;


//@Getter
//@Setter
public class ApproverDTO extends ApprovalDTO{//approveDraft

	private String approval_code;//문서 코드
	private String m_id;//아이디
	private int approver_priority;//결재우선순위 0,1,2
	private int approver_status;//결재상태 결재대기:0 결재중:1 결재완료:2 반려:3
	private Date approver_appdate;//결재일
	
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
	public int getApprover_priority() {
		return approver_priority;
	}
	public void setApprover_priority(int approver_priority) {
		this.approver_priority = approver_priority;
	}
	public int getApprover_status() {
		return approver_status;
	}
	public void setApprover_status(int approver_status) {
		this.approver_status = approver_status;
	}
	public Date getApprover_appdate() {
		return approver_appdate;
	}
	public void setApprover_appdate(Date approver_appdate) {
		this.approver_appdate = approver_appdate;
	}
	
	
	
}//////////////
/*
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
 */