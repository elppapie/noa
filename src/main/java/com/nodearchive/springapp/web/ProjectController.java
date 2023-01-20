package com.nodearchive.springapp.web;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.ProjectServiceImpl;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Project")
public class ProjectController {

	//**기본 crud 작업이 동일한 service 주입받음
	@Autowired
	private ProjectService projectService;
/*
	@RequestMapping(value="/list.kosmo",produces = "text/html; charset=UTF-8")
	public String testProject(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model
			) {
		return "/project/Project.noa";
		//return "/Project/Project123.noa";
	}
	*/
	
	
	//프로젝트 목록(post) - 테스트 완료
	//로그인 유저 정보 파악하여 사용자가 포함된 프로젝트만 select 
	@RequestMapping("/list.kosmo")
	public String listProject(
			//Authentication auth,
			@RequestParam Map map, 
			HttpServletRequest req,
			Model model
			) {
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userDetails=(UserDetails)auth.getPrincipal();
		//map.put("loginId", userDetails.getUsername());
		
		//test
		map.put("loginId", "park1234@samsung.com");
		
		int nowPage=1;
		model.addAttribute("projectList", projectService.selectList(map, req, nowPage));
		//return "project/list.noa";
		return "project/Project.noa";
	}
	
	
	//프로젝트 생성(post) - /Project/create.kosmo / - 테스트 완료
	@RequestMapping("/create.kosmo")
	public String createProject(
			//Authentication auth,
			Model model,
			@RequestParam Map map
			,HttpServletRequest req //로그인 계정 정보를 세션에서 가져오기 위한 인자
			) {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userDetails=(UserDetails)auth.getPrincipal();
		//map.put("login_Id", userDetails.getUsername());

		List<String> members=new Vector<String>();
		Map row = new HashMap<>();
		
		//프론트 엔드에서 전달 받는 member 리스트를 배열에 저장
		String[] memberArray = req.getParameterValues("member");
		map.put("memberArray", memberArray);
		
		
		projectService.insert(map);
		model.addAttribute("project", map);
		//프로젝트 리스트 페이지로 이동
		//return "forward:project/list.noa";
		//[TEST용 주소]
		return "project/Project.noa";
	}
	
	//프로젝트 상세보기(get) - 테스트 완료
	@RequestMapping("/view.kosmo")
	public String viewProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		model.addAttribute("selectOneProject", projectService.selectOne(map));
		//상세보기 페이지로 이동
		return "project/view.noa";
	} 
	
	//프로젝트 수정(post) - 테스트 완
	@RequestMapping("/edit.kosmo")
	public String editProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userDetails=(UserDetails)auth.getPrincipal();
		//map.put("login_Id", userDetails.getUsername());
		
		model.addAttribute("editProject", projectService.update(map));
		//수정 완료 후 해당 프로젝트 상세보기 페이지로 이동
		return "project/view.noa";
	}
	
	//프로젝트 삭제 (get) - 테스트 완
	@RequestMapping("/delete.kosmo")
	public String deleteProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		boolean checkMember = projectService.isSameMember(map);
		System.out.println("checkMember:"+checkMember);
		if(checkMember) {
			model.addAttribute("deleteProject", projectService.delete(map));
		}
		else System.out.println("해당 요청물의 작성자가 아닙니다.");
		//삭제 후 목록 페이지로 반환
		return "project/list.noa";
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
	@RequestMapping("/viewmlist.kosmo")
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		model.addAttribute("projMember", projectService.selectMember(map));
		return "project/view.noa";
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
