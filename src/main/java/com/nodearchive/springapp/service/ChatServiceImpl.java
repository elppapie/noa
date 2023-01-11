package com.nodearchive.springapp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.nodearchive.springapp.service.impl.ChatDAO;
import com.nodearchive.springapp.service.impl.ChatDTO;

public class ChatServiceImpl implements ChatService<ChatDTO>{
	
	@Autowired
	private ChatDAO dao;

	@Override
	public int authMember(Map map) {
		int auth= dao.authMember(map);
		return 0;
	}

	@Override
	public ChatDTO selectList(Map map) {
		// TODO Auto-generated method stub
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
