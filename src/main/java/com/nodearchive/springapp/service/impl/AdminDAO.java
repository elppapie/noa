package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public List<Map> selectGroupList(Map map) { 
		return template.selectList("getGroupList",map);
	}
	
	//|member_list | (기업의 총 인원 목록)
	public List<Map> selectGroupIdList(Map map) { 
		// List의 각 Map 키값별로 저장된 정보
		//|group_no |group_name |m_id 	 |m_name 	|group_members |
		//|그룹번호	|그룹이름		|그룹장아이디|그룹장이름	|그룹소속인원수	   |
		return template.selectList("getGroupIdList",map);
	}
		
	public List selectMemberOfEmpList(Map map) {
		return template.selectList("getMemberIdFromEmp",map);
	}

	public int enrollDept(Map map) {
		return template.insert("insertDept",map);
	}
	
	public int enrollTeam(Map map) {
		return template.insert("insertTeam",map);
	}
	
	public int enrollPosition(Map map) {
		return template.insert("insertPosition",map);
	}
	
	public void updateTeamLeader(Map map) {
		template.update("updateTeamLeader",map);
	}
	
	public void updateDeptLeader(Map map) {
		template.update("updateDeptLeader",map);
	}
	
	
	
	//public find
	
}
