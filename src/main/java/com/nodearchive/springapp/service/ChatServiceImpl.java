package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.ChatDAO;
import com.nodearchive.springapp.service.impl.ChatDTO;

@Service
public class ChatServiceImpl implements ChatService<ChatDTO>{
	
	@Autowired
	private ChatDAO dao;

	// 메신저 로그인
	public int authMember(Map map) {		
		return dao.authMember(map);
	}

	// 메신저 채팅 목록 조회
	public List selectList(Map map) {
		return dao.selectChatsList(map);
	}

	// 선택한 채팅방 정보 조회
	public Map selectOne(Map map) {
		return dao.selectChat(map);
	}
	
	// 선택한 채팅방 구성원 및 정보 조회
	public List selectChatMember(Map map) {
		return dao.selectChatMember(map);
	}
	
	// 선택한 채팅방 메세지 조회
	public List selectChatMsg(Map map) {
		return dao.selectChatMsg(map);
	}

	@Override
	// 채팅방 생성
	public int insert(Map map) {
		return dao.createChat(map);
	}
	
	// 채팅방 참여자 리스트 생성 및 참여자 추가
	public int createChatMemberList(Map map) {
		return dao.createChatMemberList(map);
	}

	@Override
	//채팅방 나가기
	public int delete(Map map) {
		return dao.deleteChat(map);
	}

	@Override
	// 채팅방 수정
	public int update(Map map) {
		return dao.updateChat(map);
	}

	


}
