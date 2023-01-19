package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	// 회원여부 판단]
	public int authMember(Map map) {			
		return template.selectOne("chatLogin", map);
	}
	
	// 사용자의 정보 조회]
	public Map myInfo(Map map) {		
		return template.selectOne("selectMyInfo", map);
	}
	
	// 메신저 그룹명 조회]
	public List selectGroupName(Map map) {		
		return template.selectList("selectGroupName", map);
	}
	
	// 메신저 그룹에 저장한 친구의 정보 조회]
	public List selectFriendsList(Map map) {	
		return template.selectList("selectFriendsList", map);
	}
	
	// 사용자의 기업에 존재하는 부서들(전체 목록용)
	public List selectDeptName(Map map) {
		return template.selectList("selectDeptName", map);
	}
	
	// 사용자의 기업에 존재하는 팀들(전체목록용)
	public List selectTeamName(Map map) {
		return template.selectList("selectTeamName", map);
	}

	// 전체직원 정보조회(전체목록용)
	public List selectAllMember(Map map) {
		return template.selectList("selectAllMember", map);
	}
	// 회사 구성원 검색 (자동완성)목록]
	public List searchMembers(Map map) {
		return template.selectList("searchMembers", map);
	}

	// 메신저 그룹 추가
	public int addGroup(Map map) {
		return template.insert("addGroup", map);
	}

	// 메신저 그룹이름 수정
	public int updateGroup(Map map) {
		return template.update("updateGroup", map);
	}

	// 메신저 그룹 구성원 추가
	public int insertMember(Map map) {
		return template.insert("insertMember", map);
	}
	
	// 메신저 그룹 구성원 삭제
	public int deleteMember(Map map) {
		return template.delete("deleteMember", map);
	}

	// 메신저 그룹 삭제
	public int deleteGroup(Map map) {
		return template.delete("deleteGroup", map);
	}

	// 메신저 채팅 목록 조회
	public List selectChatsList(Map map) {
		return template.selectList("selectChatsList", map);
	}

	// 선택한 채팅방 정보 조회
	public Map selectChat(Map map) {
		return template.selectOne("selectChat", map);
	}

	// 선택한 채팅방 구성원 및 정보 조회
	public List selectChatMember(Map map) {
		return template.selectList("selectChatMember", map);
	}

	//선택한 채팅방의 메세지
	public List selectChatMsg(Map map) {
		return template.selectList("selectChatMsg", map);
	}

	//채팅방 생성
	public int createChat(Map map) {
		return template.insert("createChat", map);
	}
	
	//채팅방 참여자 리스트 생성
	public int createChatMemberList(Map map) {
		return template.insert("createChatMemberList", map);
	}

	//채팅방 수정
	public int updateChat(Map map) {
		return template.update("updateChat", map);
	}

	//채팅방 나가기
	public int deleteChat(Map map) {
		return template.delete("deleteChat", map);
	}

	
	
	
}
