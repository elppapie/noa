package com.nodearchive.springapp.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.MailService;
import com.nodearchive.springapp.service.MailServiceImpl;

@Controller
@RequestMapping("/Mail")
public class MailController {

	@Autowired
	private MailServiceImpl mService;
	
	//받은 메일함
	@RequestMapping("/mailView.kosmo")
	public String mailView(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> mailList = mService.selectList(map, req);
		req.setAttribute("receviemail", mailList);
		return "/mail/received.noa";
		
	}
	
	//보낸 메일함
	@RequestMapping("/mailSended.kosmo")
	public String mailSended(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> sendMailList = mService.selectSendList(map, req);
		req.setAttribute("sendmail", sendMailList);
		return "/mail/sended.noa";
	}
	
	//임시 메일함
	@RequestMapping("/mailTemp.kosmo")
	public String mailTemp(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {

		List<Map> tempMailList = mService.selectTempList(map, req);
		req.setAttribute("tempmail", tempMailList);
		return "/mail/temp.noa";
	}
	
	//내게 쓴 메일함
	@RequestMapping("/mailMy.kosmo")
	public String mailMy(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
		
		List<Map> myMailList = mService.selectMyList(map, req);
		req.setAttribute("mymail", myMailList);
		return "/mail/mym.noa";
	}
	
	//스팸 메일함
	@RequestMapping("/mailSpam.kosmo")
	public String mailSpam(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> spamMailList = mService.selectSpamList(map, req);
		req.setAttribute("spammail", spamMailList);
		return "/mail/spam.noa";
	}
	
	//즐겨찾기 메일함
	@RequestMapping("/mailFavorite.kosmo")
	public String mailFavorite(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> fvMailList = mService.selectFvList(map, req);
		req.setAttribute("fvmail", fvMailList);
		return "/mail/favorite.noa";
	}
	
	//휴지통
	@RequestMapping("/mailRecycle.kosmo")
	public String mailRecycle(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> recycleMailList = mService.selectRecycleList(map, req);
		req.setAttribute("recyclemail", recycleMailList);
		return "/mail/recycle.noa";
	}
	
	//전체 메일함 목록
	@RequestMapping("/mailList.kosmo")
	public String mailList(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req
			) {
		
		List<Map> allMailLists = mService.selectAllMailList(map, req);
		req.setAttribute("allmail", allMailLists);
		return "/mail/list.noa";
	}
	
	//메일 검색
	@RequestMapping("/mailSel.kosmo")
	public String mailSel(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
		
		return "/mail/sel.noa";
	}
	
	//메일 읽음/안읽음 표시
	@RequestMapping("/mailRead.kosmo")
	public String mailRead(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
				
		return "/mail/read.noa";
	}
	
	//메일 즐겨찾기 체크여부(등록,해제)
	@RequestMapping("/mailFechk.kosmo")
	public String mailFechk(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
		
		return "/mail/fechk.noa";
	}
	
	//메일 임시 저장
	@RequestMapping("/sendSave")
	public String sendSave(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
		
			
		return "/mail/sendsave.noa";
	}
	
	//메일 참조 설정
	@RequestMapping("/sendRefer") 
	public String sendRefer(
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
				
		return "/mail/sendRefer.noa";
	}	
}
