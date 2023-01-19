package com.nodearchive.springapp.service.impl;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Mapper
public interface ApprovalDAO {
	
	//메인화면
	public void approvalMain(HttpServletRequest req, Model model);
	
	//메인화면- 결재 대기
	int approvalCount_YET(Map map);
	
	//메인 화면- 결재 진행
	int approvalCount_UNDER(Map map);
	
	//메인 화면- 결재 완료
	int approvalCount_DONE(Map map);
	
	//메인 화면-내 결재 목록
	List<Map> getRecentList(Map map);	
	
	//상세보기 - 결재/반려 (내가 결재 해야하는 문서)
	public Map read(Map map);
	
	//상세보기
	public Map check(Map map);

	/*
	//결재정보 리스트
	List<MembersDTO> selectMember(String m_id);
	
	////모든 부서 결재정보 리스트 불러오기
	List<MembersDTO> selectAllMember();
	
	//새결제-결제정보선택리스트
	public void selectFormList(HttpServletRequest req, Model model);
	
	//새결제-결제정보선택리스트(모든부서노출)
	public void selectAllFormList(HttpServletRequest req, Model model);
	
	//임시보관하기
	public void tempSaveAction(MultipartHttpServletRequest req, Model model);
	
	// 임시저장
	public void tempSave(ApproverDTO dto);
	
	//기안하기
	public void approvereq(ApproverDTO dto);
	
	//기안-진행문서함리스트
	//public void onapprovalAction(HttpServletRequest req, Model model);
	public List<ApproverDTO> onapproval(Map<String, Object> map);
	
	//기안-완료문서함리스트
	//public void comapprovalAction(HttpServletRequest req, Model model);
	public List<ApproverDTO> comapproval(Map<String, Object> map);
	
	//기안-반려문서함리스트
	//public void rejapprovalAction(HttpServletRequest req, Model model);
	public List<ApproverDTO> rejapproval(Map<String, Object> map);
	
	//임시보관함리스트
	//public void templistAction(HttpServletRequest req, Model model);
	
	//임시보관함리스트
	List<ApproverDTO> templist(Map<String, Object> map);
	
	//임시보관함 삭제
	public void deleteTemp(Strin@Override
	g approval_code);
	
	//임시보관함- 결재정보수정페이지
	//public void modifydocFormList(HttpServletRequest req, Model model);
	public void modifydocFormList(Map<String, Object> map);
	
	//임시보관함- 수정한 정보 뿌리기
	//public void modifydocViewAction(HttpServletRequest req, Model model);
	
	//임시보관함- 수정한 정보 뿌리기
	List<ApprovalDTO> modifydocView();
	
	//임시보관함- 수정하기 상세페이지
	//public void modifydocAction(HttpServletRequest req, Model model);
	
	//결재대기함 리스트
	public List<ApproverDTO> checkoutlist(Map<String, Object> map);

	//결재대기문서 결재하기
	void confirmdraft(Map<String, Object> map);

*/



	

	









	

	



	
	
	
	
	
}////////////////
