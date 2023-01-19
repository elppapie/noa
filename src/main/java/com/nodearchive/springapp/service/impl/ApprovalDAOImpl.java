package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nodearchive.springapp.service.impl.ApprovalDTO;
import com.nodearchive.springapp.service.impl.ApproverDTO;



@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	
	@Autowired
	SqlSession sqlSession2;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//Main ==================================================
	
	//메인화면
	@Override
	public void approvalMain(HttpServletRequest req, Model model) {
		
		
	}

	//메인화면- 결재 대기0

	@Override
	public int approvalCount_YET(Map map) {
		System.out.println("ApprovalDAO - approvalCount_YET");
		return sqlSession.selectOne("approvalCount_YET",map);
	}
	

	//메인 화면- 결재 진행1
	@Override
	public int approvalCount_UNDER(Map map) {
		System.out.println("ApprovalDAO - approvalCount_UNDER");
		return sqlSession.selectOne("approvalCount_UNDER",map);	
	}

	//메인 화면- 결재 완료2
	@Override
	public int approvalCount_DONE(Map map) {
		System.out.println("ApprovalDAO - approvalCount_DONE");
		return sqlSession.selectOne("approvalCount_DONE",map);
	}

	//메인 화면-내 결재 목록 
	@Override
	public List<Map> getRecentList(Map map) {
		System.out.println("ApprovalDAO - getRecentList");
		List<Map> list = sqlSession.selectList("getRecentList",map);
		return list;
	}

	//List ==================================================
	
	//전체리스트
	public List applist(Map map) {		
		return sqlSession.selectList("applist",map);
	}

	//임시리스트 임시(0)
	public List templist(Map map) {
	return sqlSession.selectList("templist",map);
	}
	
	//대기 리스트 대기(1)
	public List waitlist(Map map) {
		return sqlSession.selectList("waitlist",map);
	}
	//진행 리스트 진행중(2)
	public List onlist(Map map) {
		return sqlSession.selectList("onlist",map);
	}
	//완료 리스트 완료(3)
	public List comlist(Map map) {
		return sqlSession.selectList("comlist",map);
	}
	//반려 리스트 반려(4)
	public List rejectlist(Map map) {
		return sqlSession.selectList("rejectlist",map);
	}


	//Write ==================================================

/*
	//새 결재 작성하기
	public Map insertApp(Map map) {
		
		return sqlSession.insert("insertapp",map);
	}
	
	//새결재 저장하기

	public List<Map> saveapp(Map map) {

		return sqlSession.insert("saveapp",map);
	}

*/

	//View ==================================================
	//상세보기

	public Map read(Map map) {
		
		return sqlSession.selectOne("read",map);
	}

	public Map check(Map map) {
		
		return sqlSession.selectOne("check",map);
	}
	
	public Map tempcheck(Map map) {
		
		return sqlSession.selectOne("tempcheck",map);
	}



	
	/*
	//결재정보 리스트 불러오기
	@Override
	public List<MembersDTO> selectMember(String m_id) {
		System.out.println("ApprovalDAO - selectMember");
		List<MembersDTO> list = sqlSession.selectList("selectMember", m_id);
		return list;
	}



	//메인화면
	@Override
	public void approvalMain(HttpServletRequest req, Model model) {
		
		
	}



	//새결제-결재정보선택리스트
	@Override
	public void selectFormList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}


	//새결제-결제정보선택리스트(모든부서노출)
	@Override
	public void selectAllFormList(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}
	

	// 새결재진행 -모든 부서 결재정보 리스트 불러오기

	@Override
	public List<MembersDTO> selectAllMember() {
		System.out.println("ApprovalDAO - selectAllMember");
		List<MembersDTO> list = sqlSession.selectList("selectMember");
		return list;
	}
	

	//임시보관(임시저장)하기
	@Override
	public void tempSave(ApproverDTO dto) {
		System.out.println("ApprovalDAO - tempSave");
		sqlSession.insert("tempSave", dto);

	}

	//기안하기
	@Override
	public void approvereq(ApproverDTO dto) {
		System.out.println("ApprovalDAO - approvereq");
		sqlSession.insert("approvereq", dto);
		
	}

	//기안-진행문서함리스트

	//public void onapprovalAction(HttpServletRequest req, Model model) {
	@Override
	public List<ApproverDTO> onapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - onapproval");
		List<ApproverDTO> list = sqlSession.selectList("onapproval", map);
		return list;
	}

	//기안-완료문서함리스트
	
	//public void comapprovalAction(HttpServletRequest req, Model model) {
	@Override
	public List<ApproverDTO> comapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - comapproval");
		List<ApproverDTO> list = sqlSession.selectList("comapproval", map);
		return list;
	}

	//기안-반려문서함리스트

	//public void rejapprovalAction(HttpServletRequest req, Model model) {
	@Override
	public List<ApproverDTO> rejapproval(Map<String, Object> map) {
		System.out.println("ApprovalDAO - rejapproval");
		List<ApproverDTO> list = sqlSession.selectList("rejapproval", map);
		return list;
	}

	//임시보관함리스트
	@Override
	public List<ApproverDTO> templist(Map<String, Object> map) {
		System.out.println("ApprovalDAO - templist");
		List<ApproverDTO> list = sqlSession.selectList("templist", map);
		return list;
	}
	

	////임시보관함리스트
	@Override
	public void templistAction(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	

	//임시보관함 삭제
	@Override
	public void deleteTemp(String approval_code) {
		System.out.println("ApprovalDAO - deleteTemp");
		sqlSession.insert("deleteTemp", approval_code);
		
	}

	//임시보관함- 결재정보수정페이지
	@Override
	public void modifydocFormList(Map<String, Object> map) {
		System.out.println("ApprovalDAO - modifydocFormList");
		sqlSession.update("modifydocFormList", map);
	}


	//임시보관함- 수정한 정보 뿌리기
	

	@Override
	public List<ApprovalDTO> modifydocView(){
		System.out.println("ApprovalDAO - modifydocView");
		List<ApprovalDTO> list = sqlSession.selectList("modifydocView");
		return list;
		
	}

	//임시보관함- 수정하기 상세페이지
	@Override
	public void modifydocAction(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	//결재대기함 리스트
	//public void checkoutlistAction(HttpServletRequest req, Model model) {
	/*
	public List<ApproverDTO> checkoutlist(Map<String, Object> map) {
		System.out.println("ApprovalDAO - checkoutlist");
		List<ApproverDTO> list = sqlSession.selectList("checkoutlist", map);
		return list;
	}*/


	/*
	// 기안문서정보
	public List<ApprovalDTO> selectDraftInfo(String approval_code) {
		// TODO Auto-generated method stub
		return null;
	}

	//// 결재라인사원정보
	public List<ApprovalDTO> selectGetterInfo(String approval_code) {
		// TODO Auto-generated method stub
		return null;
	}

	//임시보관함 글 확인
	public int loadstatecheck(int load_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//기안문서정보
	public List<ApprovalDTO> selectDraftInfo(int load_id) {
		// TODO Auto-generated method stub
		return null;
	}


*/






















	
}
