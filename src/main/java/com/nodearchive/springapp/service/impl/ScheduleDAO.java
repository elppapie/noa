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
		System.out.println("[⚜] map에 저장된 아이디:"+map.get("id"));
		System.out.println("[⚜] map에 저장된 시작시간:"+map.get("sche_start"));
		System.out.println("[⚜] map에 저장된 끝시간:"+map.get("sche_end"));
		
		List<Map> listing = template.selectList("scheFindRecordByPeriod", map);
		for(Map mappp : listing) {
			System.out.println("[⚜] mappp에 저장된 아이디:"+mappp.get("id"));
			System.out.println("[⚜] mappp에 저장된 시작시간:"+mappp.get("sche_start"));
			System.out.println("[⚜] mappp에 저장된 끝시간:"+mappp.get("sche_end"));
		};
		return listing;
	}
	
	// 일정 상세보기용(일정 하나 클릭시)
	// 로그인한 사람의 권한 확인
	public Map view(Map map) {
		System.out.println("[ ⚜ DAO 매퍼로 가기 전 ] map의 속성 타이틀"+map.get("sche_title"));
		System.out.println("[ ⚜ DAO 매퍼로 가기 전 ] map의 속성 번호"+map.get("sche_no"));
		System.out.println("[ ⚜ DAO 매퍼로 가기 전 ] map"+map);
		Map mapp = template.selectOne("scheFindRecordByNo",map);
		try {
		System.out.println("[ ⚜ DAO ] mapp의 속성:"+mapp.get("sche_title")); //null 뜬다 왜냐 컬럼명으로 가져온 거라 대문자로 전부 바뀜
		System.out.println("[ ⚜ DAO ] mapp의 속성:"+mapp.get("SCHE_TITLE"));
		}
		catch(NullPointerException e) {
			System.out.println("mapp이 null입니다 === 반환되는 레코드가 없어요 === 참조인 등록 실패가 주 원인일듯");
		}
		return mapp;
	}
	// 일정에 연관된 사람들 가져오기 (1명(본인만 연관된)이어도 가져옴)
	public List findRefByNo(Map map){
		return template.selectList("scheFindRefByNo",map);
	}

	
	// 일정 입력용 - 몇 개의 레코드가 영향을 받는지 반환
	// map에 전달해야 할 것들
	// [1] schedule 테이블의 컬럼별 값
	// [2] "refList"로 저장된 List
	//		id값들(이메일)임
	//		주소록 쿼리문을 사용해서 사람들 목록을 뿌려줘야 할 듯 - view에서
	public int insertSche(Map map) {
		//Schedule 테이블에 레코드 1행 입력
		template.insert("scheInsert",map);
		//입력된 레코드의 DTO 가져오기(일정번호[sche_no] 가져오기용)
		ScheduleDTO scheDto = template.selectOne("scheduleOneToDto",map);
		int sche_no = scheDto.getSche_no();
		//map에 저장된 참조인 리스트 꺼내기
		List<ScheduleDTO> list = (List)map.get("list");
		
		//foreach 사용하려면 list나 배열만 가능.	
		
		
		//list에 저장된 ScheduleDTO들에 sche_no를 setter로 주입
		for(ScheduleDTO sche:list) sche.setSche_no(sche_no);
		
		// for문으로 꺼내서 sche_no 설정한 건 좋은데
		// 그게 list에 반영이 되어있을까???
		// 다시 넣어야 하는건 아니지...?
		
		map.put("list", list);
		
		//일정 참조인 등록 - 그 과정에서 최종 등록된 참조인 레코드 수 반환		
		return template.insert("scheInsertRef",list);
	}
	/*
	// 일정 참조인 입력용 - 몇 개의 레코드가 영향을 받는지 반환
	public int insertRef(Map map) {		
		return template.d e l e t e("scheInsertRef",map);
	}
	*/
	
	
	
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
		//Schedule 테이블에 레코드 1행 입력
		
		System.out.println(" [ 으아아아아아아아아아아아 ]");
		System.out.println("map =================================");
		System.out.println("map.sche_title:"+map.get("sche_title"));
		System.out.println("map.sche_content:"+map.get("sche_content"));
		System.out.println("map.sche_startdate:"+map.get("sche_startdate"));
		System.out.println("map.sche_enddate:"+map.get("sche_enddate"));
		System.out.println("map.sche_color:"+map.get("sche_color"));
		System.out.println("map.sche_status:"+map.get("sche_status"));
		System.out.println("map.sche_no:"+map.get("sche_no"));
		System.out.println("========================================");
		System.out.println(" [ 으아아아아아아아아아아아 ]");
		
		template.update("scheUpdate",map);
		//입력된 레코드의 DTO 가져오기(일정번호[sche_no] 가져오기용)
		ScheduleDTO scheDto = template.selectOne("scheduleOneToDto",map);
		int sche_no = scheDto.getSche_no();
		//map에 저장된 참조인 리스트 꺼내기
		List<ScheduleDTO> list = (List)map.get("list");
		//list에 저장된 ScheduleDTO들에 sche_no를 setter로 주입
		for(ScheduleDTO sche:list) 
			sche.setSche_no(sche_no);

		
		// for문으로 꺼내서 sche_no 설정한 건 좋은데
		// 그게 list에 반영이 되어있을까???
		// 다시 넣어야 하는건 아니지...?
		map.put("list", list);
		
		//일정 참조인 등록 - 그 과정에서 최종 등록된 참조인 레코드 수 반환
		// 먼저 기존 참조인 목록을 가져와서 저장
		// 그냥 해당 sche_no에 해당하는 컬럼들 싸그리 삭제하고 다시 등록하는 게 낫지 않을까
		// 참조인 수가 변할 수도 있고 말이야
		template.delete("scheDeleteRef",map);
		return template.insert("scheInsertRef",list);
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
		List<Map> calendar = null;
		calendar = template.selectList("fullCalendarAllSchedule");
		return calendar;
	}
	
	
	
//	public int saveUser(Map<String, String> map) {
//		// TODO Auto-generated method stub
//		return template.insert("saveUser",map);
//	}
}
