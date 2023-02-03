package com.nodearchive.springapp.service.impl;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


//@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MembersDTO {//구성원
	
	private String m_id;
	
	private String emp_code;
	
	private int team_no;
	
	private String m_team_leader;
	
	private String m_dept_leader;
	
	private String position_code;
	
	private String m_name;
	
	private int m_ssn;
	
	private String m_password;
	
	private int m_enabled;
	
	private String m_private_contact;
	
	private String m_private_email;
	
	private String m_emp_contact;
	
	private Date m_hiredate;
	
	private Date m_residate;
	
	private Date m_resigndate;
	 
	private String m_profile_img;
	
	private String m_status;
	
	private String m_profile_msg;
	
	private int  m_spare_annual;

}
