package com.nodearchive.springapp.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.TaskService;
import com.nodearchive.springapp.service.TaskServiceImpl;
import com.nodearchive.springapp.service.utils.ListPagingData;
import com.nodearchive.springapp.service.utils.PagingUtil;

@Controller
@RequestMapping("/Task")
public class TaskController {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TaskService taskService;

	//업무 생성(post) - 테스트 완
	//프로젝트 하위 업무는 project_no = 해당 프로젝트 번호
	//개인 업무는 project_no = 0
	@RequestMapping("/create.kosmo")
	public String createTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		model.addAttribute("createTask", taskService.insert(map));
		System.out.println("m_id:"+map.get("m_id"));
		//업무 목록 페이지로 이동
		//return "task/list.noa";
		//return "project/Project.noa";
		return "redirect:/Project/list.kosmo";
	} 
		
	//업무 상세보기(get) - 테스트 완
	@RequestMapping("/view.kosmo")
	public String viewTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		model.addAttribute("selectOneTask", taskService.selectOne(map));
		//업무 등록 페이지로 이동
		return "task/view.noa";
	}
	
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
		return "project/Task.noa";
	}
	
	//업무 리스트 구하기 - 프로젝트별 하위 업무 셀렉트 용
	//@RequestMapping(value={"/listbyporj.kosmo", "/Project/list.kosmo"})
	@RequestMapping("/listbyporj.kosmo")
	public String selectTasksByProj(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			@RequestParam(required = false,defaultValue = "1") int nowPage) {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userD  etails=(UserDetails)auth.getPrincipal();
		//map.put("login_Id", userDetails.getUsername()); 
		map.put("loginId", "park1234@samsung.com");
		
		System.out.println("loginId_C:"+map.get("loginId"));
		
		ListPagingData<Map> selectTaskListByProj = taskService.selectListByProj(map, req, nowPage);
		model.addAttribute("selectTaskListByProj", selectTaskListByProj);
		//리포트 작성 페이지로 .0. 이동
		//return "task/list.noa";
		//return "project/Project.noa";
		return "forward:/Project/list.kosmo";
	}
	/*
	@RequestMapping(value={"/listbyporj.kosmo", "/Project/list.kosmo"},produces = "application/json; charset=UTF-8")
	//@ResponseBody
	public String selectTasksByProj(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			@RequestParam(required = false,defaultValue = "1") int nowPage) throws JsonProcessingException {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userD  etails=(UserDetails)auth.getPrincipal();
		//map.put("loginId", userDetails.getUsername()); 
		map.put("loginId", "park1234@samsung.com");
		
		System.out.println("loginId_C:"+map.get("loginId"));
		
		ListPagingData<Map> selectTaskListByProj = taskService.selectListByProj(map, req, nowPage);
		List<Map> records = selectTaskListByProj.getLists();
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		
		System.out.println("records.get(0):"+records.get(0));
		System.out.println("PagingUtil.TOTAL_COUNT_C:"+map.get(PagingUtil.TOTAL_COUNT));
		
		//String mapperData = mapper.writeValueAsString(records);
		//System.out.println(mapper.writeValueAsString(records));
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(records);
		System.out.println("mapperData:"+mapperData);
		
		model.addAttribute("selectTaskListByProj", selectTaskListByProj);
		//model.addAttribute("mapperData", mapperData);
		//return "forward:/Project/list.kosmo";
		//데이터만 전달
		return mapperData;
	}
	*/
	
	
	//업무 수정(psot) - 테스트 완
	@RequestMapping("/edit.kosmo")
	public String updateTask(
			Authentication auth,
			@RequestParam Map map, 
			Model model) {

		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername()); 
		int editTask = taskService.update(map);
		model.addAttribute("editTask", editTask);
		//수정 완료 후 해당 업무 상세보기 페이지로 이동
		return "task/view.noa";
	} 
	
	//update - 진행도 업데이트
	@RequestMapping(value="/updateprog.kosmo" ,produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String updateProgress(
			Authentication auth,
			@RequestParam Map map, 
			Model model) throws JsonProcessingException {

		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername()); 
		int editTask = taskService.updateProgress(map);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(editTask);
		System.out.println(mapperData);
		return mapperData;
	} 
	
	
	//업무 하나 삭제(get) - 테스트 완
	@RequestMapping("/delete.kosmo")
	public String deleteTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int deleteTask = taskService.delete(map);
		model.addAttribute("deleteTask", deleteTask);
		//업무 목록 페이지로 이동
		return "task/list.noa";
	} 
	
	//멤버 리스트 불러오기(get) - 테스트 완
	@RequestMapping(value="/list.kosmo" ,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String viewMember(
			Authentication auth,
			@RequestParam Map map, 
			Model model) throws JsonProcessingException {
		
		//model.addAttribute("projMember", projectService.selectMember(map));
		//return "project/view.noa";
		int upProgress = taskService.updateProgress(map);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		//String mapperData = mapper.writeValueAsString(records);
		//System.out.println(mapper.writeValueAsString(records));
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(upProgress);
		System.out.println(mapperData);
		return mapperData;
	}
}
