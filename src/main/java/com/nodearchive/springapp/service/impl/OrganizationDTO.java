package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrganizationDTO {	
	
	//기업의 부서, 부서책임자
	private List<Map> deptList;
	//부서별 팀, 팀책임자
	private List<Map> teamList;
	//팀별 팀원들
	private List<Map> teamMembersList;
	//그룹 구성원들
	private List<Map> groupMembersList;
}
