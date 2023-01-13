package com.nodearchive.springapp.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.AddressService;
import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.impl.ProjectDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Task")
public class TaskController {

	@Autowired
	private ProjectService<Map> projectService;
	
	/*
	@RequestMapping("/list.kosmo")
	public String listProject(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model,
			int nowPage) {
		
		ListPagingData<ProjectDTO> projectList = projectService.selectList(map, req, nowPage);
		model.addAttribute("projectList", projectList);
		return "project/list.noa";
	}*/
	
	//업무 목록(get)
	@RequestMapping("/list.kosmo")
	public String listTask(
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model) {
		
		int nowPage=1;
		//ListPagingData<ProjectDTO> taskList = projectService.selectList(map, req, nowPage);
		//model.addAttribute("taskList", taskList);
		//업무 목록 페이지로 이동
		return "task/list.noa";
	} 
	
	//업무 생성(post)
	@RequestMapping("/create.kosmo")
	public String createTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int createTask = projectService.insert(map);
		model.addAttribute("createTask", createTask);
		//업무 목록 페이지로 이동
		return "task/view.noa";
	} 
	
	//업무 수정(psot)
	@RequestMapping("/update.kosmo")
	public String updateTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		int updateTask = projectService.update(map);
		model.addAttribute("updateTask", updateTask);
		//업무 등록 페이지로 이동
		return "task/view.noa";
	} 
	
	//업무 분배(psot) : 업무 수행할 멤버 지정 
	//- 테이블 저장 방식/서비스페이지 로직 고민 필요
	@RequestMapping("/allot.kosmo")
	public String allotTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		int allotTask = projectService.update(map);
		model.addAttribute("allotTask", allotTask);
		//업무 등록 페이지로 이동할지 상세보기 페이지로 이동할지 고민 필요
		return "task/view.noa";
	} 
	
	//업무 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		ProjectDTO viewTask = (ProjectDTO) projectService.selectOne(map);
		model.addAttribute("viewTask", viewTask);
		//업무 등록 페이지로 이동
		return "task/view.noa";
	}
	
	//업무 삭제(get)
	@RequestMapping("/delete.kosmo")
	public String deleteTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int deleteTask = projectService.delete(map);
		model.addAttribute("deleteTask", deleteTask);
		//업무 등록 페이지로 이동
		return "task/list.noa";
	} 
	
}
