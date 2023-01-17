package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	
	//insert
	public int insert(Map map) {
		return template.insert("taskInsert",map);
	}
	
	//read(selectOne)
	public Map findRecordByNo(Map map) {
		return template.selectOne("taskSelectOne", map);
	}
	
	public int getTotalRecordCount(Map map) {
		return template.selectOne("taskTotalRecordCount",map);
	}
	
	//selectList
	public List selectTaskByDate(Map map) {
		return template.selectList("taskSelectListByDate", map);
	}
	
	//수정용 sche_no 구하는 메소드
	public int selectScheNo(int task_no) {
		 int sche_no=-1; 
		 return template.selectOne("taskGetScheNo", task_no);
	}
	
	//edit(update)
	public int update(Map map) {
		
		int resultUpdate=0;
		if(resultUpdate==0) {
			template.update("taskUpdateTTable",map);
			resultUpdate++;
			System.out.println(map.get("sche_no"));
			template.update("taskUpdateSTable",map);
			resultUpdate++;
			System.out.println("resultUpdate:"+resultUpdate);
		}
		return resultUpdate;
	}

	//deleteOne - 하나의 업무 삭제
	public int deleteOne(Map map) {
		int resultDelete = 0;
		template.delete("taskDeleteOne",map);
		return resultDelete;
	}
	
	//deleteList - 프로젝트 삭제시 자동으로 하위 업무 리스트 삭제
	public int deleteList(Map map) {
		int resultDelete = 0;
		template.delete("taskDeleteList",map);
		return resultDelete;
	}

	public String checkMember(Map map) {
		return template.selectOne("taskCheckMember",map);
	}

}
