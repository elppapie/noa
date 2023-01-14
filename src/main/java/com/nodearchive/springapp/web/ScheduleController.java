package com.nodearchive.springapp.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ScheduleServiceImpl;
import com.nodearchive.springapp.service.impl.ScheduleDTO;

@Controller
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
	
	@Autowired
	private ScheduleServiceImpl scheduleService; 
	
	
	//주간 달력
	@RequestMapping("/week.kosmo")
	public String weekly(
			Model model, //
			//Authentication auth, //스프링 씨큐리티 사용
			@RequestParam Map map, //파라미터로 넘어온 값을 map에 저장
			//현재로서는 접속한 사람의 아이디 전달
			HttpServletRequest req //요청한 페이지의 req객체 받음
			) {
		List<Map> list = scheduleService.selectList(map, req);
		model.addAttribute(list); //?
		
		
		return "schedule/Week.noa";
	}
	
	//월간 달력(메인 - 현재시각을 넘겨줄 수 있으면 그걸 서비스에서 해석하면 되는데)
	//왼쪽 드롭다운에서 줄 주소
	@RequestMapping("/month.kosmo")
	public String monthly(
			Model model, //?
			//Authentication auth, //스프링 씨큐리티 사용
			@RequestParam Map map, //파라미터로 넘어온 값을 map에 저장:접속한 사람의 아이디 전달
			HttpServletRequest req //요청한 페이지의 req객체 받음
			) {
		
////////////////////////////////////// jsp페이지에서 form버튼 클릭해서 input으로 넘기도록 실험해볼 수도 있음 //////////////
		map.put("id", "kim1234@samsung.com");
		map.put("flag", "month");
//////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		List<Map> list = scheduleService.selectList(map, req);
		//model.addAttribute("sche_list",list); //?
/////////////////////////////////////////////////////////////////////
		System.out.println("[⚜] list는 무엇을 담고 있나요"+list.size());
		for(Map map1: list) {
			System.out.printf("[⚜] %s : %s%n","m_name",map1.get("m_name"));
			System.out.printf("[⚜] %s : %s%n","m_id",map1.get("m_id"));
			System.out.printf("[⚜] %s : %s%n","sche_content",map1.get("sche_content"));
			System.out.printf("[⚜] %s : %s%n","sche_title",map1.get("sche_title"));
			System.out.printf("[⚜] %s : %s%n","sche_regidate",map1.get("sche_regidate"));
			System.out.printf("[⚜] %s : %s%n","sche_startdate",map1.get("sche_startdate"));
			System.out.printf("[⚜] %s : %s%n","sche_enddate",map1.get("sche_enddate"));
			System.out.println("================일정 하나 출력 완료=====================");
		}
/////////////////////////////////////////////////////////////////////	
		
		//해당정보를 뷰페이지로 전달
		return "schedule/Month.noa";
	}
	
	//연간 달력
	@RequestMapping("/year.kosmo")
	public String yearly(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Year.noa";
	}
	
	//일정 클릭시
	@RequestMapping("/view.kosmo")
	public String view(
			//Authentication auth,
			@RequestParam Map map
			) {
		
//////////////////////////////////////jsp페이지에서 form버튼 클릭해서 input으로 넘기도록 실험해볼 수도 있음 //////////////
map.put("id", "kim1234@samsung.com");
//map.put("sche_no", "2"); //테스트용 하드코딩
//////////////////////////////////////////////////////////////////////////////////////////////////

			Map oneSchedule = scheduleService.view(map);

//model.addAttribute("sche_list",list); //?
/////////////////////////////////////////////////////////////////////

System.out.printf("[⚜] %s : %s%n","m_name",oneSchedule.get("m_name"));
System.out.printf("[⚜] %s : %s%n","position_name",oneSchedule.get("position_name"));
System.out.printf("[⚜] %s : %s%n","m_id",oneSchedule.get("m_id"));
System.out.printf("[⚜] %s : %s%n","sche_title",oneSchedule.get("sche_title"));
System.out.printf("[⚜] %s : %s%n","sche_regidate",oneSchedule.get("sche_regidate"));
System.out.printf("[⚜] %s : %s%n","sche_startdate",oneSchedule.get("sche_startdate"));
System.out.printf("[⚜] %s : %s%n","sche_enddate",oneSchedule.get("sche_enddate"));
System.out.println("================일정 하나 출력 완료=====================");

/////////////////////////////////////////////////////////////////////	

		//해당 정보를 뷰페이지로 전달

		//return "schedule/View.noa";
		//테스트용 페이지 ↓
		return "schedule/Month.noa";
	}
	
	//일정 입력폼으로 이동(개인일정 디폴트)
	//사람을 map에다가 저장해서 list에다가 담기
	@RequestMapping("/write.kosmo")
	public String write(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Write.noa";
	}
	
	//일정 입력폼 제출하기
	//사람을 map에다가 저장해서 list에다가 담기
	@RequestMapping("/writeOk.kosmo")
	public String writeOk(
			Model model,
			//Authentication auth,
			@RequestParam Map map, // schedule 테이블의 컬럼명을 키값으로 각 입력값 받아옴
			HttpServletRequest request
			) {
		//참조인 목록은 request 영역에 addAttribute로 list로 넣어서 받아와야할듯 - 자스 or request 속성에 하나씩 저장해서 여기서 list로 만들거나
		//Write.jsp 페이지에서 
		// [1] members 테이블 쫙 뿌려주거나(한 명씩 선택할 수 있게)
		// [2] 팀/그룹 단위로 고르게 하거나
////////////////////////////////////// test용 더미데이터 ////////////////////////////////////////////////
		String [] strArr = {"kim1234@samsung.com","song1234@samsung.com","park1234@samsung.com"};
		
		List<ScheduleDTO> list = null;
		for(String str:strArr) {
			ScheduleDTO dto = new ScheduleDTO();
			dto.setM_id(str);
			list.add(dto);
		}
		//참조인 목록(List<ScheduleDTO>) map에 "refList" 키값으로 저장
		map.put("refList", list);
/////////////////////////////////////////////////////////////////////////////////////////////////		
		
		
		scheduleService.insert(map);
		model.addAttribute("message", "입력폼 작성 후 전송(등록)");		
		
		return "schedule/Month.noa";
	}
	
	//일정 수정시
	@RequestMapping("/edit.kosmo")
	public String edit(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Edit.noa";
	}
	
	//일정 검색시
	//ListPagingData.java파일 사용 필요
	@RequestMapping("/search.kosmo")
	public String search(
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Search.noa";
	}
	
	@RequestMapping("/notice.kosmo")
	public String notice(
			//Authentication auth,
			
			) {
		return "schedule/Notice.noa";
	}
	
	
}
