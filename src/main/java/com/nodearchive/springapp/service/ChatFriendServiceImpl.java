package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.ChatDAO;
import com.nodearchive.springapp.service.impl.ChatDTO;

@Service
public class ChatFriendServiceImpl implements ChatService<ChatDTO>{

	@Autowired
	private ChatDAO dao;
	
	// 메신저 그룹에 저장한 친구의 정보 조회
	public List selectFriendsList(Map map) {		
		return dao.selectFriendsList(map);
	}
	
	// 메신저 그룹명 조회
	public List selectGroupName(Map map) {		
		return dao.selectGroupName(map);
	}
	
	// 회사 구성원 검색 (자동완성)목록
	public List searchMembers(Map map) {
		return dao.searchMembers(map);
	}
	
	// 사용자의 기업에 존재하는 부서들(전체 목록용)
	public List selectDeptName(Map map) {
		return dao.selectDeptName(map);
	}
	
	// 사용자 기업에 존재하는 팀들(전체목록용)
	public List selectTeamName(Map map) {
		return dao.selectTeamName(map);
	}
	
	// 전체직원 정보조회(전체목록용)
	public List selectAllMember(Map map) {
		return dao.selectAllMember(map);
	}

	public ChatDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	// 메신저 그룹 추가
	public int insert(Map map) {
		return dao.addGroup(map);
	}

	@Override
	// 메신저 그룹 삭제
	public int delete(Map map) { //그룹삭제
		return dao.deleteGroup(map);
	}

	@Override
	// 메신저 그룹이름 수정
	public int update(Map map) {
		return dao.updateGroup(map);
	}	
	
	// 메신저 그룹 구성원 추가
	public int insertMember(Map map) {
		return dao.insertMember(map);
	}
	
	// 메신저 그룹 구성원 삭제
	public int deleteMember(Map map) {
		return dao.deleteMember(map);
	}

	
	/*
	public int friendInsert(Map map) { //친구추가
		// TODO Auto-generated method stub
		return 0;
	}

	public int friendDelete(Map map) { //친구삭제
		// TODO Auto-generated method stub
		return 0;
	}

	public int friendUpdate(Map map) { //친구수정(그룹 설정 및 구성원 추가 삭제 등..)
		// TODO Auto-generated method stub
		return 0;
	}*/

	//사용자 정보 뿌리기
	public Map myInfo(Map map) {

		return dao.myInfo(map);
		
	}

	

}
