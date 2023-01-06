package com.nodearchive.springapp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//@Controller
@RequestMapping("/Task")
public class TaskController {

	@Autowired
	private TaskService<TaskDTO> taskService;
	
	
	//업무 생성(post)
	@RequestMapping("/create.kosmo")
	public String createTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		TaskService<TaskDTO> createTask = taskService.insert(map);
		model.addAttribute("createTask", createTask);
		//업무 목록 페이지로 이동
		return "/viewTask.noa";
	} 
	
	//업무 분배(psot) - 테이블 저장 방식/서비스페이지 로직 고민 필요
	@RequestMapping("/allot.kosmo")
	public String allotTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		TaskService<TaskDTO> allotTask = taskService.???(map);
		model.addAttribute("allotTask", allotTask);
		//업무 등록 페이지로 이동
		return "/createTask.noa";
	} 
	
	//업무 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		TaskService<TaskDTO> viewTask = taskService.selectOne(map);
		model.addAttribute("viewTask", viewTask);
		//업무 등록 페이지로 이동
		return "/viewTask.noa";
	}
	
	//업무 상세보기(get)
	@RequestMapping("/delete.kosmo")
	public String deleteTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		TaskService<TaskDTO> deleteTask = taskService.delete(map);
		model.addAttribute("deleteTask", deleteTask);
		//업무 등록 페이지로 이동
		return "/listTask.noa";
	} 
	
}
