package com.nodearchive.springapp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nodearchive.springapp.service.utils.ListPagingData;

public interface AdminService<T> {
	//로그인 용 - 스프링 시큐리티 사용 시 불필요
//	boolean isLogin(Map map);
	
	//목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	
	//상세보기용]
	T selectOne(Map map);
	
	//★구성원 입력/수정/삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	//기업 입력/수정/삭제용
	int insertEmp(Map map);
	int deleteEmp(Map map);
	int updateEmp(Map map);
	
	//권한 입력/수정/삭제용
	int insertAuthority(Map map);
	int deleteAuthority(Map map);
	int updateAuthority(Map map);	

	//부서 입력/수정/삭제용
	int insertDept(Map map);
	int deleteDept(Map map);
	int updateDept(Map map);
	
	//팀 입력/수정/삭제용
	int insertTeam(Map map);
	int deleteTeam(Map map);
	int updateTeam(Map map);
	
	//직책 입력/수정/삭제용
	int insertPosition(Map map);
	int deletePosition(Map map);
	int updatePosition(Map map);	
	
	
}
