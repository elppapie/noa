package com.nodearchive.springapp.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nodearchive.springapp.service.ChatFriendServiceImpl;
import com.nodearchive.springapp.service.ChatService;
import com.nodearchive.springapp.service.ChatServiceImpl;
import com.nodearchive.springapp.service.impl.ChatDTO;

@Controller
@RequestMapping("/Chat")
public class ChatController {
	
	//서비스주입
	@Autowired 
	private ChatServiceImpl chatService;
	@Autowired 
	private ChatFriendServiceImpl chatFriendService;
	
	//메신저 메인페이지(로그인페이지) 이동
	@RequestMapping("/main.kosmo")
	public String main() {
		return "chat/index";
	}
	
	//메신저 로그인--
	@RequestMapping("/login.kosmo")
	public String loginChat(
			//Authentication auth,
			@RequestParam Map map, Model model,
			HttpSession session
			) {
		
		//서비스 호출
		int auth= chatService.authMember(map);
		if(auth!=1) {
			model.addAttribute("message","아이디 또는 비밀번호가 일치하지 않습니다");
			return "chat/index";
		}
		//데이터 저장
		session.setAttribute("id", map.get("username"));   
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
		//return "chat/mycrew";
	}
	
	
	//메신저 친구목록--
	@RequestMapping("/friendList.kosmo")
	public String friendList(
			//Authentication auth,
			@RequestParam Map map,
			Model model,
			HttpSession session
			) {
		
		//세션에 저장된 아이디
		map.put("id", session.getAttribute("id").toString());
		
		//서비스 호출
		List record= chatFriendService.selectList(map);
		//데이터 저장
		model.addAttribute("record",record);
		//뷰정보 반환		
		return "chat/mycrew";
	}
	
	
	//사원 검색?
	
	//메신저 그룹(친구목록)--
	@RequestMapping("/group.kosmo")
	public String chatGroup(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
		
		// ★★ 생성,수정,삭제 분류하는 값 넘겨 받기
		String sort= map.get("sort").toString();
		
		//서비스 호출
		if("create".equals(sort))
			chatFriendService.insert(map); //그룹추가
		else if("update".equals(sort))
			chatFriendService.update(map); //그룹수정
		else
			chatFriendService.delete(map); //그룹삭제
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
	}
	
	
	//메신저 친구--
	@RequestMapping("/friend.kosmo")
	public String chatFriend(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
		
		// ★★ 생성,수정,삭제 분류하는 값 넘겨 받기
		String sort= map.get("sort").toString();
		
		//서비스 호출
		if("create".equals(sort))
			chatFriendService.friendInsert(map); //친구추가
		else if("update".equals(sort))
			chatFriendService.friendUpdate(map); //친구수정
		else
			chatFriendService.friendDelete(map); //친구삭제
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
	}
	
	
	//메신저 채팅목록
	@RequestMapping("/chatList.kosmo")
	public String chatList(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map,
			Model model
			) {
		
		//서비스 호출
		List record= chatService.selectList(map);
		//데이터 저장
		model.addAttribute("record",record);
		//뷰정보 반환		
		return "chat/chats.html";
	}
	
	
	//채팅방
	@RequestMapping("/chat.kosmo")
	public String chat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map,
			Model model
			) {
		
		//서비스 호출(채팅방 번로 넘겨주기)
		ChatDTO record= chatService.selectOne(map);
		//데이터 저장
		model.addAttribute("record",record);
		//뷰정보 반환
		return "chat/Chat.jsp";
	}
	
	
	//채팅방 추가
	@RequestMapping("/createChat.kosmo")
	public String createChat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
				
		chatService.insert(map); //채팅추가
		
		return "forward:/Chat/chat.kosmo";
	}
	
	
	//채팅방 수정(채팅방 내에서 가능, 대화상대추가 등)
	@RequestMapping("/updateChat.kosmo")
	public String updateChat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
		
		//서비스호출
		chatService.update(map);
		
		//★★★★대화상대추가인 경우 초대된 사람에게 채팅방 뿌려줘야 함
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/chat.kosmo";
	}
	
	
	//채팅방 삭제
	@RequestMapping("/deleteChat.kosmo")
	public String deleteChat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
		
		//서비스호출
		chatService.delete(map);
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
	}
	
	

	
	
	
}
