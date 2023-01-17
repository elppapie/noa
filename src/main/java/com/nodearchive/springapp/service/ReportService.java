package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.nodearchive.springapp.service.utils.ListPagingData;


//제너릭 인터페이스
public interface ReportService<T> {

	//멤버 확인용
	boolean isSameMember(Map map);
	//리포트 공유멤버 추가용
	int insertMember(List list);
	//리포트 공유멤버 목록용
	T selectMember(Map map);
	
	//목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용
	int insert(Map map);
	int update(Map map);
	int deleteOne(Map map);
	int deleteList(List list);
	

	
}
