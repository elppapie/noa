package com.nodearchive.springapp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ChatService<T> {
	
	//메신저 로그인
	int authMember(Map map);
	
	//목록
	T selectList(Map map);
	
	//상세보기
	T selectOne(Map map);
	
	//입력-수정-삭제
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}
