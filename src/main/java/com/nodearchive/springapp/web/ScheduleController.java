package com.nodearchive.springapp.web;

import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//@Controller
@RequestMapping("/Schedule")
public class ScheduleController {
	
	// 타일즈 Side.jsp 클릭시 month.kosmo 띄우기 (컨트롤러 url 주소: /Schedule/month.kosmo )
	// week.kosmo, month.kosmo, year.kosmo 3개는 기본 뷰 페이지 요청(상단 버튼 클릭시)
	
	// write.kosmo 는 개인일정 입력페이지 <form태그 - post>
	// 		드롭다운으로 무슨 카테고리의 일정을 입력할 것인지 고르게 하고 각 드롭다운 버튼에 
	// 		개인 일정 / 프로젝트 일정 / 업무 일정 / 회의실 예약 일정 / 근태(연차) 일정 / 전자결재 일정 고르게 하고 
	//		각 입력 페이지로 forward 시켜서 값 입력된거 받아오기
	// 		프로젝트/업무 일정에서 부서/팀 내용이 나오는 거고
	
	// view.kosmo 는 일정 클릭시 나타나는 상세보기 페이지 요청
	
	// edit.kosmo 는 상세보기 페이지에서 수정페이지 요청 <a태그 - get>
	
	
	// [ 기본 전달 값 ] 
	// 일정 입력자(현재 로그인한 사람)는 SCH_REF 컬럼에 저장하기
	// 일정 입력자와 현재 시스템 시간 hidden으로 전달하기
	// 현재 시스템 시간 해석 코드는 Service에 넣기
	
	// [ 일정의 위치 해석 ]
	// 기본 달력 띄우기 - 각각 날짜들의 날짜를 id값으로 추가 --> forEach로 td를 뿌려도 지정 가능하도록... 아니면 text(value)값을 추적할까
	// 기본 달력 위에 일정 띄우기
	
	// 디자인은 table - webapp/resources/pages/tables/basic-table/html 에서 디자인 가져오기
	// [1] API로 태그 한줄로 가져올지 - 커스터마이징 기능 있는 API여야 함
	// [2] 직접 table tr 월 화 수 목 금 토 일 /tr 폼을 가져와서 js로 설정할지 
	
	//주간 달력
	@RequestMapping("/week.kosmo")
	public String weekly(
			//Authentication auth,
			@RequestParam Map map
			) {
		
		
		return "schedule/Week";
	}
	
	//월간 달력(메인)
	//왼쪽 드롭다운에서 줄 주소
	@RequestMapping("/month.kosmo")
	public String monthly(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Month";
	}
	
	//연간 달력
	@RequestMapping("/year.kosmo")
	public String yearly(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Year";
	}
	
	//일정 등록시(개인-디폴트)
	@RequestMapping("/write.kosmo")
	public String write(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Write";
	}
	
	//일정 클릭시
	@RequestMapping("/view.kosmo")
	public String view(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/View";
	}
	
	//일정 수정시
	@RequestMapping("/edit.kosmo")
	public String edit(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Edit";
	}
	
	
	
}
