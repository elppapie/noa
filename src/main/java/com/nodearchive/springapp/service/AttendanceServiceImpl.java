package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

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
	public int listCount(Map map) {
		return dao.listCount(map);
	}

	@Override
	public List<AttendanceDTO> searchDailyAtt(Map map) {
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
		return dao.selectMonthAtt(startPage, limit, m_id);
	}

	@Override
	public int msearchCount(Map map) {
		return dao.msearchCount(map);
	}

	@Override
	public List<AttendanceDTO> searchMonthAtt(Map map) {
		return dao.searchMonthAtt(map);
	}

	@Override
	public List<AttendanceDTO> testAtt(String m_id) {
		return dao.testAtt(m_id);
	}

}
