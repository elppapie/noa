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
	
	//보낸 메일함을 가져오는 메소드
	@Override
	public List<Map> selectSendList(Map map, HttpServletRequest req) {
		return mDAO.recByMailSend(map);
	}
	
	//임시 메일함을 가져오는 메소드
	@Override
	public List<Map> selectTempList(Map map, HttpServletRequest req) {
		return mDAO.recByMailTemp(map);
	}

	//내게 쓴 메일함을 가져오는 메소드
	@Override
	public List<Map> selectMyList(Map map, HttpServletRequest req) {
		return mDAO.recByMailMy(map); 
	}
	
	//스팸 메일함을 가져오는 메소드
	@Override
	public List<Map> selectSpamList(Map map, HttpServletRequest req) {
		return mDAO.recByMailSpam(map);
	}
	
	//즐겨찾기 메일함을 가져오는 메소드
	@Override
	public List<Map> selectFvList(Map map, HttpServletRequest req) {
		return mDAO.recByMailfav(map);
	}
	
	//휴지통
	@Override
	public List<Map> selectRecycleList(Map map, HttpServletRequest req) {
		return mDAO.recByMailTrash(map);
	}
	
	//전체 메일함 목록
	@Override
	public List<Map> selectAllMailList(Map map, HttpServletRequest req) {
		return mDAO.recByMailLists(map);
	}
	
	
	
	
	//메일 쓰기
	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	//메일 삭제
	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
