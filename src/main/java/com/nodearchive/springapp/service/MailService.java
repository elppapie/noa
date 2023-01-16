package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MailService<T> {

	
	List<T> selectList(
			Map map,
			HttpServletRequest req
			);
	
	//  입력/삭제/수정용
	int insert(Map map);
	int delete(Map map);
	
	
}
