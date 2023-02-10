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
	
	int listCount(HashMap<String, String> map);
	
	List<AttendanceDTO> searchDailyAtt(HashMap<String, String> map);

	int insertEnter(AttendanceDTO att);
	
	int updateLeave(AttendanceDTO att); 

	//월 근무내역
	int mAllCount(String m_id);
	
	List<AttendanceDTO> selectMonthAtt(int startPage, int limit, String m_id);
	
	int msearchCount(HashMap<String, String> map);
	
	List<AttendanceDTO> searchMonthAtt(HashMap<String, String> map);
	
	List<AttendanceDTO> testAtt(String m_id);

}
