package com.nodearchive.springapp.web;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.ProjectServiceImpl;
import com.nodearchive.springapp.service.TaskService;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Project")
public class ProjectController {

	//**기본 crud 작업이 동일한 service 주입받음
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TaskService taskService;
	
	//프로젝트 목록(post) - 테스트 완료
	//로그인 유저 정보 파악하여 사용자가 포함된 프로젝트만 select 
	@RequestMapping("/list.kosmo")
	public String listProject(
			Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model
			) {
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername());		
		int nowPage=1;
		ListPagingData<Map> projects = projectService.selectList(map, req, nowPage);
		List<Map> lists = projects.getLists();
		//하위 업무 추가를 위한 로직
		for(Map list:lists) {
			int project_no = Integer.parseInt(list.get("PROJECT_NO").toString());
			map.put("project_no", project_no);
			ListPagingData<Map> tasks = taskService.selectListByProj(map, req, 1);
			List<Map> tlists = tasks.getLists();
			list.put("tlists", tlists);
		}
		model.addAttribute("projectList", projects);
		//return "project/list.noa";
		return "project/Project.noa";
	}
	
	
	//프로젝트 생성(post) - /Project/create.kosmo / - 테스트 완료
	@RequestMapping("/create.kosmo")
	public String createProject(
			Authentication auth,
			Model model,
			@RequestParam Map map
			,HttpServletRequest req //로그인 계정 정보를 세션에서 가져오기 위한 인자
			) {
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		map.put("loginId", authenticated.getUsername());
		//프론트 엔드에서 전달 받는 member 리스트를 배열에 저장
		String[] memberArray = req.getParameterValues("member");
		map.put("memberArray", memberArray);
		projectService.insert(map);
		model.addAttribute("project", map);
		//프로젝트 리스트 페이지로 이동
		return "redirect:/Project/list.kosmo";
	}
	
	//프로젝트 상세보기(get) - 테스트 완료
	@RequestMapping(value="/view.kosmo",produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String viewProject(
			Authentication auth,
			@RequestParam Map map, 
			Model model) throws JsonProcessingException {
		
		//model.addAttribute("selectOneProject", projectService.selectOne(map));
		Map record = (Map) projectService.selectOne(map);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(record);
		System.out.println(mapperData);
		
		//상세보기 페이지로 이동
		//return "project/view.noa";
		return mapperData;
	} 
	
	//프로젝트 수정(post) - 테스트 완
	@RequestMapping("/edit.kosmo")
	public String editProject(
			Authentication auth,
			@RequestParam Map map, 
			Model model) {
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("loginId", userDetails.getUsername());
		model.addAttribute("editProject", projectService.update(map));
		
		//수정 완료 후 해당 프로젝트 상세보기 페이지로 이동
		return "project/view.noa";
	}
	
	//프로젝트 삭제 (get) - 테스트 완
	@RequestMapping("/delete.kosmo")
	public String deleteProject(
			@RequestParam Map map, 
			Model model) {
		//boolean checkMember = projectService.isSameMember(map);
		//System.out.println("checkMember:"+checkMember);
		//if(checkMember) {
		model.addAttribute("deleteProject", projectService.delete(map));
		System.out.println("삭제 완료 후 컨트롤러로 돌아옴");
		//}
		//else System.out.println("해당 요청물의 작성자가 아닙니다.");
		//삭제 후 목록 페이지로 반환
		return "redirect:/Project/list.kosmo";
	}
		
	
	//프로젝트 멤버 리스트 추가 - 테스트 완
	@RequestMapping("/mlist.kosmo")
	public String memberList(
			//Authentication auth,
			HttpServletRequest request,
			@RequestParam Map map, 
			Model model){
	
		List<Map> members=new Vector<Map>();
		Map row = new HashMap<>();
		
		//프론트 엔드에서 전달 받는 member 리스트를 배열에 저장
		String[] memberArray = request.getParameterValues("member");
		//확장for문으로 member를 인자로 전달할 list에 저장
		for(String oneMember:memberArray) {
			row = new HashMap<>();
			row.put("project_no", map.get("project_no"));
			row.put("m_id", oneMember);
			members.add(row);
		}
	
		model.addAttribute("insertProjM",projectService.insertMember(members));
		//return "project/list.noa";
		//[TEST용 주소]
		return "project/Project.noa";
	}
	
	//멤버 리스트 불러오기(get) - 테스트 완
	@RequestMapping(value="/viewmlist.kosmo" ,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) throws JsonProcessingException {
		
		//model.addAttribute("projMember", projectService.selectMember(map));
		//return "project/view.noa";
		List mlist = projectService.selectMember(map);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		//String mapperData = mapper.writeValueAsString(records);
		//System.out.println(mapper.writeValueAsString(records));
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mlist);
		System.out.println(mapperData);
		return mapperData;
	}
		
	//체크리스트 ajax 추가용
	@RequestMapping(value="/checklist.kosmo",produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String addChecklist(@RequestParam Map map) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setVisibility(PropertyAccessor.FIELD, Visibility.ANY);
		//String mapperData = mapper.writeValueAsString(records);
		//System.out.println(mapper.writeValueAsString(records));
		String mapperData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		System.out.println(mapperData);
		return mapperData;
	}
	
	//*****프로젝트 메소드 추가 필요 *****
	/*
	//참여자 검색 및 선택(get)
	@RequestMapping("/member.kosmo")
	public String selectMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		List<MemebersDTO> memberList = addrService.createGroup(map);
		model.addAttribute("memberList", memberList);
		return "project/create.noa";
	}
	*/
	
	//+프로젝트 진행률 구하는 로직 추가 필요

}
