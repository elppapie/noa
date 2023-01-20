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

import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.TaskService;
import com.nodearchive.springapp.service.TaskServiceImpl;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Task")
public class TaskController {

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
		//업무 목록 페이지로 이동
		//return "task/list.noa";
		return "project/Project.noa";
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
	@RequestMapping(value={"/list.kosmo", "/Project/list.kosmo"})
	public String selectTasks(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req,
			Model model,
			@RequestParam(required = false,defaultValue = "1") int nowPage) {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userD  etails=(UserDetails)auth.getPrincipal();
		//map.put("login_Id", userDetails.getUsername());
		System.out.println("loginId_C:"+map.get("loginId"));
		ListPagingData<Map> selectTaskList = taskService.selectList(map, req, nowPage);
		model.addAttribute("selectTaskList", selectTaskList);
		//리포트 작성 페이지로 .0. 이동
		//return "task/list.noa";
		return "project/Project.noa";
	}
	
	//업무 리스트 구하기 - 프로젝트별 하위 업무 셀렉트 용
	@RequestMapping(value={"/listbyporj.kosmo", "/Project/list.kosmo"})
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
		map.put("project_no", 20);
		System.out.println("loginId_C:"+map.get("loginId"));
		ListPagingData<Map> selectTaskListByProj = taskService.selectListByProj(map, req, nowPage);
		model.addAttribute("selectTaskListByProj", selectTaskListByProj);
		//리포트 작성 페이지로 .0. 이동
		//return "task/list.noa";
		return "forward:/project/Project.noa";
	}
	
	//업무 수정(psot) - 테스트 완
	@RequestMapping("/edit.kosmo")
	public String updateTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int editTask = taskService.update(map);
		model.addAttribute("editTask", editTask);
		//수정 완료 후 해당 업무 상세보기 페이지로 이동
		return "task/view.noa";
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
	
}
