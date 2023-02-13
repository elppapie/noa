package com.nodearchive.springapp.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.ReportService;
import com.nodearchive.springapp.service.TaskService;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Report")
public class ReportController {

	@Autowired
	private ReportService<Map> reportService;
	@Autowired
	private ProjectService<Map> projectService;
	@Autowired
	private TaskService<Map> taskService;
	
	//리포트 생성(post) - 테스트 완
	@RequestMapping("/create.kosmo")
	public String createReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
	
		int createReport = reportService.insert(map);
		model.addAttribute("createReport", createReport);
		//리포트 상세 보기 페이지로 이동
		return "report/view.noa";
	}
	
	//리포트 목록(get) - 테스트 완
	@RequestMapping("/list.kosmo")
	public String reportMain(
			Authentication auth,
			HttpServletRequest req,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			@RequestParam Map map, 
			Model model) throws ParseException {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername());
				
		//Project / Task 쪽에서 받는 데이터
		ListPagingData<Map> selectTaskList = taskService.selectList(map, req, nowPage);
		
		//업무별 마감일 기준 d-day 계산값 
		List<Map> tasklists = selectTaskList.getLists();
		for(Map list:tasklists) {
			String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 오늘날
			String endDateFm = list.get("SCHE_ENDDATE").toString();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date enddate = new Date(dateFormat.parse(endDateFm).getTime()); 
			Date today = new Date(dateFormat.parse(todayFm).getTime());
			long calculate = enddate.getTime() - today.getTime();
			int Ddays = (int) (calculate / (24*60*60*1000));
			list.put("Ddays", Ddays);
			System.out.println("두 날짜 차이일 : " + Ddays);
		}
		
		model.addAttribute("selectTaskList", selectTaskList);
		model.addAttribute("selectListCheck",projectService.selectListCheck(map,req));
		
		ListPagingData<Map> selectListReport = reportService.selectList(map, req, nowPage);
		model.addAttribute("selectListReport", selectListReport);
		//리포트 목록
		return "project/Report.noa";
	}
	
	//리포트 상세보기(get) - 테스트 완
	@RequestMapping("/view.kosmo")
	public String viewReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		Map selectOneReport = reportService.selectOne(map);
		model.addAttribute("selectOneReport", selectOneReport);
		//리포트 상세 보기 페이지로 이동
		return "report/view.noa";
	}
		
	
	//리포트 수정(post) - 테스트 완
	@RequestMapping("/edit.kosmo")
	public String updateReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int updateReport = reportService.update(map);
		model.addAttribute("updateReport", updateReport);
		//리포트 상세 보기 페이지로 이동
		return "report/view.noa";
	}
	
	//리포트 하나 삭제(post) - 테스트 완
	@RequestMapping("/delete.kosmo")
	public String deleteReportOne(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int deleteReportOne = reportService.deleteOne(map);
		model.addAttribute("deleteReportOne", deleteReportOne);
		//리포트 상세 보기 페이지로 이동
		return "report/list.noa";
	}
	
	//리포트 리스트 삭제(post) 테스트 완
	@RequestMapping("/deleteList.kosmo")
	public String deleteReportList(
			//Authentication auth,
			HttpServletRequest request,
			@RequestParam Map map, 
			Model model) {
		
		List<Map> reports=new Vector<Map>();
		Map row = new HashMap<>();
		
		//프론트에서 전달하는 리포트 리스트를 배열에 저장
		String[] reportArray = request.getParameterValues("report");
		//확장for문으로 report_no를 인자로 전달할 list에 저장
		for(String oneReport:reportArray) {
			row = new HashMap<>();
			int report_no = Integer.parseInt(oneReport);
			row.put("report_no", report_no);
			reports.add(row);
		}
		
		int deleteReportList = reportService.deleteList(reports);
		model.addAttribute("deleteReportList", deleteReportList);
		//리포트 목록 페이지로 이동
		return "report/list.noa";
	}

	
	//리포트 공유 수신자 그룹 설정 기능 - 테스트 완
	@RequestMapping("/mlist.kosmo")
	public String sendReport(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest request,
			Model model) {
		
		List<Map> members=new Vector<Map>();
		Map row = new HashMap<>();
		
		//프론트 엔드에서 전달 받는 member 리스트를 배열에 저장
		String[] memberArray = request.getParameterValues("member");
		int report_no = Integer.parseInt(request.getParameter("report_no"));
		//확장for문으로 member를 인자로 전달할 list에 저장
		for(String oneMember:memberArray) {
			row = new HashMap<>();
			row.put("report_no", report_no);
			row.put("m_id", oneMember);
			members.add(row);
		}
	
		model.addAttribute("insertReportM",reportService.insertMember(members));
		return "report/list.noa";
	}
	
	//멤버 리스트 불러오기(get) - 테스트 완
	@RequestMapping("/viewmlist.kosmo")
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		model.addAttribute("reportMember", reportService.selectMember(map));
		return "report/view.noa";
	}
	/*
	//업무 리스트 구하기 - 문자열, 날짜 검색 기능 - 테스트 완
	//@RequestMapping(value={"/list.kosmo", "/Project/list.kosmo"})
	@RequestMapping(value="/list.kosmo")
	public String selectTasks(
			Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			@RequestParam(required = false,defaultValue = "1") int nowPage) throws ParseException {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername());
		
		ListPagingData<Map> selectTaskList = taskService.selectList(map, req, nowPage);
		
		//업무별 마감일 기준 d-day 계산값 
		List<Map> tasklists = selectTaskList.getLists();
		for(Map list:tasklists) {
			String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 오늘날
			String endDateFm = list.get("SCHE_ENDDATE").toString();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date enddate = new Date(dateFormat.parse(endDateFm).getTime()); 
			Date today = new Date(dateFormat.parse(todayFm).getTime());
			long calculate = enddate.getTime() - today.getTime();
			int Ddays = (int) (calculate / (24*60*60*1000));
			list.put("Ddays", Ddays);
			System.out.println("두 날짜 차이일 : " + Ddays);
		}
		
		model.addAttribute("selectTaskList", selectTaskList);
		model.addAttribute("selectListCheck",projectService.selectListCheck(map,req));
		//리포트 작성 페이지로 .0. 이동
		return "project/Report.noa";
	}
	*/
	

	//리포트 다운로드 
	//- 리엑트 사용 예정(개발 환경 서치 필요)
	/*
	@RequestMapping("/list.kosmo")
	public String downloadReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		FileDownService downloadReport = FileDownService.download();
		model.addAttribute("downloadReport", downloadReport);
		//리포트 목록 페이지로 이동
		return "report/list.noa";
	}
	
	[테스트 용]
	@RequestMapping(value="/project.kosmo",produces = "text/html; charset=UTF-8")
	public String testProject(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model
			) {
		return "/Project/Project";
		//return "/Project/Project123.noa";
	}
	
	*/
	
}
