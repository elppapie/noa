package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.ChatDAO;
import com.nodearchive.springapp.service.impl.ChatDTO;

@Service
public class ChatFriendServiceImpl implements ChatService<ChatDTO>{

	@Autowired
	private ChatDAO dao;
	
	@Override
	public int authMember(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List selectList(Map map) {
		
		return dao.selectFriendsList(map);
		//return null;
	}

	@Override
	public ChatDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) { //그룹추가
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) { //그룹삭제
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) { //그룹수정(그룹 설정 및 구성원 추가 삭제 등..)
		// TODO Auto-generated method stub
		return 0;
	}	

	
	public int friendInsert(Map map) { //친구추가
		// TODO Auto-generated method stub
		return 0;
	}

	public int friendDelete(Map map) { //친구삭제
		// TODO Auto-generated method stub
		return 0;
	}

	public int friendUpdate(Map map) { //친구수정(그룹 설정 및 구성원 추가 삭제 등..)
		// TODO Auto-generated method stub
		return 0;
	}

	

}
