package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	//페이징을 위한 전체 리스트 수 - 검색시 select되는 레코드 수
	public int getTotalRecordCount(Map map) {
		
		return template.selectOne("projectTotalRecordCount",map);
	}

	//selectList
	public List findRecordByName(Map map) {
		
		return template.selectList("selectListById",map);
	}

	//selectOne
	public Map findRecordByNo(Map map) {
		
		return template.selectOne("selectOne", map);
	}
	
	//insert
	public int save(Map map) {
	
		return template.insert("projectInsert",map);
	}
	
	//delete
	public int delete(Map map) {

		return template.delete("delete",map);
	}
	
	public int selectScheNo(Map map) {
		return template.selectOne("projectScheNo", map);
	}
	
	//edit(update)
	public void update(Map map) {
		template.update("updateProjectTable",map);
		template.update("updateScheduleTable",map);
	}
	
	//read(select)
	
}
