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
import org.springframework.web.bind.annotation.ResponseBody;

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
		session.setAttribute("username", map.get("username"));    
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
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
		map.put("username", session.getAttribute("username").toString());
		
		//서비스 호출
		Map info= chatFriendService.myInfo(map); //사용자 정보
		List<Map> groupName= chatFriendService.selectGroupName(map); //메신저 그룹명
		List<Map> record= chatFriendService.selectFriendsList(map); //메신저 그룹에 추가된 친구 목록
		
		List<Map> deptName= chatFriendService.selectDeptName(map); //기업 부서명(전체 목록용)
		List<Map> teamName= chatFriendService.selectTeamName(map); //기업 팀명(전체 목록용)
		List<Map> record2= chatFriendService.selectAllMember(map); //기업 모든 직원 조회(전체 목록용)
		
		
		//데이터 저장
		model.addAttribute("groupName",groupName); //메신저 그룹 목록명 저장
		model.addAttribute("record",record); //메신저 그룹에 추가된 친구 목록 저장
		model.addAttribute("info",info); //사용자 정보 저장
		model.addAttribute("deptName",deptName); //기업 부서명 저장
		model.addAttribute("teamName",teamName); //기업 부서명 저장
		model.addAttribute("record2",record2); //기업 모든 직원 조회
		
		//뷰정보 반환		
		return "chat/mycrew";
	}
	
	
	//사원 검색(자동완성)--
	@RequestMapping("/searchMembers.kosmo")
	@ResponseBody
	public Map<String, Object> autocomplete(
			//Authentication auth,
			HttpSession session,
			@RequestParam Map paramMap){

		//세션에 저장된 아이디
		paramMap.put("username", session.getAttribute("username").toString());
				
		//서비스호출
		List<Map> resultList = chatFriendService.searchMembers(paramMap); //친구목록
		paramMap.put("resultList", resultList);

		//데이터 반환
		return paramMap;
	}
	
	
	//메신저 그룹(친구목록)--
	@RequestMapping("/group.kosmo")
	public String chatGroup(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
		
		// ★★ 생성,수정,삭제 분류하는 값 넘겨 받기
		String sort= map.get("sort").toString().toUpperCase();
		// ★★수정,삭제,구성원추가시 해당 그룹번호 넘겨받기
		
		
		//서비스 호출
		if("CREATE".equals(sort))
			chatFriendService.insert(map); //그룹추가
		else if("UPDATE".equals(sort))
			chatFriendService.update(map); //그룹수정
		else if("INSERT".equals(sort))
			chatFriendService.insertMember(map); //그룹구성원 추가
		else if("DELETE_M".equals(sort))
			chatFriendService.deleteMember(map); //그룹구성원 삭제
		else
			chatFriendService.delete(map); //그룹삭제
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/friendList.kosmo";
	}
	
	
	/*메신저 친구-- 이게 왜 필요함??????
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
	}*/
	
	
	//메신저 채팅목록
	@RequestMapping("/chatList.kosmo")
	public String chatList(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map,
			Model model, HttpSession session
			) {
		
		//세션에 저장된 아이디
		map.put("username", session.getAttribute("username").toString());
		
		//서비스 호출
		List record= chatService.selectList(map);
		//데이터 저장
		model.addAttribute("record",record);
		//뷰정보 반환		
		return "chat/chats";
	}
	
	
	//채팅방
	@RequestMapping("/chat.kosmo")
	public String chat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map,
			Model model, HttpSession session
			) {

		//세션에 저장된 아이디
		map.put("username", session.getAttribute("username").toString());
		map.put("chat_no", map.get("chat_no"));
		System.out.println("chat_no:"+map.get("chat_no"));
		
		//서비스 호출
		Map myInfo= chatFriendService.myInfo(map); //사용자 정보
		Map chat= chatService.selectOne(map); //채팅방 정보
		List chat_member= chatService.selectChatMember(map); //채팅방 구성원 및 정보 조회
		List chat_msg= chatService.selectChatMsg(map); //채팅방 메세지 조회
		
		//데이터 저장
		model.addAttribute("myInfo",myInfo); //사용자 정보
		model.addAttribute("chat",chat); //채팅방 정보
		model.addAttribute("chat_member",chat_member); //채팅방 구성원 및 정보
		model.addAttribute("chat_msg",chat_msg); //채팅방 메세지
		
		//뷰정보 반환
		return "chat/chat";
	}
	
	
	//채팅방 추가
	@RequestMapping("/createChat.kosmo")
	public String createChat(
			//Authentication auth,
			@ModelAttribute("id") String id,
			@RequestParam Map map
			) {
				
		chatService.insert(map); //채팅추가
		chatService.createChatMemberList(map); //채팅방 참여자 추가
		
		//생성된 채팅방 번호 넘겨줘야함!!!
		
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
		chatService.update(map); //채팅방 이름 변경
		chatService.createChatMemberList(map); //채팅방 참여자 추가
		
		//★★★★대화상대추가인 경우 초대된 사람의 정보가 map에 저장되어 있어야 하며 대상자에세 채팅창 뿌려줘야 함
		//채팅방 이름은 emp_group으로 각자 저장하도록 해야하나.. 
		//group_separator에 채팅방번호 넣고 select할 땐 m_id와 group_separator로 조회 
		
		//뷰정보 반환(목록처리 컨트롤러로 이동)		
		return "forward:/Chat/chat.kosmo";
	}
	
	
	//채팅방 나가기
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
