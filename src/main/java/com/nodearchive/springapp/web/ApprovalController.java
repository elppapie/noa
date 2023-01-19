package com.nodearchive.springapp.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nodearchive.springapp.service.ApprovalServiceImpl;
import com.nodearchive.springapp.service.impl.ApprovalDTO;
import com.nodearchive.springapp.service.impl.MembersDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/Approval")
//@SessionAttributes("loginMember")//m_id--->로그인한 사람
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	 //로그를 수집할 클래스의 변수 선언
	
	//Sub Menu =============================================
	
	/*
	결재목록 "/Approval/approvalmain.kosmo"
	새결재 "/Approval/selectform.kosmo"
	문서함 "/Approval/approvallist.kosmo"
	임시저장함 "/Approval/templist.kosmo"
	*/
	
	//Main ==================================================
	
	@RequestMapping("/approvalmain.kosmo")
	public String approvalMain(Model model, HttpSession session, Map map) {
	//public ModelAndView approvalMain(ModelAndView model, HttpSession session, Map map) {
	//public ModelAndView approvalMain(@SessionAttribute(name = "loginMember", required = false) Member loginMember,ModelAndView model) {
		session.setAttribute("user", "kim1234@samsung.com");
		String user= session.getAttribute("user").toString(); //로그인 후 세션에 저장된 아이디(일단 username으로..)
		map.put("user", user);
		int approvalCount_YET = service.approvalCount_YET(map);//결재 대기
		int approvalCount_UNDER = service.approvalCount_UNDER(map);//결재 진행
		int approvalCount_DONE = service.approvalCount_DONE(map);//결재 완료

		List<Map> mainList = null; // 내 결재 목록


		System.out.println(approvalCount_YET);
		System.out.println(approvalCount_UNDER);
		System.out.println(approvalCount_DONE);

		mainList = service.getRecentList(map);

		System.out.println("mainList : " + mainList);

		model.addAttribute("mainList", mainList);
		model.addAttribute("approvalCount_YET", approvalCount_YET);
		model.addAttribute("approvalCount_UNDER", approvalCount_UNDER);
		model.addAttribute("approvalCount_DONE", approvalCount_DONE);
		//model.setViewName("approval/approvalmain.noa");

		//return model;
		return "approval/approvalmain.noa";
	}
	
	//View ==================================================
	//상세 페이지로 이동 - 결재/반려 (내가 결재 해야하는 문서)
	@RequestMapping("/read.kosmo")
	public String read(@RequestParam("approval_code") String approval_code, Model model, Map map) throws Exception {
		logger.info("ApprovalController -> read.kosmo");
		map.put("approval_code", approval_code);
		Map read = service.read(map);
		model.addAttribute("read",read);
		return "/approval/read.noa";
	}
	
	//상세 페이지로 이동 - 결재 상태 확인 (내가 결재 요청한 문서)
	@RequestMapping("/check.kosmo")
	public String check(@RequestParam("approval_code") String approval_code, Model model, Map map) throws Exception {
		logger.info("ApprovalController -> check.kosmo");
		map.put("approval_code", approval_code);
		Map check = service.check(map);
		model.addAttribute("check",check);
		return "/approval/check.noa";
	}
	
	//상세 페이지로 이동 - 임시 보관한 문서 결재/수정/삭제 
	@RequestMapping("/tempcheck.kosmo")
	public String tempcheck(@RequestParam("approval_code") String approval_code, Model model, Map map) throws Exception {
		logger.info("ApprovalController -> tempcheck.kosmo");
		map.put("approval_code", approval_code);
		Map tempcheck = service.tempcheck(map);
		model.addAttribute("tempcheck",tempcheck);
		return "/approval/tempcheck.noa";
	}
	
	//Write ==================================================
	
	//문서 작성 페이지로 이동 - 버튼을 누르면, 글을 작성할 수 있는 페이지로 이동시켜주는 컨트롤러
	@RequestMapping("/selectform.kosmo")
	public String writeApp() throws Exception {
		logger.info("ApprovalController -> writeApp.kosmo");
		return "/approval/selectform.noa";
		}
/*
	// 새 결재 작성
	@RequestMapping("/insertApp.kosmo")
	public String insertApp(Model model, Map map) throws Exception {
		logger.info("ApprovalController -> insertApp.kosmo");
		Map insertApp = service.insertApp(map);
		model.addAttribute("insertApp",insertApp);
		return "/approval/selectform.noa";
		}
*/
	
	/*
	//기안문 작성 후 저장
	@RequestMapping(value = "/selectform.kosmo", method = RequestMethod.POST)
	public String saveapp(MultipartHttpServletRequest req, Model model, Map map) throws ServletException, IOException{
		logger.info("ApprovalController -> saveapp.kosmo");
		List<Map> saveapp = service.saveapp(map);
		model.addAttribute("saveapp",saveapp);
		return "/approval/approvallist.noa";
	}*/

	/*
	//새결제-결제정보선택리스트
	@RequestMapping("/selectform.kosmo")
	public String selectform(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info("ApprovalController -> selectform.kosmo");
		service.selectFormList(req, model);
		return "/approval/selectform.noa";
	}

	//새결제-결제정보선택리스트
	@RequestMapping("/selectAllmemform.kosmo")
	public String selectAllmemform(HttpServletRequest req, Model model) throws ServletException, IOException{
		logger.info("ApprovalController -> selectform.kosmo");
		service.selectAllFormList(req, model);
		return "/approval/selectform.noa";
	}
	*/

	//List ==================================================
	
	//문서리스트[상태(status): 임시(0) 대기(1) 진행중(2) 완료(3) 반려(4) ]
	//전체 리스트- 발신 목록(메인화면)

	@RequestMapping("/approvallist.kosmo")
	public String applist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> applist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> applist = service.applist(map);
		model.addAttribute("applist",applist);
		return "/approval/approvallist.noa";
	}
	
	//임시 리스트 임시(0)
	@RequestMapping("/templist.kosmo")
	public String templist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> templist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> templist = service.templist(map);
		model.addAttribute("templist",templist);
		return "/approval/templist.noa";
	}
	
	//대기 리스트 대기(1)
	@RequestMapping("/waitlist.kosmo")
	public String waitlist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> waitlist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> waitlist = service.waitlist(map);
		model.addAttribute("waitlist",waitlist);
		return "/approval/waitlist.noa";
	}
	//진행 리스트 진행중(2)
	@RequestMapping("/onlist.kosmo")
	public String onlist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> onlist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> onlist = service.onlist(map);
		model.addAttribute("onlist",onlist);
		return "/approval/onlist.noa";
	}
	//완료 리스트 완료(3)
	@RequestMapping("/comlist.kosmo")
	public String comlist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> comlist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> comlist = service.comlist(map);
		model.addAttribute("comlist",comlist);
		return "/approval/comlist.noa";
	}
	//반려 리스트 반려(4)
	@RequestMapping("/rejectlist.kosmo")
	public String rejectlist(HttpServletRequest req, Model model, Map map) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> rejectlist.kosmo");
		//map에 status값 저장되서 넘어오면
		List<Map> rejectlist= service.rejectlist(map);
		model.addAttribute("rejectlist",rejectlist);
		return "/approval/rejectlist.noa";
	}
		///////////////////////////////////////////////////////////////////////
		
	
	/*	
		//임시저장
		//기안문 작성 및 임시보관 완료 시 Action
		@RequestMapping("/tempSave.kosmo")
		public String tempSave(MultipartHttpServletRequest req, Model model) throws ServletException, IOException{
			logger.info("ApprovalController -> tempSave.kosmo");
			service.tempSaveAction(req, model);
			return "/approval/draftInsertAction.noa";
		}
	
		
		//임시보관함 삭제
		@RequestMapping("//deleteTemp.kosmo")
		public void deleteTemp(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
			logger.info("ApprovalController -> deleteTemp.kosmo");
			service.deleteTemp(req, model);
			String viewPage = req.getContextPath() + "/templist.kosmo?stateid=temp";
			res.sendRedirect(viewPage);
		}
		
		//임시보관함-결재정보수정페이지 
		@RequestMapping("/modifydocView.kosmo")
		public String modifydocView(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			logger.info("ApprovalController -> modifydocView.kosmo");
			service.modifydocFormList(req, model);
			return "/approval/modifydocView.noa";
		}
		

		//임시보관함 수정
		@RequestMapping("/modifydoc.kosmo")
		public void modifydoc(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
			logger.info("ApprovalController -> modifydoc.kosmo");
			service.modifydocAction(req, model);
			int approval_code = Integer.parseInt(req.getParameter("approval_code"));//기안문서번호
			String viewPage = req.getContextPath() + "/selectmemberLine.ap?APPROVAL_CODE="+approval_code;
			res.sendRedirect(viewPage);
		}
		
		//임시보관함- 수정한 정보 뿌리기
		@RequestMapping("/reselectLineViewAction.kosmo")
		public String modifydocViewAction(HttpServletRequest req, HttpServletResponse res, Model model) 
				throws ServletException, IOException{
			logger.info("ApprovalController -> reselectLineViewAction.ap");
			service.modifydocViewAction(req, model);
			return "/approval/modifydoc_view.noa";
		}
		
		
		//기안하기 ->결재 요청
		//기안문 작성 및 기안 완료 시 Action
		@RequestMapping("/approvereq.kosmo")
		public String approvereq(MultipartHttpServletRequest req, Model model) throws ServletException, IOException{
			logger.info("ApprovalController -> approvereq.kosmo");
			service.approvereqAction(req, model);
			return "/approval/draftInsertAction.noa";
		}
		
*/
}
