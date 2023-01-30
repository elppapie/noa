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

	//스프링 씨큐리티용 구성원 입력...
	public int saveUser(Map<String,String> map) {
		return template.insert("saveUser",map);
	}

	public List<Map> selectGroupList(Map map) { 
		return template.selectList("getGroupList",map);
	}
	
	// |emp_code |
	// |기업코드	 | 필요시 select 항목 더 추가하기~~~ 가장 보편적인 기업 구성원 가져오는 메소드
	public List<Map> selectAllMembersFromEmp(Map map){
		
		// |dept_name |team_name |m_name |position_name 
		// |부서명	  |팀명		 |이름	 |직급			
		// |m_id |m_private_contact |m_profile_img |m_hiredate |m_resigndate |m_enabled |
		// |아이디 |연락처(전화번호)		|프로필사진(저장위치)|고용일	   |사임일		 |계정활성화여부 |
		return template.selectList("getMemberFromEmp",map);
	}
	
	//|member_list | (기업의 총 인원 목록) 넣어주기
	public List<Map> selectGroupIdList(Map map) { 
		// List의 각 Map 키값별로 저장된 정보
		//|group_no |group_name |m_id 	 |m_name 	|group_members |
		//|그룹번호	|그룹이름		|그룹장아이디|그룹장이름	|그룹소속인원수	   |
		return template.selectList("getGroupIdList",map);
	}
	//|emp_code | (기업코드) 
	public List selectMemberOfEmpList(Map map) {
		//|member_list | (기업의 총 인원 목록)
		return template.selectList("getMemberIdFromEmp",map);
	}
	
	// |emp_code | (기업 코드)
	public List<Map> getDeptOrg(Map map) {
		// |dept_code |dept_name |dept_leader_id |dept_leader_name |
		// |부서코드	  |부서이름 	 |부서리더 아이디	 |부서리더 이름		   |
		// |dept_leader_contact |dept_regidate |dept_members |
		// |부서리더 연락처(번호) 	|부서 생성일 	   |부서소속인원수	 |
		return template.selectList("adminGetDeptOrg", map);
	}
	
	// |dept_code_list | 기업의 부서코드 목록
	public List<Map> getTeamOrg(List deptCodeList) {
		// |team_no |team_name |dept_code |dept_name |team_leader_id |
		// |팀번호	|팀이름	   |부서코드 	  |부서이름 	 |팀리더 아이디
		// |team_leader_name |team_leader_contact |team_regidate |
		// |팀리더 이름			 |팀리더 연락처(번호)		  |팀 생성일 		 |
		return template.selectList("adminGetTeamOrg", deptCodeList);
	}
	
	//부서별 팀(이름) 가져오기 라는 헛된 꿈
	
	//부서 소속 인원수
	// |emp_code | 기업코드 넣고 각 부서별 인원수 얻기
	public List<Map> getDeptMemberNum(Map map){
		// |dept_code |dept_member_count|
		// |부서코드 	  |부서소속사람(수) 		|
		return template.selectList("adminGetDeptMemberNum",map);
	}
	
	//팀 소속 인원수
	// |emp_code | 기업코드 넣고 각 팀별 인원수 얻기
	public List<Map> getTeamMemberNum(Map map){
		// |dept_code |team_no   |team_member_count|
		// |부서코드 	  |팀번호		 |팀소속사람(수) 	   |
		return template.selectList("adminGetTeamMemberNum",map);
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
