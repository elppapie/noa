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

	@Override
	public int authMember(Map map) {
		
		return dao.authMember(map);
	}

	@Override
	public List selectList(Map map) {
		
		return null;
	}

	@Override
	public ChatDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int addFriend(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
