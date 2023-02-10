package com.nodearchive.springapp.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.AttendanceDAO;
import com.nodearchive.springapp.service.impl.AttendanceDTO;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDAO dao;

	@Override
	public int allListCount(String m_id) {
		return dao.allListCount(m_id);
	}

	@Override
	public List<AttendanceDTO> selectDailyAtt(int startPage, int limit, String m_id) {
		return dao.selectDailyAtt(startPage, limit, m_id);
	}

	@Override
	public int listCount(HashMap<String, String> map) {
		return dao.listCount(map);
	}

	@Override
	public List<AttendanceDTO> searchDailyAtt(HashMap<String, String> map) {
		return dao.searchDailyAtt(map);
	}

	@Override
	public int insertEnter(AttendanceDTO att) {
		return dao.insertEnter(att);
	}

	@Override
	public int updateLeave(AttendanceDTO att) {
		return dao.updateLeave(att);
	}

	//월 근무내역
	@Override
	public int mAllCount(String m_id) {
		return dao.mAllCount(m_id);
	}

	@Override
	public List<AttendanceDTO> selectMonthAtt(int startPage, int limit, String m_id) {
		
		List<AttendanceDTO> list = dao.selectMonthAtt(startPage, limit, m_id);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (AttendanceDTO attendanceDTO : list) {
			Date date = attendanceDTO.getAtt_date();
			String dateStr = sdf.format(date);
			attendanceDTO.setAtt_date_str(dateStr);
		}
		
		return list;
	}

	@Override
	public int msearchCount(HashMap<String, String> map) {
		String startdate = map.get("startdate");
		String enddate = map.get("enddate");
		
		Calendar cal = Calendar.getInstance();
		int firstDay = 1;
		int lastDay = cal.getActualMaximum( Calendar.DAY_OF_MONTH );
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		if( startdate == null || startdate.equals("") ) {
			cal.set( Calendar.DAY_OF_MONTH, firstDay );
			startdate = sdf.format( cal.getTime() );
			map.put("startdate", startdate);
		}
		if( enddate == null || enddate.equals("") ) {
			cal.set( Calendar.DAY_OF_MONTH, lastDay);
			enddate = sdf.format( cal.getTime() );
			map.put("enddate", enddate);
		}
		
		return dao.msearchCount(map);
	}

	@Override
	public List<AttendanceDTO> searchMonthAtt(HashMap<String, String> map) {
		return dao.searchMonthAtt(map);
	}

	@Override
	public List<AttendanceDTO> testAtt(String m_id) {
		return dao.testAtt(m_id);
	}

}
