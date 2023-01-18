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

	//insert
	public int Insert(Map map) {
		return template.insert("projectInsert",map);
	}
		
	//selectOne
	public Map findRecordByNo(Map map) {
		return template.selectOne("projectSelectOne", map);
	}

	//selectList
	public List findRecordByName(Map map) {
		return template.selectList("projectSelectListById",map);
	}
	
	//페이징을 위한 전체 리스트 수 - 검색시 select되는 레코드 수
	public int getTotalRecordCount(Map map) {		
		return template.selectOne("projectTotalRecordCount",map);
	}

	public int selectScheNo(int project_no) {
		 int sche_no=-1; 
		 return template.selectOne("projectScheNo", project_no);
	}
	
	//edit(update)
	public int update(Map map) {
		int resultUpdate=0;
		if(resultUpdate==0) {
			template.update("projectUpdatePTable",map);
			resultUpdate++;
			template.update("projectUpdateSTable",map);
			resultUpdate++;
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
	
	//삭제 전 회원 체크용
	public String checkMember(Map map) {
		return template.selectOne("projectCheckMember",map);
	}
	
	//delete
	public int projectDelete(Map map) {
		int affected =template.delete("projectDelete",map); 
		return affected;
	}
	
	//insertMember
	public int insertMember(List list) {
		int affected = template.insert("projectSetMList",list);
		return affected;
	}
	
	//selectMember
	public List selectMember(Map map) {
		List mlist = template.selectList("projectGetMList",map);
		return mlist;
	}
	
}
