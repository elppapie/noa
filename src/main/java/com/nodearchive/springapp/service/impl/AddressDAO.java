package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// 데이터베이스와 연결하여 주소록 관련 CRUD 작업을 하는 DAO
@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public int getTotalRecordCount(Map map) {
		return template.selectOne("addressGetTotalRecordCount", map);
	}

	public List getAllMembers(Map map) {
		return template.selectList("addressGetAllMembers", map);
	}
	
	public List getAllMembersNoPaging(Map map) {
		return template.selectList("addressGetAllMembersNoPaging", map);
	}

	public String getEmpCodeByMId(Map map) {
		return template.selectOne("addressGetEmpCodeByMId", map);
	}

	public Map getEmpInfoByMId(Map map) {
		return template.selectOne("addressGetEmpInfoByMId", map);
	}
	
	public List getDeptOrg(Map map) {
		return template.selectList("addressGetDeptOrg", map);
	}

	public List<Map> getTeamOrg(List deptCodeList) {
		return template.selectList("addressGetTeamOrg", deptCodeList);
	}
	
	public List<Map> getTeamListByDept(String dept_code) {
		return template.selectList("addressGetTeamListByDept", dept_code);
	}

	public List<Map> getTeamMembers(List<Integer> teamNoList) {
		return template.selectList("addressGetTeamMembers", teamNoList);
	}

	public int isMember(MembersDTO dto) {
		System.out.println("dao단: "+dto.getM_id());
		return template.selectOne("addressIsMember",dto);
	}

	public List<Map> getOneTeam(Map map) {
		return template.selectList("addressGetOneTeam",map);
	}

	public Map getOneMemberDetails(Map map) {
		return template.selectOne("addressGetOneMemberDetails", map);
	}

	
	
	
}
