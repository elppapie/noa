package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MailService<T> {

	//받은 메일함
	List<T> selectList(
			Map map,
			HttpServletRequest req
			);
	
	//보낸 메일함
	List<Map> selectSendList(
			Map map, 
			HttpServletRequest req
			);
	
	//임시 메일함
	List<Map> selectTempList(
			Map map,
			HttpServletRequest req
			);
	
	//내게 쓴 메일함
	List<Map> selectMyList(
			Map map,
			HttpServletRequest req
			);

	//스팸 메일함
	List<Map> selectSpamList(
			Map map,
			HttpServletRequest req
			);
	
	//즐겨찾기 메일함
	List<Map> selectFvList(
			Map map,
			HttpServletRequest req
			);
	
	//휴지통
	List<Map> selectRecycleList(
			Map map,
			HttpServletRequest req
			);
	
	//전체 메일함 목록
	List<Map> selectAllMailList(
			Map map, 
			HttpServletRequest req
			);
	
	
	//  메일 쓰기용/메일 삭제용/메일 수정용
	int insert(Map map);
	int delete(Map map);

	

	

	
	
	
}
