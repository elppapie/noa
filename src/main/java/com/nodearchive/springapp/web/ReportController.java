package com.nodearchive.springapp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ReportService;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Report")
public class ReportController {

	@Autowired
	private ReportService<Map> reportService;
	
	//리포트 생성(post)
	@RequestMapping("/create.kosmo")
	public String createReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]--------------------------
		map.put("m_id", "kim1234@samsung.com");
		map.put("report_name", "1월 3주차 주간 보고");
		map.put("report_commet", "간략한 코멘트");
		map.put("report_startdate", "2023-01-15");
		map.put("report_enddate", "2023-01-20");
		//--------------------------------
		
		int createReport = reportService.insert(map);
		model.addAttribute("createReport", createReport);
		//리포트 상세 보기 페이지로 이동
		return "report/view.noa";
	}
	
	//리포트 목록(get)
	@RequestMapping("/list.kosmo")
	public String reportMain(
			//Authentication auth,
			HttpServletRequest req,
			int nowPage,
			@RequestParam Map map, 
			Model model) {
		
		ListPagingData<Map> selectListReport = reportService.selectList(map, req, nowPage);
		model.addAttribute("selectListReport", selectListReport);
		//리포트 목록
		return "report/list.noa";
	}
	
	//리포트 상세보기(get)
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
		
	
	//리포트 수정(post)
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
	
	//리포트 하나 삭제(post)
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
	
	//리포트 리스트 삭제(post)
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
		
		//[TEST]--------------------------------
		//String[] reportArray = {"4","5"};
		//--------------------------------------
		
		//확장for문으로 member를 인자로 전달할 list에 저장
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

	
	//리포트 공유 수신자 그룹 설정 기능
	@RequestMapping("/mlist.kosmo")
	public String sendReport(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest request,
			Model model) {
		
		List<Map> members=new Vector<Map>();
		Map row = new HashMap<>();
		
		//[TEST]------------------------------------------
		//row.put("report_no", 2);
		//String[] memberArray = {"hong1234@samsung.com","park1234@samsung.com"};
		//------------------------------------------------
		
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
	
		int insertReportM = reportService.insertMember(members);
		model.addAttribute("insertReportM",insertReportM );
		return "report/list.noa";
	}
	
	//멤버 리스트 불러오기(get)
	@RequestMapping("/viewmlist.kosmo")
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]---------------------------------
		map.put("report_no", 2);
		//---------------------------------------
		
		Map reportMember = (Map) reportService.selectMember(map);
		model.addAttribute("reportMember", reportMember);
		return "report/view.noa";
	}

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
	*/
	
}
