package com.nodearchive.springapp.web;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.nodearchive.springapp.service.AttendanceService;
import com.nodearchive.springapp.service.impl.AttendanceDTO;




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
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication auth, 
			HttpServletRequest request,
			ModelAndView mv) {
		System.out.println("출퇴근 리스트진입");
		try {
			//세션값
			UserDetails authenticated = (UserDetails)auth.getPrincipal();
			String m_id=authenticated.getUsername();
			System.out.println(m_id);
			
			mv.addObject("m_id", m_id);
		
			//검색
			String state = att_state;
			String start = startdate;
			String end = enddate;
			
			System.out.println("state : " + state);
			System.out.println("start : " + start);
			System.out.println("end : " + end);
			
		
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("att_state", state);
			map.put("startdate", start);
			map.put("enddate", end);
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
		    
			if (startdate == null || startdate == "" && enddate == null || enddate == "" && att_state == null || att_state == "") {
				System.out.println("if로 들어옴");
				mv.addObject("list", attService.selectDailyAtt(currentPage, LIMIT, m_id));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage1);
				mv.addObject("listCount", listCount1);
				mv.setViewName("attendance/dailyAtt.noa");
			} else if(startdate != null || startdate != "" && enddate != null || enddate != "" && att_state != null || att_state != "") {
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
	}/////selectDailyAtt()
	
	
	//qr 새창 띄우기
	@GetMapping("/qrenter.kosmo")
	public ModelAndView qrenter(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("attendance/qrenter");
		return mv;
	}
	@GetMapping("/qrleave.kosmo")
	public ModelAndView qrscanner(ModelAndView mv) {
		System.out.println("스캐너호출");
		mv.setViewName("/attendance/qrleave");
		return mv;
	}
			
	//QR 인서트 - 출근
	@RequestMapping(value = "/attendance/enter", method = RequestMethod.GET) //#qrenter에서 popupOpen()
	public String insertEnter(AttendanceDTO dto, 
			Authentication auth,
			HttpServletRequest request, 
			RedirectAttributes rttr //redirect시 데이터를 전달
			) {
		try {
			System.out.println("인서트진입");
			
			
			UserDetails authenticated = (UserDetails)auth.getPrincipal();
			String m_id=authenticated.getUsername();
			System.out.println(m_id);
		    
			String enterInfo = request.getParameter("enterInfo"); 
			System.out.println(enterInfo);
			String [] array = enterInfo.split(",");
		
			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}

			String att_startdate = array[0]; //getTimeStamp()
			String id = array[1]; 	//m_id
						
			dto.setM_id(m_id);
			dto.setAtt_startdate(att_startdate);
		
			
			
			//QR시간
			String day1 = array[0]; 
			java.sql.Timestamp t1 = java.sql.Timestamp.valueOf(day1);
			System.out.println("결과확인 " + t1);
			
			//기준시간
			String day2 = "2023-01-01 09:01:00"; // 형식을 지켜야 함
			java.sql.Timestamp t2 = java.sql.Timestamp.valueOf(day2);
			System.out.println("결과확인 " + t2);
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); 
			
			String s1 = sdf.format(t1);
			String s2 = sdf.format(t2);
			int qrT = Integer.parseInt(s1);
			int standardT = Integer.parseInt(s2);
			
			System.out.println("qrT " + qrT );
			System.out.println("standardT " + standardT);
			if(qrT > standardT) {
				System.out.println("aaa로 ");
				int state = 1;
//				c.setCstate(state);
//				c.setCreason("지각");
				dto.setAtt_state(state);
				System.out.println("지각");
			} else {
				System.out.println("bbb로 ");
				int state = 0;
//				c.setCstate(state);
				dto.setAtt_state(state);
				System.out.println("정상출근");
			}
			attService.insertEnter(dto);
			rttr.addFlashAttribute("message", "window.open(\"about:blank\", \"_self\").close();");
			rttr.addFlashAttribute("alert", "alert(\"출근이 인증되었습니다.\");");
		} catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:qrenter";
	}
		
	//QR 인서트 - 퇴근
	@RequestMapping(value = "/attendance/leave", method = RequestMethod.GET)
	public String updateLeave(AttendanceDTO dto, 
			HttpServletRequest request, 
			RedirectAttributes rttr) {
		try {
			System.out.println("퇴근인서트진입");
			String enterInfo = request.getParameter("enterInfo");
			System.out.println(enterInfo);
			String [] array = enterInfo.split(",");

			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}
//			String cendtime = array[0];
//			System.out.println("aa" + cendtime);
//			String dno = array[1];
//			System.out.println("bb" + cendtime);
//			String uno = array[2];
//			System.out.println(" cc" + uno);
//			c.setCendtime(cendtime);
//			c.setUname(uno);
			
//			dto.setAtt_enddate(att_enddate);
//			dto.setM_id(m_id);
			
			attService.updateLeave(dto);
			rttr.addFlashAttribute("message", "window.open(\"about:blank\", \"_self\").close();");
			rttr.addFlashAttribute("alert", "alert(\"퇴근이 인증되었습니다.\");");
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", e.getMessage());
			return "redirect:erropage";
		}
		return "redirect:qrleave";
	}

	
	
	//월근무내역Attendance/monthlylist.kosmo
	@RequestMapping("/monthlylist.kosmo")
	public ModelAndView selectMonthAtt(
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "startdate", required = false) String startdate,
			@RequestParam(name = "enddate", required = false) String enddate,
			Authentication auth, 
			HttpServletRequest request, 
			ModelAndView mv) {
		
			System.out.println("월근무 리스트진입");
			
			mv.setViewName("attendance/monthAtt.noa");
			
			System.out.println("startdate : " + startdate);
		
		try {
			//세션값
			UserDetails authenticated = (UserDetails)auth.getPrincipal();
			String m_id=authenticated.getUsername();
			System.out.println(m_id);
			// 한 페이지당 출력할 목록 갯수, 페이징
			int currentPage = page;

			//검색
			String start = startdate;
			
			String end = enddate;
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("startdate", start);
			map.put("enddate", end);
			map.put("m_id", m_id);

			int allListCount = attService.mAllCount(m_id);
			System.out.println("카운트1 : " + allListCount);
			int allmaxPage = (int) ((double) allListCount / LIMIT + 0.9);
			
			int searchListCount = attService.msearchCount(map);
			System.out.println("카운트2 : " + searchListCount);
			int searchmaxPage = (int) ((double) searchListCount / LIMIT + 0.9);
			
			
			
			//
			if (startdate == null && enddate == null) {
				System.out.println("if로 들어옴");
				
				mv.addObject("list", attService.selectMonthAtt(currentPage, LIMIT, m_id));
				System.out.println("결과 확인 : "+ attService.selectMonthAtt(currentPage, LIMIT, m_id));
				
				// 월초, 월말
				Calendar cal = Calendar.getInstance();
				int firstDay = 1;
				int lastDay = cal.getActualMaximum( Calendar.DAY_OF_MONTH );
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				if( startdate == null || startdate.equals("") ) {
					cal.set( Calendar.DAY_OF_MONTH, firstDay );
					startdate = sdf.format( cal.getTime() );
				}
				if( enddate == null || enddate.equals("") ) {
					cal.set( Calendar.DAY_OF_MONTH, lastDay);
					enddate = sdf.format( cal.getTime() );
				}
				
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", allmaxPage);
				mv.addObject("listCount", allListCount);
				mv.addObject("startdate", startdate);
				mv.addObject("enddate", enddate);
				mv.setViewName("attendance/monthAtt.noa");
			} 
			else if(startdate != null && enddate != null) {
				System.out.println("else로 들어옴");
				mv.addObject("list", attService.searchMonthAtt(map));
				System.out.println("결과 확인 : " + attService.searchMonthAtt(map));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", searchmaxPage);
				mv.addObject("listCount", searchListCount);
				mv.addObject("startdate", startdate);
				mv.addObject("enddate", enddate);
				mv.setViewName("attendance/monthAtt.noa");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
//	@ResponseBody
////	@RequestMapping(value = "/commute/getDailyCommute", method = RequestMethod.GET)
//	@GetMapping("/getDailyAtt")
//    public String getDailyVisitor(
//    					String month,
//    					@RequestParam("m_id") String m_id
//    					//Authentication authentication
//    					){
//		System.out.println("month : " + month);
//		
//		//세션값
//		//CustomUserDetails userdetail = (CustomUserDetails) authentication.getPrincipal();
//	    //String uno=userdetail.getUno();
//		//String cooContractNo = uno;
//		String id=m_id;
//		String cooContractNo=id;
//        System.out.println(cooContractNo);
//        Gson gson = new Gson();
//        HashMap<String,String> map = new HashMap<String,String>();
//        map.put("month", month);
//
//        List<AttendanceDTO> list= attService.testAtt(id);
//        System.out.println("여기" + list);
//        return gson.toJson(list);
//    } 
	
	
	// 근무시간 응답하기
	@ResponseBody
	@GetMapping("/getDailyAtt.kosmo")
	public ResponseEntity<List<AttendanceDTO>> getDailyWorkTime(
						@RequestParam(name = "startdate", required = false) String startdate,
						@RequestParam(name = "enddate", required = false) String enddate,
						Authentication auth
			) {
	
		//세션값
		UserDetails authenticated = (UserDetails)auth.getPrincipal();
		String m_id=authenticated.getUsername();
		System.out.println(m_id);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		map.put("m_id", m_id);
		List<AttendanceDTO> list =  attService.searchMonthAtt(map);
		
		return new ResponseEntity<List<AttendanceDTO>>(list, HttpStatus.OK);
	}

}/////class

