package com.nodearchive.springapp.web;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.AddressService;
import com.nodearchive.springapp.service.AddressServiceImpl;
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
		 */
/////////////////////////////////////////////////test //* ⚠️테스트할 때만 임의로 m_id전달
		map.put("m_id", "kim1234@samsung.com");
		Set keys=map.keySet();
		for(Object o:keys) {
			System.out.println(String.format("[🔔컨트롤러] map의 키:%s, value:%s", o.toString(),map.get(o).toString()));
		}
///////////////////////////////////////////////
		
		//서비스 호출 + 데이터 저장
		// key=value
		/*
		 * lists = 뿌려줄 구성원 목록 List<Map>타입
			 mark=즐겨찾기표시 ,m_profile_img=프로필사진링크, m_name=이름, position_name=직급 이름, team_name=팀 이름, 
			 m_id=이메일, m_private_contact개인연락처, m_hiredate=입사일
		 * map = 페이징 관련 데이터(pageSize,nowPage,...)
		 * pagingString = 페이징 문자열
		 */
		//데이터 저장
		model.addAttribute("listPagingData",addrService.selectList(map, req, nowPage));
		//뷰정보 반환
		return "address/addressList.noa";
	}
	
	//컨트롤러 메소드 - 주소록 페이지에서 '조직도 검색' 버튼을 눌렀을 때 나타나는 모달에 뿌려줄 데이터를 조회하는 메소드
	// 로그인한 구성원의 기업의 부서, 팀들을 가져온다.
	// Org = organization 축약어
	@GetMapping("/searchOrg.kosmo")
	public String searchOrg(
//			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.  
			Model model,
			@RequestParam Map map,
//			@RequestParam(required = false, defaultValue = "1") int nowPage,
			//nowPage가 전달된다면 해당 값이, nowPage가 없으면 기본값 1로 초기화한다.
			HttpServletRequest req
			) {
		//map으로 전달될 데이터
		/*
		 * 1. m_id = 로그인 중인 구성원의 id
		 */
/////////////////////////////////////////////////test //* ⚠️테스트할 때만 임의로 m_id전달
		map.put("m_id", "kim1234@samsung.com");
		Set keys=map.keySet();
		for(Object o:keys) {
		System.out.println(String.format("[🔔컨트롤러] map의 키:%s, value:%s", o.toString(),map.get(o).toString()));
		}
///////////////////////////////////////////////
		//서비스 호출
		addrService.getOrg(map);
		
		
		return "address/empOrg.noa";
	}
	//위 메소드와 연계. 조직도 모달에서 어떤 부서/팀을 클릭했을 때 해당 부서/팀의 구성원을 가져올 메소드
	// 부서를 클릭했다면 >> "부서 책임자 + 하위 팀들"을 뿌려주고
	// 팀을 클릭했다면  >> "팀 책임자" + "하위 구성원들"을 뿌려준다.
	@GetMapping("/getOrgMembers.kosmo")
	public String getOrgMembers(
//			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.  
			Model model,
			@RequestParam Map map,
//			@RequestParam(required = false, defaultValue = "1") int nowPage,
			//nowPage가 전달된다면 해당 값이, nowPage가 없으면 기본값 1로 초기화한다.
			HttpServletRequest req
			) {
		
		
		return "address/orgMembers.noa";
	}

}
