package com.nodearchive.springapp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nodearchive.springapp.service.AdminServiceImpl;
import com.nodearchive.springapp.service.ScheduleServiceImpl;
import com.nodearchive.springapp.service.impl.OrganizationDTO;
import com.nodearchive.springapp.service.impl.ScheduleDTO;

import lombok.RequiredArgsConstructor;


@Controller 
//대신 RestController사용, 객체 반환시 자동 JSON전환
//@RestController
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@RequiredArgsConstructor
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
	@Autowired
	private AdminServiceImpl adminService;
	
	
	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);

	
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
	@RequestMapping("/month_discard.kosmo")
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
			Model model,
			Authentication auth,
			@RequestParam Map map
			) {
//		System.out.println("안녕 난 view.kosmo야 컨트롤러에 있어");
//		System.out.println("⚜⚜ map이 제대로 넘어왔나? "+map);
//		System.out.println("⚜⚜ map에 저장되어잇나? "+map.get("SCHE_NO"));
		model.addAttribute("oneSchedule",scheduleService.view(map));
//		System.out.println("[ ⚜⚜ 여기서 null이 전달되는지 확인 ⚜⚜ ]");
//		System.out.println("일정타이틀:"+oneSchedule.get("SCHE_TITLE"));
//		System.out.println("일정내용:"+oneSchedule.get("SCHE_CONTENT"));
//		System.out.println("일정시작:"+oneSchedule.get("SCHE_STARTDATE"));
//		System.out.println("일정끝:"+oneSchedule.get("SCHE_ENDDATE"));
//		System.out.println("일정 번호ㅗㅗㅗㅗ:"+oneSchedule.get("SCHE_NO"));
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		map.put("m_id", authenticated.getUsername());
		//map.put("m_id", "kim1234@samsung.com");
		
		model.addAttribute("m_id",map.get("m_id"));
		model.addAttribute("organization", adminService.getOrgAdmin(map));
		model.addAttribute("ref-list", scheduleService.viewRef(map));
		return "schedule/View.noa";
		// "schedule/View.noa"+map.get("SCHE_NO");로 했더니 404에러뜸... 뒤에것이 object타입이라 그런가?
	}
	
	//일정 입력폼으로 이동(개인일정 디폴트)
	//사람을 map에다가 저장해서 list에다가 담기
	@RequestMapping("/write.kosmo")
	public String write(
			Model model,
			Authentication auth,
			@RequestParam Map map
			) {
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		map.put("m_id", authenticated.getUsername());
		//map.put("m_id", "kim1234@samsung.com");
		model.addAttribute("m_id",map.get("m_id"));
		model.addAttribute("organization", adminService.getOrgAdmin(map));
		return "schedule/Write.noa";
	}
	
	//일정 입력폼 제출하기
	//사람을 map에다가 저장해서 list에다가 담기
	@RequestMapping("/writeOk.kosmo")
	public String writeOk(
			Authentication auth,
			Model model,
			@RequestParam(value="ref-list", required=false) String[] memberList,
			@RequestParam Map map, // schedule 테이블의 컬럼명을 키값으로 각 입력값 받아옴
			HttpServletRequest request
			) {
		//참조인 목록은 request 영역에 addAttribute로 list로 넣어서 받아와야할듯 - 자스 or request 속성에 하나씩 저장해서 여기서 list로 만들거나
		//Write.jsp 페이지에서 
		// [1] members 테이블 쫙 뿌려주거나(한 명씩 선택할 수 있게)
		// [2] 팀/그룹 단위로 고르게 하거나
////////////////////////////////////// test용 더미데이터 ////////////////////////////////////////////////
		
		//map.put("m_id", "kim1234@samsung.com");
		//참조인 목록을 대체 어떻게 전달해야하지.....
		//스크립틀릿으로 자바코드로 전달해야하나?
		//String [] strArr = {"kim1234@samsung.com","song1234@samsung.com","park1234@samsung.com"};
/////////////////////////////////////////////////////////////////////////////////////////////////		
		List<String> list = new Vector<>();
		for(String str:memberList) list.add(str);
		
		//입력하는 사람도 참조인 목록에 넣기
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		list.add(authenticated.getUsername());
		
		//참조인 목록(List<ScheduleDTO>) map에 "list" 키값으로 저장
		map.put("list", list);
		int howManyRefs = scheduleService.insert(map);
		model.addAttribute("message", "입력폼 작성 후 전송(등록)");
		System.out.println("[ ⚜ ] 참조인 몇명등록됨? (test때는 3명):"+howManyRefs);
		
		//fullcalendar용 일정 정보 다운받기..하면 안됨 sche_no를 요구하기 때문
		fullcalendar(model, map);

		return "schedule/FullCalendar.noa";
	}
	
	//일정 수정시 - 수정폼으로 이동
	@RequestMapping("/edit.kosmo")
	public String edit(
			Model model,
			//Authentication auth,
			@RequestParam Map map
			) {
		return "schedule/Edit.noa";
	}
	
	//일정 수정폼 작성 후 제출 - 달력폼으로 이동 - 해당 일정 등록된 곳으로??
	@RequestMapping("/editOk.kosmo")
	public String editOk(
			Authentication auth,
			Model model,
			@RequestParam(value="memberList", required=false) String[] memberList,
			@RequestParam Map map //파라미터로 폼의 name=value 저장됨
			) {
		//참조인 목록은 request 영역에 addAttribute로 list로 넣어서 받아와야할듯 - 자스 or request 속성에 하나씩 저장해서 여기서 list로 만들거나
		//Write.jsp 페이지에서 
		// [1] members 테이블 쫙 뿌려주거나(한 명씩 선택할 수 있게)
		// [2] 팀/그룹 단위로 고르게 하거나
////////////////////////////////////// test용 더미데이터 ////////////////////////////////////////////////
		//참조인 목록을 대체 어떻게 전달해야하지.....
		//스크립틀릿으로 자바코드로 전달해야하나?
		//String [] strArr = {"kim1234@samsung.com","song1234@samsung.com","park1234@samsung.com"};
/////////////////////////////////////////////////////////////////////////////////////////////////		
		
		//List<ScheduleDTO>  <====> List<String> 
		//id 저장 + 뒤에가서 sche_no 저장해야 해서 DTO타입이 차라리 낫다
		//근데 알고보니 mybatis foreach구문은 list타입 array타입만 사용가능.... 아니다!!! 공식페이지에서 아니래!!
		//Map 속의 list면 ... 가능하지 않으려나
		List<String> list = new Vector<>();
		for(String str:memberList) list.add(str);
		
		//입력하는 사람도 참조인 목록에 저장
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		list.add(authenticated.getUsername());
		
		//참조인 목록(List<ScheduleDTO>) map에 "list" 키값으로 저장
		map.put("list", list);
		int howManyRefs = scheduleService.update(map);
		model.addAttribute("message", "입력폼 작성 후 전송(등록)");
		System.out.println("[ ⚜ ] 참조인 몇명등록됨? (test때는 3명):"+howManyRefs);
		return "schedule/FullCalendar.noa";
		// 이 페이지에서 fullCalendarData 호출함
	}
	
	//일정 삭제시
	//우와... 23/01/26까지 삭제를 안 생각하고 있었음 - sche_no 전달
	@ResponseBody
	@RequestMapping("/delete.kosmo")
	public int delete(
			//Authentication auth,
			@RequestParam("sche_no") String sche_no
			) {
		//System.out.println("전달된 게 뭔지 보기나 하자: "+sche_no);
		Map map = new HashMap();
		map.put("sche_no", sche_no);
		return scheduleService.delete(map);
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
	
	//은지님 페이지 이동
	@RequestMapping("/notice.kosmo")
	public String notice(
			//Authentication auth,
			
			) {
		return "notice/List.noa";
	}
	
	@RequestMapping("/month.kosmo")
	public String fullcalendar(
			Model model,
			//Authentication auth,
			@RequestParam Map map
			) {
		System.out.println("풀캘린더 만나러 갑니다~~★");
			List<Map> calendar = scheduleService.useFullCalendar();
			model.addAttribute("calendarList",calendar);

		return "schedule/FullCalendar.noa";
	}
	
	@ResponseBody
	@RequestMapping("/oneEvent.kosmo")
	public Map oneEvent(
			Authentication auth,
			//@RequestBody Map map, //sche_no를 전달받음
			@RequestParam("sche_no") String sche_no //sche_no를 전달받음
			//@RequestParam Map map
			) throws JsonProcessingException {
		System.out.println("이벤트 클릭시 모달창이 떠야하는데 그때 sche_no를 전달받아야 하는데");
		//클릭한 일정의 내용 전달받음
		System.out.println("★sche_no 잘 들어왔나용:"+sche_no);
		//임의의 로그인한 자 
		//map.put("m_id", "kim1234@samsung.com");
		Map map_ = new HashMap<>();
		map_.put("sche_no", sche_no);
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		map_.put("m_id", authenticated.getUsername());
		
		
		Map oneSchedule = scheduleService.view(map_);
		
		HashMap<String, Object> hash = new HashMap<>();
        //JSONObject jsonObj = new JSONObject();
        ObjectMapper mapper = new ObjectMapper();
        hash.put("sche_title", oneSchedule.get("sche_title").toString());
        hash.put("sche_content", oneSchedule.get("sche_content").toString());
        hash.put("sche_startdate", oneSchedule.get("sche_startdate").toString());
        hash.put("sche_enddate", oneSchedule.get("sche_enddate").toString());
        hash.put("sche_type", oneSchedule.get("sche_type").toString());
        hash.put("sche_color", oneSchedule.get("sche_color").toString());
        hash.put("sche_status", oneSchedule.get("sche_status").toString());
        
        //로그인한 본인 제거하기
        List list = scheduleService.viewRef(map_);
        list.remove("kim1234@samsung.com");
        //본인 제외한 목록 넣기
        hash.put("ref-list", list);
        
		//map.put("ref-list", scheduleService.viewRef(map));
        //jsonObj = new JSONObject(hash);
        
		
//		model.addAttribute("m_id",map.get("m_id"));
//		model.addAttribute("organization", adminService.getOrgAdmin(map));
//		model.addAttribute("ref-list", scheduleService.viewRef(map));
//		mv.addObject("jsonObj", jsonObj);
//		mv.setViewName("/schedule/FullCalendar.noa");
//		return mv;
//      return mapper.writeValueAsString(hash);
		//return mapper.writeValueAsString(map);
        return hash;
	}
	
	@ResponseBody
	@RequestMapping("/getMember.kosmo")
	public List<Map> memberFromEmp(
				@RequestParam Map map
			) {
		map.put("m_id", "kim1234@samsung.com");
		map.put("emp_code", adminService.getEmpCodeByMId(map));
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        jsonObj = new JSONObject();
        jsonArr.add(jsonObj);
        
        //ObjectMapper mapper = new ObjectMapper();
        //mapper.writeValueAsString(adminService.getMembersFromEmp(map));
        
        for(Map map_:adminService.getMembersFromEmp(map)) {
        	jsonObj = new JSONObject(map_);
        	jsonArr.add(jsonObj);
        }
        log.info("jsonArrCheck: {}", jsonArr);
		return jsonArr;
	}
	
	@ResponseBody
	@RequestMapping("/fullcalendarData.kosmo")
	public List<Map> fullcalendarData() {
			//fullCalendar.jsp에서 이 메소드를 호출해서 정보를 받아옴
			//System.out.println("일단 컨트롤러로 이동은 성공: <c:url> ");
			//구현하고 나서 service로 로직 옮기기
		
			List<Map> calendar = scheduleService.useFullCalendar();
	        JSONObject jsonObj = new JSONObject();
	        JSONArray jsonArr = new JSONArray();
	 
	        HashMap<String, Object> hash = new HashMap<>();
	 
	        for (int i = 0; i < calendar.size(); i++) {	  
	        	hash.put("id", calendar.get(i).get("sche_no").toString());
	            hash.put("title", calendar.get(i).get("sche_title").toString());
	            hash.put("start", calendar.get(i).get("sche_startdate").toString());
	            hash.put("end", calendar.get(i).get("sche_enddate").toString());
	            //엥 toString() 했더니 갑자기 됨
//	            hash.put("time", listAll.get(i).getScheduleTime());
	            String color = calendar.get(i).get("sche_color").toString();
//	            if(!color.contains("#")) { //색깔을 #으로 저장하지 않았을 경우 색깔 정보 #으로 넣기
//	            	switch(color) {
//	            		case "white": color= "#f5f5f5"; break;
//	            		case "blue" : color= "#3944BC"; break;
//	            	}
//	            	
//	            }
	            hash.put("color", color);
////////////////////////////////////////잠시 url 비활성화
	            //hash.put("url", "view.kosmo?sche_no="+calendar.get(i).get("SCHE_NO").toString());
	            //hash.put("url", "oneEvent.kosmo?sche_no="+calendar.get(i).get("sche_no").toString());
	            
	            
	            //System.out.println("그래서 이거 파라미터로 잘 넘어가니???? :"+"view.kosmo?SCHE_NO="+calendar.get(i).get("SCHE_NO").toString());
	            
	            jsonObj = new JSONObject(hash);
	            jsonArr.add(jsonObj);
	        }
	        ////
	        //System.out.println("⚜⚜⚜ JSON에 hash 담기 코드 직후 ⚜⚜⚜");
	        //System.out.println("로그 인포 시작 ");
	        //
	        log.info("jsonArrCheck: {}", jsonArr);
	        ////
	        //System.out.println("로그 인포 끝 ");
	        return jsonArr;
	}
	
}
