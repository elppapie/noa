package com.nodearchive.springapp.service.impl;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@Builder
public class OrganizationDTO {

	private String dept_name; //부서명
	private String m_dept_leader; //부서 책임자
	
	private String team_name; //팀명
	private String m_team_leader; //팀 책임자
	private String[] m_id; //팀원
	
	
	//기업별 부서 + 부서 책임자
	
	//부서별 팀 + 팀 책임자
	
	//팀별 팀원 + 팀 책임자
	
}
