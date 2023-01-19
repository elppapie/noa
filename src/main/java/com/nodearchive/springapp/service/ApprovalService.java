package com.nodearchive.springapp.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.nodearchive.springapp.service.impl.ApprovalDTO;
import com.nodearchive.springapp.service.impl.MembersDTO;




public interface ApprovalService {
	
	//Main ==================================================
	
		//메인화면- 결재 대기
		int approvalCount_YET(Map map);
		
		//메인 화면- 결재 진행
		int approvalCount_UNDER(Map map);
		
		//메인 화면- 결재 완료
		int approvalCount_DONE(Map map);
	
		//내 결재 목록
		List<Map> getRecentList(Map map);
		
		//상세 보기 페이지
		public Map read(Map map);
		
		//상세 보기 페이지
		public Map check(Map map);
		
		//상세 보기 페이지
		public Map tempcheck(Map map);

		//새 결재 작성하기
		//public Map<String, Object> insertapp(Map map);
		
		//새 결재 저장하기
		//public List<Map> saveapp(Map map);
		
		/*
	    //메인화면+
		public void approvalMain(HttpServletRequest req, Model model);
		
		//새결제-결제정보선택리스트+
		public void selectFormList(HttpServletRequest req, Model model);
	
		//새결제-결제정보선택리스트(모든부서노출)+
		public void selectAllFormList(HttpServletRequest req, Model model);

		//임시보관하기+
		public void tempSaveAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException ;

		//기안하기+
		public void approvereqAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException;
		
		//기안-진행문서함리스트+
		public void onapprovalAction(HttpServletRequest req, Model model);
		
		//기안-완료문서함리스트+
		public void comapprovalAction(HttpServletRequest req, Model model);
		
		//기안-반려문서함리스트+
		public void rejapprovalAction(HttpServletRequest req, Model model);
		
		//임시보관함리스트+
		public void templistAction(HttpServletRequest req, Model model);
		
		//임시보관함삭제+
		public void deleteTemp(HttpServletRequest req, Model model);
		
		//임시보관함-결재정보수정페이지+ 
		public void modifydocFormList(HttpServletRequest req, Model model);
		
		//임시보관함- 수정한 정보 뿌리기+
		public void modifydocViewAction(HttpServletRequest req, Model model);

		//수정하기 상세페이지+
		public void modifydocAction(HttpServletRequest req, Model model);

		//결재대기함 리스트+
		public void checkoutlistAction(HttpServletRequest req, Model model);

		//임시보관-임시보관
		void tempSavetepAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException;
*/
		

		
		

}/////////////////
