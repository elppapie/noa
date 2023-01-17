package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//insert
	public int createReport(Map map) {
		return template.insert("reportInsert",map);
	}

	//페이징을 위한 토탈 레코드 카운트 구하기
	public int getTotalRecordCount(Map map) {
		return template.selectOne("reportGetTotalRecordCount",map);
	}

	//selectList
	public List selectReportList(Map map) {
		return template.selectList("reportSelectListByDate",map);
	}
	
	//read(selectOne)
	public Map findRecordByNo(Map map) {
		
		return template.selectOne("reportSelectOne", map);
	}
	
	//isSameMember
	public String checkMember(Map map) {
		return template.selectOne("reportCheckMember",map);
	}
	
	//edit(update)
	public int update(Map map) {
		int resultUpdate=template.update("reportUpdate",map);
		return resultUpdate;
	}


	//deleteOne - 하나의 리포트 삭제
	public int deleteOne(Map map) {
		int resultDelete = 0;
		template.delete("reportDeleteOne",map);
		return resultDelete;
	}
	
	//deleteList - 리포트 리스트 삭제
	public int deleteList(List list) {
		int resultDelete = 0;
		template.delete("reportDeleteList",list);
		return resultDelete;
	}

	//insertMember
	public int insertMember(List list) {
		return template.insert("reportSetMList",list);
	}

	//selectMember
	public List selectMember(Map map) {
		return template.selectList("reportGetMList",map);
	}

}
