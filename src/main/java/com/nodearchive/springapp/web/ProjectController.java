package com.nodearchive.springapp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.OneMemoDTO;
import com.kosmo.springapp.onememo.service.OneMemoService;
import com.nodearchive.springapp.service.ProjectService;

//1.메핑 페이지
//2.주입받을 서비스 페이지
//@Controller
@RequestMapping("/Project")
public class ProjectController {
	/*
	 *3.기능 메소드 
		→ (get or post) : 주입받을 데이터 고려
		
		→ 반환타입 : 프론트에 뿌려줄 데이터 타입 고려
		-페이지에 데이터 담아서 반환 = ModelAndView model
		-데이터만 전달 = 데이터 타입 
	 */
	
	@Autowired
	private ProjectService<ScheduleDTO> projectService;

	
	//프로젝트 생성(post)
	@RequestMapping("/create.kosmo")
	public String createProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		ProjectService<ScheduleDTO> createProject = projectService.insert(map);
		model.addAttribute("createProject", createProject);
		//업무 등록 페이지로 이동
		return "task/createTask.noa";
	}
	
	//프로젝트 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ProjectService<ScheduleDTO> selectOneProject = projectService.selectOne(map);
		model.addAttribute("selectOneProject", selectOneProject);
		return "project/view.noa";
	}
	
	//프로젝트 삭제 (get)
	@RequestMapping("/delete.kosmo")
	public String deleteProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		ProjectService<ScheduleDTO> deleteProject = projectService.delete(map);
		model.addAttribute("deleteProject", deleteProject);
		return "project/list.noa";
	}
	
	//프로젝트 수정(post)
	@RequestMapping("/edit.kosmo")
	public String editProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ProjectService<ScheduleDTO> editProject = projectService.update(map);
		model.addAttribute("editProject", editProject);
		return "project/view.noa";
	}
	
	//참여자 검색 및 선택(post)
	@RequestMapping("/create.kosmo")
	public String selectMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ProjectService<ScheduleDTO> memberList = projectService.createGroup(map);
		model.addAttribute("memberList", memberList);
		return "project/create.noa";
	}
	
	//멤버 리스트 불러오기(get)
	@RequestMapping("/view.kosmo")
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ProjectService<ScheduleDTO> viewMember = projectService.selectGroup(map);
		model.addAttribute("viewMember", viewMember);
		return "project/view.noa";
	}

	//페이징을 위한 메소드 호출
	
	
}
