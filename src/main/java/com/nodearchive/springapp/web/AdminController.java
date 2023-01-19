package com.nodearchive.springapp.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.AddressServiceImpl;
import com.nodearchive.springapp.service.AdminServiceImpl;
import com.nodearchive.springapp.service.impl.AddressDAO;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private AddressServiceImpl addrService;
	@Autowired
	private AddressDAO addrDao;
	
	@RequestMapping("/deptList")
	public String deptList(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		//map에 m_id로 현재 로그인한 사람의 아이디 전달
////////////////////////////////////테스트용 아이디 전달///////////////////////////////////////////////////
		map.put("m_id", "song1234@samsung.com");
//////////////////////////////////////////////////////////////////////////////////////////////////		
		model.addAttribute("emp_code", adminService.getEmpCode(map));
		model.addAttribute("organization", addrService.getOrg(map));

		return "admin/DeptList.noa";
	}
	
	@RequestMapping("/members")
	public String memberList(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		//map에 m_id로 현재 로그인한 사람의 아이디 전달
////////////////////////////////////테스트용 아이디 전달///////////////////////////////////////////////////
		map.put("m_id", "song1234@samsung.com");
//////////////////////////////////////////////////////////////////////////////////////////////////
		model.addAttribute("emp_code", adminService.getEmpCode(map));
		model.addAttribute("organization", addrService.getOrg(map));		
		
		return "admin/MemberList.noa";
	}
	
	@RequestMapping("/groups")
	public String groupList(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		//map에 m_id로 현재 로그인한 사람의 아이디 전달
////////////////////////////////////테스트용 아이디 전달///////////////////////////////////////////////////
		map.put("m_id", "song1234@samsung.com");
//////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		model.addAttribute("group_member_list", adminService.selectGroupList(map));
		model.addAttribute("organization", addrService.getOrg(map));		
		
		return "admin/GroupList.noa";
	}
	
	//신규 등록 페이지로 이동
	@GetMapping("/enroll")
	public String enrollment(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		//파라미터 enroll 키로 값이 각각 아래 값이 넘어온다
		//dept/member/team 등록 페이지
		//파라미터 emp_code 키로 회사코드가 넘어온다
		
////////////////////////////////////테스트용 아이디 전달///////////////////////////////////////////////////
map.put("m_id", "song1234@samsung.com");
//////////////////////////////////////////////////////////////////////////////////////////////////		
		
		System.out.println("[⚜] enroll--> "+map.get("enroll"));
		System.out.println("[⚜] emp_code--> "+map.get("emp_code"));
		
		model.addAttribute("enroll",map.get("enroll"));
		model.addAttribute("emp_code",map.get("emp_code"));
		model.addAttribute("organization", addrService.getOrg(map));
		return "admin/Enroll.noa";
	}
	
	//신규 등록처리 후 메인으로 이동
	@PostMapping("/enroll")
	public String enrollOk(
			Model model,
			@RequestParam(value="memberList", required=false) String[] memberList,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		// |memberList | String형 배열로 선택했던 구성원들 받아오기 - map에 담기
		// RequestParam의 map으로 전달되는 정보
		// |enroll | (부서일때) = |dept_name |m_dept_leader | (팀일때) = |team_name |m_team_leader |
		// |등록분류  |			|부서이름 	  |부서 리더	     |			|팀이름		|팀 리더		  |
			
////////////////////////////////////테스트용 아이디 전달 원래는 세션에서 가져와야///////////////////////////////////////////////////
map.put("m_id", "song1234@samsung.com"); //map.put("m_id", session.get("아이디 저장할 키값");
//////////////////////////////////////////////////////////////////////////////////////////////////		
		map.put("memberList", memberList);
		adminService.insertDept(map);
		
		


		// 입력한 내용들 가져오기
		model.addAttribute("enroll_info",map);
		
		model.addAttribute("enroll",map.get("enroll"));
		model.addAttribute("emp_code",adminService.getEmpCode(map));
		model.addAttribute("organization", addrService.getOrg(map));
		System.out.println("주소가 잘못되었나 일단 이동!!!");
		return "admin/temp_EnrollCheck.noa";
	}
	
	@RequestMapping("/edit")
	public String edit(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
////////////////////////////////////테스트용 아이디 전달///////////////////////////////////////////////////
map.put("m_id", "song1234@samsung.com");
//////////////////////////////////////////////////////////////////////////////////////////////////		
		System.out.println("dept code 들어왔니"+map.get("dept_code"));
		System.out.println("team no 들어왔니"+map.get("team_no"));
		
		model.addAttribute("enroll",map.get("enroll"));
		model.addAttribute("emp_code",map.get("emp_code"));
		model.addAttribute("organization", addrService.getOrg(map));
		return "admin/Edit.noa";
	}
	
	@RequestMapping("/delete")
	public String delete(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		
		// 삭제과정 진행
		
		System.out.println("dept code 들어왔니"+map.get("dept_code"));
		System.out.println("team no 들어왔니"+map.get("team_no"));
		
		
		return "admin/Enroll.noa";
	}
	
	
	
	@RequestMapping("/myPage")
	public String myPage(
			Model model,
			@RequestParam Map map,
			//Authentication auth,
			HttpServletRequest req
			) {
		
		
		return "admin/Mypage.noa";
	}
}
