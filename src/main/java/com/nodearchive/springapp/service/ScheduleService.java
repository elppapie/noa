package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ScheduleService<T> {

	// 일부구간의 일정 가져오기용
	// 구간 단위는 모두 똑같음
	// 화면에 표시된 연도/월/주 단위로 표시하기
	List<T> selectList(
			Map map,
			HttpServletRequest req
			);
	
	// 일정 입력/삭제/수정용
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	
	
}
