package com.nodearchive.springapp.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//공지목록
	@RequestMapping(value="/List.kosmo",method = {RequestMethod.GET,RequestMethod.POST})
	public String list(
			//@ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기.스프링 씨큐리티 사용시 불필요
			Authentication auth,//씨큐리티 사용시(인증된 사용자 정보가 들어있다)
                                //인증이 안된 사용자가 접근시 자바 설정파일의 loginPage()메소드에 지정한 페이지로 바로 리다이렉트 됨)
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req,
			Model model
			) {
		//서비스 호출
		ListPagingData<NoticeDTO> listPagingData=  noticeService.selectList(map, req, nowPage);
		//데이타 저장
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환
		return "views/schedule/Notice.kosmo";
	}
	
	//공지등록
	@RequestMapping("/write.kosmo")
	public String write(
			
			@RequestParam Map map
		) {
		return "notice/Write.noa";
	}
	
	//공지수정
	@RequestMapping("/edit.kosmo")
	public String edit(
			@RequestParam Map map
			) {
		return "notice/Edit.noa";
	}
	//공지검색
	@RequestMapping("/search.kosmo")
	public String search(
			@RequestParam Map map
			) {
		return "notice/Search.noa";
	}
	
	//공지삭제
	@RequestMapping("/delete.kosmo")
	public String delete(
			@RequestParam Map map
			) {
		return "notice/Delete.noa";
	}
	
}
