package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {	
	//마이바티스 프레임워크와 관련된 빈을 주입 받아 JBDC API를 사용하지 않고 SQL 매퍼인 마이바티스 사용

//	//SqlSessionFactory를 직접 생성하지 않고 주입(DI)하기(데이타 소스로 히카리 사용)	
//	@Autowired
//	private SqlSessionFactory sqlMapper;
	/* 
	 -로그인/목록/입력에 적용해 보자	
	 [스프링에서 지원하는   마이바티스 관련 API(mybatis-spring-2.버전.jar) 사용(마이바티스 코어만 사용)]
	   
		SqlSession타입의 메소드 호출
		.쿼리문이	SELECT 
	              	다중레코드 일때:selectList()
	              	단일 레코드일때:selectOne()
		.쿼리문이 	INSERT - insert()
	         		DELETE - delete()
	         		UPDATE - update()메소드
	     			단,I/D/U일때는 반드시 commit()호출
	 */
	@Autowired
	private SqlSessionTemplate template;
	
	
	// 현재 시스템시간 / 선택한 기간단위별 뷰 뿌려주기용
	public List<ScheduleDTO> findRecordByPeriod(Map map) {		
		
		
		return template.selectList("scheFindRecordByPeriod", map);
	}
	/*
	// 현재 시스템시간 월별 / 선택한 월별 뷰 뿌려주기용
	public List<ScheduleDTO> findRecordByMonth(Map map) {		
		return template.selectList("scheFindRecordByMonth", map);
	}
	// 현재 시스템시간 연도별 / 선택한 연도별 뷰 뿌려주기용
	public List<ScheduleDTO> findRecordByYear(Map map) {		
		return template.selectList("scheFindRecordByYear", map);
	}
	// 현재 시스템시간 주별 / 선택한 주별 뷰 뿌려주기용
	public List<ScheduleDTO> findRecordByWeek(Map map) {		
		return template.selectOne("scheFindRecordByWeek", map);
	}
	*/
	
	// 일정 상세보기용(일정 하나 클릭시)
	// 로그인한 사람의 권한 확인
	public Map view(Map map) {
		return template.selectOne("scheFindRecordByNo", map);
	}
	
	// 일정 삭제용 - 몇 개의 레코드가 영향을 받는지 반환
	public int delete(Map map) {		
		return template.delete("scheDelete",map);
	}
	// 일정 수정용 - 몇 개의 레코드가 영향을 받는지 반환
	public int update(Map map) {
		return template.update("scheUpdate",map);
	}
	
	// 일정이 총 몇 개 검색되는지 확인
	public int getTotalCountRemains(Map map) {
		return template.selectOne("scheTotalCountRemains",map);
	}
//	public int saveUser(Map<String, String> map) {
//		// TODO Auto-generated method stub
//		return template.insert("saveUser",map);
//	}
}
