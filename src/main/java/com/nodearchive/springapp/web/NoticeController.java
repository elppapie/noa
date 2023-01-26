package com.nodearchive.springapp.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.NoticeService;
import com.nodearchive.springapp.service.NoticeServiceImpl;
import com.nodearchive.springapp.service.impl.NoticeDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Controller
@RequestMapping("/Notice")
public class NoticeController {

	@Autowired
	private NoticeServiceImpl noticeService;
	
	//은지님 페이지 이동
	//버튼 수정 전에는 /Schedule/notice.kosmo 였음
	// 
	@RequestMapping("/List.kosmo")
	public String notice(
			//Authentication auth,
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req,
			Model model		
			) {
		//서비스 호출
		ListPagingData<NoticeDTO> listPagingData=  noticeService.selectList(map, req, nowPage);
		//데이타 저장
		model.addAttribute("listPagingData", listPagingData);
		
		return "notice/Notice.noa";
	}
	
	//작성한 공지 등록하기
	@RequestMapping(value="/writeOk.kosmo",method = {RequestMethod.GET,RequestMethod.POST})
	public String list(
			//@ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기.스프링 씨큐리티 사용시 불필요
		//	Authentication auth,//씨큐리티 사용시(인증된 사용자 정보가 들어있다)
                                //인증이 안된 사용자가 접근시 자바 설정파일의 loginPage()메소드에 지정한 페이지로 바로 리다이렉트 됨)
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req,
			Model model
			) {
		//공지 새글 등록
		
/////////////////////로그인한 사람의 아이디 얻어오기 (test시에는 하드코딩)/////////////////////////////////////
		map.put("m_id","kim1234@samsung.com");
///////////////////////////////////////////////////////////////////////////////////////////////////		
		noticeService.insert(map);

		//서비스 호출
		ListPagingData<NoticeDTO> listPagingData=  noticeService.selectList(map, req, nowPage);
		//데이타 저장
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환
		return "notice/Notice.noa";
	}
	
	//공지등록
	@GetMapping("/write.kosmo")
	public String write(
			Authentication auth
		) {
		return "notice/Write.noa";
	}
	
	//공지등록 테스트
	//입력처리
		@PostMapping("/Write.kosmo")
		public String writeok(
				//@ModelAttribute("id") String id,//세션영역에 id가 없으면 에러
				Authentication auth,
				@RequestParam Map map
				) {
			/*스프링 씨큐리티 적용시 인증(로그인)되었다면 Authentication객체에 로그인과 관련된 정보가 전달됨
			   로그인이 안되어 있으면 auth는 null*/
			System.out.println("[Authentication객체]");
			System.out.println("auth:"+auth);
			UserDetails userDetails=(UserDetails)auth.getPrincipal();
			System.out.println("아이디:"+userDetails.getUsername());
			System.out.println("비밀번호:"+userDetails.getPassword());
			System.out.print("부여된 권한들:");
			Collection<GrantedAuthority> authorities= (Collection<GrantedAuthority>)userDetails.getAuthorities();
			for(GrantedAuthority authority:authorities) 
				System.out.println(authority.getAuthority()+ " ");
			//서비스 호출
			//map.put("id", id);//호출전 아이디 맵에 저장
			//map.put("id",userDetails.getUsername());
			//noticeService.insert(map);
			//뷰정보 반환-목록을 처리하는 컨트롤러로 이동
			return "forward:/views/notice/Notice.noa";
		}
		
	// 공지 상세보기-> 원본
	/*@RequestMapping("/view.kosmo")
	public String view(
			@RequestParam Map map
			) {
		return "notice/View.noa";
	}	*/
		
		//상세보기
		@RequestMapping(value="/view.kosmo",method = {RequestMethod.GET,RequestMethod.POST})
		public String view(
				//@ModelAttribute("id") String id,
				Authentication auth,
				@RequestParam Map map,
				Model model
				) {
			//서비스 호출
			NoticeDTO record= noticeService.selectOne(map);
			//데이타 저장
			model.addAttribute("record", record);
			//뷰정보 반환
			return "notice/View.noa";
		}
	
	//공지수정
	/*@RequestMapping("/edit.kosmo")
	public String edit(
			@RequestParam Map map
			) {
		return "notice/Edit.noa";
	}*/
		//meemocontroller에서 복붙 시작..
		//수정 폼으로 이동
		@RequestMapping("/edit.kosmo")
		public String edit(
				//@ModelAttribute("id") String id,
				Authentication auth,
				@RequestParam Map map,
				Model model) {
			//서비스 호출
			NoticeDTO record= noticeService.selectOne(map);
			
			//데이타 저장
			model.addAttribute("record", record);
			//뷰정보 반환
			return "notice/Edit.noa";
		}
		//입력처리
		@PostMapping("/Edit.kosmo")
		public String editok(
				//@ModelAttribute("id") String id,
				Authentication auth,
				@RequestParam Map map
				) {
			
			//서비스 호출		
			noticeService.update(map);
			//뷰정보 반환-목록을 처리하는 컨트롤러로 이동
			return "forward:/views/notice/View.noa";
		}	
		// memocontroller에서 복붙 끝.
	/*
	//공지삭제
	@RequestMapping(value ="/Delete.kosmo", method = RequestMethod.GET)
	public String delete(
			@RequestParam Map map
			) {
		return "notice/Notice.noa"; 
	
	}*/
	//memocontroller 에서 복붙
	//삭제
		@GetMapping("/Delete.kosmo")
		public String delete(
				//@ModelAttribute("id") String id,
				Authentication auth,
				@RequestParam Map map) {
			
			//서비스 호출
			noticeService.delete(map);
			//뷰정보 반환]-목록을 처리하는 컨트롤러로 이동
			return "notice/Notice.noa";
		}
	
}
			
