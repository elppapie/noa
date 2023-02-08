package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.nodearchive.springapp.service.utils.ListPagingData;


//제너릭 인터페이스
public interface ProjectService<T> {

	//멤버 확인용
	boolean isSameMember(Map map);
	//프로젝트 참여멤버 입력용
	int insertMember(List<Map> list);
	//프로젝트 참여멤버 목록용
	List selectMember(Map map);
	//프로젝트 참여멤버 삭제용
	int deleteMember(Map map);
	
	//프로젝트 목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	int selectScheNo(int project_no);
	
	//체크리스트 목록용
	List<T> selectListCheck(Map map,HttpServletRequest req);
	//체크리스트 입력용
	int insertCheck(Map map);
	//체크리스트 삭제용
	int deleteCheck(List<Map> list);
	
	
}
