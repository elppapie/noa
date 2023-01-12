package com.nodearchive.springapp.web;


import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ProjectService;
import com.nodearchive.springapp.service.impl.ProjectDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

//1.메핑 페이지
//2.주입받을 서비스 페이지
@Controller
@RequestMapping("/Project")
public class ProjectController {
	/*
	 *3.기능 메소드 
		→ (get or post) : 주입받을 데이터 고려
		
		→ 반환타입 : 프론트에 뿌려줄 데이터 타입 고려
		-페이지에 데이터 담아서 반환 = ModelAndView model
		-데이터만 전달 = 데이터 타입 
	 */
	
	//**기본 crud 작업이 동일한 service 주입받음
	@Autowired
	private ProjectService projectService;

	//프로젝트 목록(post)
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
		//map.put("m_id", userDetails.getUsername());
		
		
		//[TEST]-------------------------------------
		//테스트를 위한 유저 아이디, nowPage 저장
		map.put("m_id", "kim1234@samsung.com");
		int nowPage=1;
		//-------------------------------------------
		
		//ListPagingData<Map> projectList = 
		projectService.selectList(map, req, nowPage);
		model.addAttribute("projectList", map);
		
		//[TEST]-------------------------------------------
		//결과 MAP 출력
		Set keys=map.keySet();
		for(Object o:keys) {
			System.out.println(String.format("[🔔컨트롤러] map의 키:%s, value:%s", o.toString(),map.get(o).toString()));
		}
		//-------------------------------------------------

		return "project/list.noa";
	}
	
	
	//프로젝트 생성(post) - /Project/create.kosmo
	@RequestMapping("/create.kosmo")
	public String createProject(
			//Authentication auth,
			Model model,
			@RequestParam Map map
			//,HttpServletRequest req //로그인 계정 정보를 세션에서 가져오기 위한 인자
			) {
		
		//**스프링 시큐리티 적용시 아래 두줄로 유저 아이디 조회 & map에 저장
		//UserDetails userDetails=(UserDetails)auth.getPrincipal();
		//map.put("m_id", userDetails.getUsername());
		
		//--------------------------------------------------------
		//[TEST]테스트를 위한 유저 아이디 저장
		System.out.println("프로젝트 생성 시작");
		map.put("m_id", "kim1234@samsung.com");
		//[TEST]테스트를 위한 나머지 인자 저장
		map.put("sche_title", "프로젝트 생성");
		map.put("sche_content", "프로젝트2");
		//map.put("sche_startdate", "2023-01-08 00:00:00.000");
		//map.put("sche_enddate", "2023-01-08 00:00:00.000");
		map.put("sche_mark", 0);
		map.put("sche_status", 0);
		map.put("sche_color", "BLUE");
		map.put("project_name", "2023 타겟");
		//--------------------------------------------------------
		
		projectService.insert(map);
		model.addAttribute("project", map);
		//프로젝트 리스트 페이지로 이동
		return "forward:project/list.noa";
	}
	
	//프로젝트 상세보기(get)
	@RequestMapping("/view.kosmo")
	public String viewProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		//[TEST]------------------------------------------
		//테스트를 위한 유저 아이디, sche_no 저장
		map.put("m_id","hong1234@samsung.com");
		map.put("sche_no", 1);
		//------------------------------------------------
		
		model.addAttribute("selectOneProject", projectService.selectOne(map));
		
		//[TEST]-------------------------------------------
		//결과 MAP 출력
		Set keys=map.keySet();
		for(Object o:keys) {
			System.out.println(String.format("[🔔컨트롤러] map의 키:%s, value:%s", o.toString(),map.get(o).toString()));
		}
		//-------------------------------------------------
		return "project/view.noa";
	}
	
	//프로젝트 삭제 (get)
	@RequestMapping("/delete.kosmo")
	public String deleteProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		
		int deleteProject = projectService.delete(map);
		model.addAttribute("deleteProject", deleteProject);
		//목록 페이지로 반환
		return "project/list.noa";
	}
	
	//프로젝트 수정(post)
	@RequestMapping("/edit.kosmo")
	public String editProject(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		int editProject = projectService.update(map);
		model.addAttribute("editProject", editProject);
		return "project/view.noa";
	}
	
	//*****프로젝트 멤버 그룹 설정 관련 메소드 추가 필요 *****
	/*
	//멤버 리스트 불러오기(get)
	@RequestMapping("/view.kosmo")
	public String viewMember(
			//Authentication auth,
			@RequestParam Map map, 
			Model model) {
		
		addrServiceImpl<ScheduleDTO> viewMember = addrService.selectGroup(map);
		model.addAttribute("viewMember", viewMember);
		return "project/view.noa";
	}
	
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
	
	//페이징을 위한 메소드 추가 필요
	
	
}
