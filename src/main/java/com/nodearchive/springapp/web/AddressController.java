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
import com.nodearchive.springapp.service.utils.ListPagingData;

//컨트롤러 url-pattern : /기능폴더명/기능명.kosmo
@Controller
@RequestMapping("/Address")
public class AddressController {
	
	//AddressServiceImpl 서비스 주입
	@Autowired
	private AddressService addrService;
	
	//예외 처리
	//@ExceptionHandler
	
	//컨트롤러 메소드 - 주소록 전체 구성원 목록 (주소록 메인페이지)
	@GetMapping("/AllList.kosmo")
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
		 * map = 페이징 관련 데이터(pageSize,nowPage,...)
		 * pagingString = 페이징 문자열
		 */
		//데이터 저장
		model.addAttribute("listPagingData",addrService.selectList(map, req, nowPage));
		//뷰정보 반환
		return "address/addressList.noa";
	}
	
	

}
