package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.MailDAO;

@Service
public class MailServiceImpl implements MailService<Map>{
	
	@Autowired
	private MailDAO mDAO;
	

	//받은 메일함을 가져오는 메소드
	@Override
	public List<Map> selectList(Map map, HttpServletRequest req) {
		return mDAO.recByMailReceive(map);
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

}
