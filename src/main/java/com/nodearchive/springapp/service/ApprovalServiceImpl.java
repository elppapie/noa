package com.nodearchive.springapp.service;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nodearchive.springapp.service.impl.ApprovalDAOImpl;
import com.nodearchive.springapp.service.impl.ApprovalDTO;
import com.nodearchive.springapp.service.impl.ApprovalFormDTO;
import com.nodearchive.springapp.service.impl.MembersDTO;


@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	ApprovalDAOImpl dao;
	
	//Main ==================================================
	
	//결재 대기(1)
	@Override
	public int approvalCount_YET(Map map) {
		
		return dao.approvalCount_YET(map);
	}
	//결재 진행중(2)
	@Override
	public int approvalCount_UNDER(Map map) {
		
		return dao.approvalCount_UNDER(map);
	}
	//결재 완료(3)
	@Override
	public int approvalCount_DONE(Map map) {
		
		return dao.approvalCount_DONE(map);
	}
	//내 결재 목록
	@Override
	public List<Map> getRecentList(Map map) {
		
		return dao.getRecentList(map);
	}
	
	//List ==================================================
	
	//전체리스트
	public List applist(Map map) {
		return dao.applist(map);
	
	}
	
	
	//임시리스트 임시(0)
	public List templist(Map map) {
		return dao.templist(map);
	
	}

	//대기 리스트 대기(1)
	public List waitlist(Map map) {
		return dao.waitlist(map);
	
	}
	//진행 리스트 진행중(2)
	public List onlist(Map map) {
		return dao.onlist(map);
	
	}
	//완료 리스트 완료(3)
	public List comlist(Map map) {
		return dao.comlist(map);
	
	}
	//반려 리스트 반려(4)
	public List rejectlist(Map map) {
		return dao.rejectlist(map);
	}




	//Write ==================================================
/*
	//새결재 저장하기
	public List<Map> saveapp(Map map) {

		return dao.saveapp(map);	}
	
	//새결재 작성하기
	public Map insertApp(Map map) {
		
		return dao.insertApp(map);
	}
*/
	//Write ==================================================
	//상세보기
	@Override
	public Map read(Map map) {
	
		return dao.read(map);
	}
	public Map check(Map map) {
		
		return dao.check(map);
	}
	public Map tempcheck(Map map) {
	
		return dao.tempcheck(map);
	}



	
	
/*
	//새결제-결제정보선택리스트
	@Override
	public void selectFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectFormList");
		String m_id = (String) req.getSession().getAttribute("m_id");
		List<MembersDTO> list = dao.selectMember(m_id);
		model.addAttribute("list", list);
		
	}

	//새결제-결제정보선택리스트(모든부서노출)
	@Override
	public void selectAllFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - selectAllFormList");
		List<MembersDTO> list = dao.selectAllMember();
		model.addAttribute("list", list);
		
	}

	//임시보관함삭제
	@Override
	public void deleteTemp(HttpServletRequest req, Model model) {
		String approval_code = req.getParameter("approval_code");
		dao.deleteTemp(approval_code);
		//dao.deleteTempLine(approval_code);
		
	}
	// 임시보관함 글 확인
	public void doc_detailAction(HttpServletRequest req, Model model) {
		int load_id = Integer.parseInt(req.getParameter("approval_code"));
		List<ApprovalDTO> list = dao.selectDraftInfo(load_id);
		int selectInt = dao.loadstatecheck(load_id);
		model.addAttribute("selectInt", selectInt);
		System.out.println("selectInt : " + selectInt);
		model.addAttribute("list", list);
	}
	
	//임시보관함-결재정보뿌리기-결재정보수정페이지
	@Override
	public void modifydocFormList(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - modifydocFormList");
		String load_id = req.getParameter("approval_code");//결재경로번호 load_id
		System.out.println("approval_code: " + load_id);
		List<MembersDTO> list = dao.selectMember(load_id);
		model.addAttribute("list", list);
		
	}

	//임시보관함- 수정한 정보 뿌리기
	@Override
	public void modifydocViewAction(HttpServletRequest req, Model model) {
		System.out.println("ApprovalService - modifydocViewAction");
		int approval_code = Integer.parseInt(req.getParameter("approval_code"));//기안문서 번호
		
	}
	
	//임시보관하기

		
	
	//임시보관 - 임시보관

	
	//임시보관 - 기안
		
	//수정하기 상세페이지
	@Override
	public void modifydocAction(HttpServletRequest req, Model model) {
		System.out.println("approvalService => modifydocAction");
		int load_id = Integer.parseInt(req.getParameter("approval_code"));
		// 기안문서정보
		List<ApprovalDTO> list = dao.selectDraftInfo(load_id);
		model.addAttribute("list", list);
	}
*/


}/////////////////
