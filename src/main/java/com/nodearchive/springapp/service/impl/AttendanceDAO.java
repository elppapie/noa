package com.nodearchive.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendanceDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public int allListCount(String m_id) {
		System.out.println("근태리스트");
		return template.selectOne("allListCount",m_id);
	}

	public List<AttendanceDTO> selectDailyAtt(int startPage, int limit, String m_id) {
		System.out.println("근태리스트조회");
		//특정 페이지 단위의 게시글 조회
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return template.selectList("selectDailyAtt",m_id,row);
	}

	public int listCount(Map map) {
		System.out.println("다오" + map);
		return template.selectOne("listCount", map);
	}

	public List<AttendanceDTO> searchDailyAtt(Map map) {
		//특정 페이지 단위의 게시글 조회
		return template.selectList("searchDailyAtt", map);
	}

	public int insertEnter(AttendanceDTO att) {
		System.out.println("insert 진입");
		return template.insert("insertEnter", att);
	}

	public int updateLeave(AttendanceDTO att) {
		System.out.println("update 진입");
		return template.update("updateLeave", att);
	}

	//월 근무내역
	public int mAllCount(String m_id) {
		return template.selectOne("mAllCount", m_id);
	}

	public List<AttendanceDTO> selectMonthAtt(int startPage, int limit, String m_id) {
		int startRow = (startPage - 1) * limit; // 시작 페이지를 가져옴, 0~9, 10~19
		RowBounds row = new RowBounds(startRow, limit); //ibatis 세션의 rowboun
		return template.selectList("selectMonthAtt",m_id,row);
	}

	public int msearchCount(Map map) {
		return template.selectOne("msearchCount",map);
	}

	public List<AttendanceDTO> searchMonthAtt(Map map) {
		return template.selectList("searchMonthAtt", map);
	}

	public List<AttendanceDTO> testAtt(String m_id) {
		return template.selectList("testAtt", m_id);
	}

	
	
	
	
	
	
	
	
	
	
}
