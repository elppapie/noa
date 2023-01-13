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
	
	
	//페이징을 위한 전체 리스트 수 - 검색시 select되는 레코드 수
	public int getTotalRecordCount(Map map) {
		
		return template.selectOne("taskTotalRecordCount",map);
	}

	//selectList
	public List findRecordByName(Map map) {
		
		return template.selectList("selectListById",map);
	}


	//insert
	public int save(Map map) {
		
		return template.insert("taskInsert",map);
	}
	
	
	
	//read(selectOne)
	public Map findRecordByNo(Map map) {
		
		return template.selectOne("selectOne", map);
	}
	
	
	//edit(update)
		public int update(Map map) {
			int resultUpdate=0;
			if(resultUpdate==0) {
				template.update("updateTaskTable",map);
				resultUpdate++;
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
		
		
		
	//delete
	public int deleteByProjNo(Map map) {

		return template.delete("taskDeleteByProjNo",map);
	}
		/*
		public int selectScheNo(int project_no) {
			 int sche_no=-1; 
			 return template.selectOne("taskScheNo", project_no);
		}
		*/
	
	
	
	
}
