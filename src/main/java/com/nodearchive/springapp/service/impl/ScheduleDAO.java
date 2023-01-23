package com.nodearchive.springapp.service.impl;

import java.util.HashMap;
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
	public List<Map> findRecordByPeriod(Map map) {
		return template.selectList("scheFindRecordByPeriod", map);
	}
	
	// 일정 상세보기용(일정 하나 클릭시)
	// 로그인한 사람의 권한 확인?
	public Map view(Map map) {
		return template.selectOne("scheFindRecordByNo",map);
	}
	
	// 일정에 연관된 사람들 가져오기 (1명(본인만 연관된)이어도 가져옴)
	public List findRefByNo(Map map){
		return template.selectList("scheFindRefByNo",map);
	}

	
	//일정 입력
	public int insertSche(Map map) {
		return template.insert("scheInsert",map);
	}
	
	//가장 최근의 일정 번호 가져오기
	// |인자 없음 |
	public Map selectCurrentSeqNo() {
		// |sche_no 	|
		// |최근 일정 번호  |
		return template.selectOne("scheCurrentSequence");
	}
	
	//일정 입력시 참조인도 입력
	public int insertScheRef(List list) {
		return template.insert("scheInsertRef",list);
	}
	
	
	
	
	
	
	// 일정 삭제용 - 몇 개의 레코드가 영향을 받는지 반환
	// 일정 삭제시 일정 참조인 먼저 삭제해야함.......
	public int delete(Map map) {		
		return template.delete("scheDelete",map);
	}
	
	// 일정 수정용 - 몇 개의 레코드가 영향을 받는지 반환
	// map에 전달해야 할 것들
	// [1] schedule 테이블의 컬럼별 값
	// [2] "refList"로 저장된 List
	//		id값들(이메일)임
	//		주소록 쿼리문을 사용해서 사람들 목록을 뿌려줘야 할 듯 - view에서
	public int updateSche(Map map) {
		return template.update("scheUpdate",map);
	}
	
	//일정 관련 참조인 삭제
	public int deleteRef(Map map) {
		return template.delete("scheDeleteRef",map);
	}
	
	
	
	
	// 일정 완료상태 수정용 - 몇 개의 레코드가 영향을 받는지 반환
	public int updateState(Map map) {
		return template.update("scheUpdateState",map);
	}
/*	
	// 일정이 총 몇 개 검색되는지 확인
	public int getTotalCountRemains(Map map) {
		return template.selectOne("scheTotalCountRemains",map);
	}
*/	
	//fullCalendar 사용
	public List<Map> useFullCalendar() {
		return template.selectList("fullCalendarAllSchedule");
	}
	
	
	
//	public int saveUser(Map<String, String> map) {
//		// TODO Auto-generated method stub
//		return template.insert("saveUser",map);
//	}
}
