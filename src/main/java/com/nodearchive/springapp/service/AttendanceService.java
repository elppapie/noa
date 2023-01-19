package com.nodearchive.springapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.nodearchive.springapp.service.impl.AttendanceDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

public interface AttendanceService {
	
	int allListCount(String m_id);
	
	List<AttendanceDTO> selectDailyAtt(int startPage, int limit, String m_id);
	
	int listCount(Map map);
	
	List<AttendanceDTO> searchDailyAtt(Map map);

	int insertEnter(AttendanceDTO att);
	
	int updateLeave(AttendanceDTO att); 

	//월 근무내역
	int mAllCount(String m_id);
	
	List<AttendanceDTO> selectMonthAtt(int startPage, int limit, String m_id);
	
	int msearchCount(Map map);
	
	List<AttendanceDTO> searchMonthAtt(Map map);
	
	List<AttendanceDTO> testAtt(String m_id);

}
