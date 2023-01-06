package com.nodearchive.springapp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//@Controller
@RequestMapping("/Report")
public class ReportController {

	@Autowired
	private ReportService<ReportDTO> reportService;
	
	//리포트 생성(post)
	@RequestMapping("/create.kosmo")
	public String createReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ReportService<ReportDTO> createReport = ReportService.insert(map);
		model.addAttribute("createReport", createReport);
		//리포트 상세 보기 페이지로 이동
		return "/viewReport.noa";
	}
	
	//리포트 수정(post)
	@RequestMapping("/edit.kosmo")
	public String updateReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ReportService<ReportDTO> updateReport = ReportService.update(map);
		model.addAttribute("updateReport", updateReport);
		//리포트 상세 보기 페이지로 이동
		return "/viewReport.noa";
	}
	
	//리포트 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ReportService<ReportDTO> selectOneReport = ReportService.selectOne(map);
		model.addAttribute("selectOneReport", selectOneReport);
		//리포트 상세 보기 페이지로 이동
		return "/viewReport.noa";
	}
	
	
	//리포트 전달
	@RequestMapping("/list.kosmo")
	public String sendReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ReportService<ReportDTO> selectOneReport = ReportService.selectOne(map);
		model.addAttribute("selectOneReport", selectOneReport);
		//리포트 목록 페이지로 이동
		return "/listReport.noa";
	}

	
	//리포트 수신자 검색 및 선택기능 
	@RequestMapping("/view.kosmo")
	public String viewReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ReportService<ReportDTO> selectOneReport = ReportService.selectOne(map);
		model.addAttribute("selectOneReport", selectOneReport);
		//리포트 상세 보기 페이지로 이동
		return "/viewReport.noa";
	}
	
	//리포트 전달 기능
	@RequestMapping("/share.kosmo")
	public String shareReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		ReportService<ReportDTO> shareReport = ReportService.share(map);
		model.addAttribute("shareReport", shareReport);
		//리포트 목록 페이지로 이동
		return "/listReport.noa";
	}
	

	//리포트 양식 변경 및 다운 
	//- 리엑트 사용 예정(개발 환경 서치 필요)
	@RequestMapping("/list.kosmo")
	public String downloadReport(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		FileDownService downloadReport = FileDownService.download();
		model.addAttribute("downloadReport", downloadReport);
		//리포트 목록 페이지로 이동
		return "/listReport.noa";
	}
	
}
