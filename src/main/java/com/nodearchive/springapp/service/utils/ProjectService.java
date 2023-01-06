package com.nodearchive.springapp.service.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//제너릭 인터페이스
public interface ProjectService<ScheduleDTO> {

	//목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage );
	
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	//PK로 이름 찾는 메소드
	List<MembersDTO> createGroup(Map map);
	ProjectMemberDTO selectGroup(Map map);
}
