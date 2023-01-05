package com.nodearchive.springapp.backend;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MembersDTO {
	private String m_id;
	private String emp_code;
	private int team_no;
	private String m_team_leader;
	private String m_dept_leader;
	private int m_ssn;
	private String m_password;
	private int m_enabled;
	
	//전화번호 11자리 Character type
	private Character [] m_private_contact;
	
	private String m_private_email;
	private int m_emp_contact;
	private Date m_hiredate;
	private Date m_resigndate;
	private String m_profile_img;
	private String m_status;
	private String m_profile_msg;
	private int m_spare_annual;
}
