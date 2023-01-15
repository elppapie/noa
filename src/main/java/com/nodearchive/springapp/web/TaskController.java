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
import com.nodearchive.springapp.service.TaskService;
import com.nodearchive.springapp.service.TaskServiceImpl;
import com.nodearchive.springapp.service.impl.ProjectDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Task")
public class TaskController {

	@Autowired
	private TaskService taskService;

	//업무 생성(post)
	@RequestMapping("/create.kosmo")
	public String createTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		//--------------------------------------------------------
		//[TEST]테스트를 위한 유저 아이디 저장
		System.out.println("업무 생성 시작");
		map.put("m_id", "park1234@samsung.com");
		map.put("project_no", 2);
		//[TEST]테스트를 위한 나머지 인자 저장
		map.put("sche_title", "업무 생성");
		map.put("sche_content", "업무2");
		//map.put("sche_startdate", "2023-01-08 00:00:00.000");
		//map.put("sche_enddate", "2023-01-08 00:00:00.000");
		map.put("sche_mark", 0);
		map.put("sche_status", 0);
		map.put("sche_color", "RED");

		map.put("task_name", "2023 타겟");
		map.put("task_content", "타겟 swat 분석 정리");
		map.put("task_category", '0');
		//--------------------------------------------------------
		int createTask = taskService.insert(map);
		model.addAttribute("createTask", createTask);
		//업무 목록 페이지로 이동
		return "task/list.noa";
	} 
		
	//업무 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]---------------------------------
		map.put("task_no", 6);
		//---------------------------------------
		
		model.addAttribute("selectOneTask", taskService.selectOne(map));
		//업무 등록 페이지로 이동
		return "task/view.noa";
	}
	
	
	//업무 수정(psot)
	@RequestMapping("/edit.kosmo")
	public String updateTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]----------------------------
		//테스트용 task / schedule 테이블 정보 수정
		//실제 운영시 selectOne으로 불러온 기존 테이블 값을 map에 저장하여 사용함
		map.put("task_no", 6);
		map.put("task_name", "수정된 업무 입니다");
		map.put("task_content", "수정된 업무 입니다");
		map.put("m_id", "na1234@samsung.com");
		map.put("sche_startdate", "2023-01-30 15:20:24");
		map.put("sche_enddate", "2023-01-30 15:20:24");
		//----------------------------------
		
		int editTask = taskService.update(map);
		model.addAttribute("editTask", editTask);
		//수정 완료 후 해당 프로젝트 상세보기 페이지로 이동
		return "task/view.noa";
	} 
	
	
	//업무 하나 삭제(get)
	@RequestMapping("/delete.kosmo")
	public String deleteTask(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]-----------------------------------
		map.put("task_no", 6);
		//-----------------------------------------
		
		int deleteTask = taskService.delete(map);
		model.addAttribute("deleteTask", deleteTask);
		//업무 등록 페이지로 이동
		return "task/list.noa";
	} 
	
}
