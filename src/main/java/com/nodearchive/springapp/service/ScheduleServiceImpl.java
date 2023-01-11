package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.ScheduleDAO;
import com.nodearchive.springapp.service.impl.ScheduleDTO;

//서비스 로직
@Service
public class ScheduleServiceImpl implements ScheduleService<ScheduleDTO>{
	
	@Autowired
	private ScheduleDAO dao;
	
	// 일정 목록 구현시 스크롤바 사용 (페이징 x)

	@Override
	public List<ScheduleDTO> selectList(Map map, HttpServletRequest req) {
		
		return dao.findRecordByPeriod(map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
	
}
