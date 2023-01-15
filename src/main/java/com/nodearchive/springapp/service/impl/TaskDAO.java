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
		
		return template.selectOne("selectOneTask", map);
	}
	
	//수정용 sche_no 구하는 메소드
	public int selectScheNo(int task_no) {
		 int sche_no=-1; 
		 return template.selectOne("taskScheNo", task_no);
	}
	
	//edit(update)
	public int update(Map map) {
		
		int resultUpdate=0;
		if(resultUpdate==0) {
			template.update("updateTaskTable",map);
			resultUpdate++;
			System.out.println(map.get("sche_no"));
			template.update("updateScheduleTable",map);
			resultUpdate++;
			System.out.println("resultUpdate:"+resultUpdate);
		}
		
		//[TEST]---------------
		//UPDATE 성공 여부 확인용
		switch (resultUpdate) {
		case 0:
		case 1:
			System.out.println("프로젝트 수정 실패 - 테이블 일부만 업데이트 되었습니다");
			break;
		case 2:
			System.out.println("프로젝트 수정 성공");
		default:System.out.println("프로젝트 수정 성공여부를 알 수 없음");
			break;
		}
		//---------------------
		
		return resultUpdate;
	}

	//deleteOne - 하나의 업무 삭제
	public int deleteOne(Map map) {
		int resultDelete = 0;
		template.delete("deleteOneTask",map);
		return resultDelete;
	}
	

	//deleteList - 프로젝트 삭제시 하위 업무 리스트 삭제
	public int deleteList(Map map) {
		int resultDelete = 0;
		template.delete("deleteTaskList",map);
		return resultDelete;
	}
	

}
