package com.nodearchive.springapp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nodearchive.springapp.service.utils.ListPagingData;

//제너릭 인터페이스
public interface ProjectService<T> {

	//로그인 용 - 스프링 시큐리티 사용 시 불필요
//	boolean isLogin(Map map);
	
	//목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
}
