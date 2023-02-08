package com.nodearchive.springapp.web;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nodearchive.springapp.service.AddressService;
import com.nodearchive.springapp.service.AddressServiceImpl;
import com.nodearchive.springapp.service.impl.OrganizationDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

//컨트롤러 url-pattern : /기능폴더명/기능명.kosmo
@Controller
@RequestMapping("/Address")
public class AddressController {
	
	//AddressServiceImpl 서비스 주입
	@Autowired
	private AddressServiceImpl addrService;
	
	//예외 처리
	//@ExceptionHandler
	
	//컨트롤러 메소드 - 주소록 전체 구성원 목록 (주소록 메인페이지)
	@GetMapping("/allList.kosmo")
	public String allList(
//			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.  
			Model model,
			@RequestParam Map map,
			@RequestParam(required = false, defaultValue = "1") int nowPage,
			//nowPage가 전달된다면 해당 값이, nowPage가 없으면 기본값 1로 초기화한다.
			HttpServletRequest req
			) {
		//map으로 전달될 데이터
		/*
		 * 1. m_id = 로그인 중인 구성원의 id
		 * 2. searchColumn = m_name
		 * 3. searchWord = ?파라미터
		 */	
		
		//서비스 호출 + 데이터 저장
		// key=value
		/*
		 * lists = 뿌려줄 구성원 목록 List<Map>타입
			 mark=즐겨찾기표시 ,m_profile_img=프로필사진링크, m_name=이름, position_name=직급 이름, team_name=팀 이름, 
			 m_id=이메일, m_private_contact개인연락처, m_hiredate=입사일
		 * map = 페이징 관련 데이터(pageSize,nowPage,...)
		 * pagingString = 페이징 문자열
		 */
		ListPagingData<Map> listPagingData = addrService.selectList(map, req, nowPage);
		//데이터 저장
		model.addAttribute("listPagingData",listPagingData);
		//뷰정보 반환
		return "address/addressList.noa";
	}
	
	//컨트롤러 메소드 - 주소록 전체 구성원 목록 (주소록 메인페이지)
	@GetMapping(value = "/allListNoPaging.kosmo")
	public String allListNoPaging(
			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.  
			Model model,
			@RequestParam Map map
			) {
		//map으로 전달될 데이터
		/*
		 * 1. m_id = 로그인 중인 구성원의 id
		 * 2. searchColumn = m_name
		 * 3. searchWord = ?파라미터
		 */		
		//서비스 호출 + 데이터 저장
		// key=value
		/*
		 * membersList = 뿌려줄 구성원 목록 List<Map>타입
			 mark=즐겨찾기표시 ,m_profile_img=프로필사진링크, m_name=이름, position_name=직급 이름, team_name=팀 이름, 
			 m_id=이메일, m_private_contact개인연락처, m_hiredate=입사일, emp_name=내 기업명
		 */
		List membersList = addrService.selectListNoPaging(map);
		/*
		 * dto = 뿌려줄 조직도 목록 OrganizationDTO타입 모든 필드가 List<Map>타입
		 *   deptList 필드 = 기업의 부서 얻어오기  
				//|dept_code |dept_name |dept_leader_id      |dept_leader_name |
				// 부서코드    |부서명     | 부서책임자 아이디      |  부서책임자 이름	
			 teamList 필드 = 내 기업의 모든 팀 얻어오기  
				//<Map> dept_code=부서코드, team_no=팀일련번호, team_name=팀명, 
				  m_team_leader=팀책임자, team_leader_name=팀책임자이름의 List컬렉션
			 teamListByDept 필드 = 부서를 키값으로 하고 teamList가 value로 저장된 컬렉션
			 	// key값: dept_code=부서코드 
				// value값: List<Map> dept_code=부서코드, team_no=팀일련번호, team_name=팀명, 
				// 			m_team_leader=팀책임자, team_leader_name=팀책임자이름
			 teamMembersList 필드
				//|team_no |m_id       |m_name   |m_profile_img |position_name |
				// 팀 번호  | 팀원 아이디  | 팀원이름  |프로필사진링크   | 직급명        |
		     groupMembersList 필드 (이 메소드에서는 필요 없는 필드 >> null)
		 */
		OrganizationDTO dto = addrService.getOrg(map);
		//데이터 저장
		model.addAttribute("membersList",membersList);
		//myInfo에 담겨있는 정보 : m_id(내 아이디), emp_code(내 기업코드), emp_name(내 기업명)
		model.addAttribute("myInfo", map);
		model.addAttribute("org", dto);
		
		//뷰정보 반환
		return "address/addressList";
	}
	
	//구성원 검색창의 팀목록에서 해당 팀 클릭했을 때 보여줄 팀원 목록 조회
	@GetMapping(value = "/searchOneTeam.kosmo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List searchOneTeam(
			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.
			@RequestParam Map map
			) {
		//넘어오는 파라미터
		// team_no = 검색할 팀 일련번호
//test
System.out.println("넘어온 파라미터:"+map.get("team_no"));
		
		
		return addrService.searchOneTeam(map);
	}

}
