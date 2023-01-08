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

	public Object getEmpCodeByMId(Map map) {
		return template.selectOne("addressGetEmpCodeByMId", map);
	}
	
	
	
	
	
	
	
}
