package com.nodearchive.springapp.web;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nodearchive.springapp.service.AttendanceService;




@Controller
@RequestMapping("/Attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attService;
	public static final int LIMIT = 10;
	
	//출퇴근 메인페이지
	@RequestMapping("/dailylist.kosmo")
	public ModelAndView selectDailyAtt(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "att_state", required = false) String att_state,
			@RequestParam(name = "att_startdate", required = false) String att_startdate,
			@RequestParam(name = "att_enddate", required = false) String att_enddate,
			//Authentication authentication, 
			HttpServletRequest request,
			ModelAndView mv) {
		System.out.println("출퇴근 리스트진입");
		try {
			//세션값
			//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			//String uno=userdetail.getUno();
			String m_id="kim1234@samsung.com";
			//System.out.println(uno);
		
			//검색
			
			String state = att_state;
			
			String start = att_startdate;
			
			String end = att_enddate;
			
		
			Map map = new HashMap<>();
			map.put("att_state", state);
			map.put("att_startdate", start);
			map.put("att_enddate", end);
			map.put("m_id", m_id);
			System.out.println("출퇴근map"+map);
			//페이징 
			int currentPage = page;
			int listCount1 = attService.allListCount(m_id);
			int listCount2 = attService.listCount(map);
			int maxPage1 = (int) ((double) listCount1 / LIMIT + 0.9);
			int maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			System.out.println(listCount1);
			System.out.println(listCount2); 
		    
			if (att_startdate == null || att_startdate == "" && att_enddate == null || att_enddate == "" && att_state == null || att_state == "") {
				System.out.println("if로 들어옴");
				mv.addObject("list", attService.selectDailyAtt(currentPage, LIMIT, m_id));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage1);
				mv.addObject("listCount", listCount1);
				mv.setViewName("attendance/dailyAtt.noa");
			} else if(att_startdate != null || att_startdate != "" && att_enddate != null || att_enddate != "" && att_state != null || att_state != "") {
				System.out.println("else로 들어옴");
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage2);
				mv.addObject("listCount", listCount2);
				mv.addObject("list", attService.searchDailyAtt(map));
				mv.setViewName("attendance/dailyAtt.noa"); //타일즈 적용을 위해 뒤에 .noa 붙이기
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}///selectDailyAtt()
	
	//qr 새창 띄우기
	@GetMapping("/qrenter.kosmo")
	public ModelAndView qrenter(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("attendance/qrenter.noa");
		return mv;
	}
	@GetMapping("/qrleave.kosmo")
	public ModelAndView qrscanner(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("attendance/qrleave.noa");
		return mv;
	}
	
	//월근무내역Attendance/monthlylist.kosmo
	@GetMapping("/monthlylist.kosmo")
	public ModelAndView selectMonthCommute(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "att_startdate", required = false) String att_startdate,
			@RequestParam(name = "att_enddate", required = false) String att_enddate,
			//Authentication authentication, 
			HttpServletRequest request, 
			ModelAndView mv) {
		
		System.out.println("월근무 리스트진입");
		
		try {
			//세션값
			//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
			//String uno=userdetail.getUno();
			//System.out.println(uno);
			String m_id="kim1234@samsung.com";
			// 한 페이지당 출력할 목록 갯수, 페이징
			int currentPage = page;

			//검색
			String start = att_startdate;
			
			String end = att_enddate;
			
			Map paramMap = new HashMap<>();
			paramMap.put("att_startDate", start);
			paramMap.put("att_endDate", end);
			paramMap.put("m_id", m_id);

			int allListCount = attService.mAllCount(m_id);
			System.out.println("카운트1 : " + allListCount);
			int allmaxPage = (int) ((double) allListCount / LIMIT + 0.9);
			
			int searchListCount = attService.msearchCount(paramMap);
			System.out.println("카운트2 : " + searchListCount);
			int searchmaxPage = (int) ((double) searchListCount / LIMIT + 0.9);
			
			//
			if (att_startdate == null && att_enddate == null) {
				System.out.println("if로 들어옴");
				mv.addObject("list", attService.selectMonthAtt(currentPage, LIMIT, m_id));
				System.out.println("결과 확인 : "+ attService.selectMonthAtt(currentPage, LIMIT, m_id));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", allmaxPage);
				mv.addObject("listCount", allListCount);
				mv.setViewName("commute/monthcommute");
			} else if(att_startdate != null && att_enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", attService.searchMonthAtt(paramMap));
				System.out.println("결과 확인 : " + attService.searchMonthAtt(paramMap));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", searchmaxPage);
				mv.addObject("listCount", searchListCount);
				mv.setViewName("attendance/monthAtt.noa");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	/*
	@ResponseBody
	@RequestMapping(value = "/commute/getDailyCommute", method = RequestMethod.GET)
    public String getDailyVisitor(
    					String month
    					//Authentication authentication
    					){
		//세션값
		//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
	    String uno=userdetail.getUno();
	    
		String cooContractNo = uno;
        System.out.println(cooContractNo);
        Gson gson = new Gson();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("month", month);

        List<CommuteDto> list= commuteServ.testCommute(uno);
        System.out.println("여기" + list);
        return gson.toJson(list);
    }*/

}/////class
