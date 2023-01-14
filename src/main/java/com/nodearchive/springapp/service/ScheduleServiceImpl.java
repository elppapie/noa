package com.nodearchive.springapp.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.AddressDAO;
import com.nodearchive.springapp.service.impl.ScheduleDAO;
import com.nodearchive.springapp.service.impl.ScheduleDTO;

//서비스 로직
@Service
public class ScheduleServiceImpl implements ScheduleService<Map>{
	
	@Autowired
	private ScheduleDAO dao;
	
	@Autowired
	private AddressDAO addrdao;
	
	// 일정 목록 구현시 스크롤바 사용 (페이징 x)

	// 현재 시스템시간 
	@Override
	public List<Map> selectList(Map map, HttpServletRequest req) {
		
		//map에 넘어온 값은 아이디, 선택한 구간의 시작시간/끝시간
		//사용자가 접속한 네트워크의 시간을 알아오면 좋겠지만 당장 모르겠으니 new Date()로 얻자
		//넘어온 화면이 연/월/일인지 확인하는 flag도 같이 넘겨와야 구간을 그거에 맞춰서 자르지
		//new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getTime());
		String sche_start="";
		String sche_end="";
		String startTime = "00:00:00";
		String endTime = "23:59:59";
		
		//한 주를 가져올 때
		Calendar c = Calendar.getInstance();
		//first day of week
		c.set(Calendar.DAY_OF_WEEK, 1);
		int year1 = c.get(Calendar.YEAR);
		int month1 = c.get(Calendar.MONTH)+1;
		int day1 = c.get(Calendar.DAY_OF_MONTH);
		//last day of week
		c.set(Calendar.DAY_OF_WEEK, 7);
		int year7 = c.get(Calendar.YEAR);
		int month7 = c.get(Calendar.MONTH)+1;
		int day7 = c.get(Calendar.DAY_OF_MONTH);
		
		//오늘날짜 구하기
		Calendar c1 = Calendar.getInstance();
		int today = c1.get(Calendar.DATE);
		int month = c1.get(Calendar.MONTH)+1;
		int year = c1.get(Calendar.YEAR);
		int lastDayOfMonth = c1.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		System.out.println("[⚜] flag:"+map.get("flag"));
		
		//month 전달할 때 01 이면 1로 모양 변해버리는 거 왜냐면 int에다가 저장해서
		String monthStr = month < 10 ? "0"+month : String.valueOf(month);
		
		
		if((String)map.get("flag") != null) {
			String flagValue = (String)map.get("flag");
			switch(flagValue) {
				case "year":
					sche_start= String.format("%s-%s-%s %s",year,"01","01",startTime);
					sche_end= String.format("%s-%s-%s %s",year,"12","31",endTime);
					break;
				case "month": 
					sche_start= String.format("%s-%s-%s %s",year,monthStr,"01",startTime);
					sche_end= String.format("%s-%s-%s %s", year,monthStr,lastDayOfMonth,endTime);
					break;
				case "week":
					sche_start= String.format("%s-%s-%s %s",year1,month1,day1,startTime);
					sche_end= String.format("%s-%s-%s %s",year7,month7,day7,endTime);
					break;
				case "day":
					sche_start= String.format("%s-%s-%s %s",year,c1.get(Calendar.MONTH)+1,c1.get(Calendar.DATE),startTime);
					sche_end= String.format("%s-%s-%s %s",year,c1.get(Calendar.MONTH)+1,c1.get(Calendar.DATE),endTime);					
					break;
			}///////////switch
		}//////////if
		System.out.println("[⚜] 시작시간(sche_start):"+sche_start+"/ 끝시간(sche_end):"+sche_end);
		map.put("sche_start", sche_start);
		map.put("sche_end", sche_end);
		
		
		return dao.findRecordByPeriod(map);
	}
	
	/*
	// 선택한 기간단위별 뷰 뿌려주기용
	public List<Map> selectListForPeriod(Map map, HttpServletRequest req) {
		//map에 넘어온 값은 아이디, 선택한 구간의 시작시간/끝시간
		//사용자가 접속한 네트워크의 시간을 알아오면 좋겠지만 당장 모르겠으니 new Date()로 얻자
		//넘어온 화면이 연/월/일인지 확인하는 flag도 같이 넘겨와야 구간을 그거에 맞춰서 자르지
		//new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getTime());
		String sche_start="";
		String sche_end="";
		String startTime = "00:00:00";
		String endTime = "23:59:59";
		
		//Calendar타입으로 전달받은 특정 날짜를 가져오기
		
		//한 주를 가져올 때
		Calendar c = Calendar.getInstance();
		//first day of week
		c.set(Calendar.DAY_OF_WEEK, 1);
		int year1 = c.get(Calendar.YEAR);
		int month1 = c.get(Calendar.MONTH)+1;
		int day1 = c.get(Calendar.DAY_OF_MONTH);
		//last day of week
		c.set(Calendar.DAY_OF_WEEK, 7);
		int year7 = c.get(Calendar.YEAR);
		int month7 = c.get(Calendar.MONTH)+1;
		int day7 = c.get(Calendar.DAY_OF_MONTH);
		
		//오늘날짜 구하기
		Calendar c1 = Calendar.getInstance();
		int today = c1.get(Calendar.DATE);
		int month = c1.get(Calendar.MONTH)+1;
		int year = c1.get(Calendar.YEAR);
		int lastDayOfMonth = c1.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		System.out.println("[⚜] flag:"+map.get("flag"));
		
		//month 전달할 때 01 이면 1로 모양 변해버리는 거 왜냐면 int에다가 저장해서
		String monthStr = month < 10 ? "0"+month : String.valueOf(month);
		
		
		if((String)map.get("flag") != null) {
			String flagValue = (String)map.get("flag");
			switch(flagValue) {
				case "year":
					sche_start= String.format("%s-%s-%s %s",year,"01","01",startTime);
					sche_end= String.format("%s-%s-%s %s",year,"12","31",endTime);
					break;
				case "month": 
					sche_start= String.format("%s-%s-%s %s",year,monthStr,"01",startTime);
					sche_end= String.format("%s-%s-%s %s", year,monthStr,lastDayOfMonth,endTime);
					break;
				case "week":
					sche_start= String.format("%s-%s-%s %s",year1,month1,day1,startTime);
					sche_end= String.format("%s-%s-%s %s",year7,month7,day7,endTime);
					break;
				case "day":
					sche_start= String.format("%s-%s-%s %s",year,c1.get(Calendar.MONTH)+1,c1.get(Calendar.DATE),startTime);
					sche_end= String.format("%s-%s-%s %s",year,c1.get(Calendar.MONTH)+1,c1.get(Calendar.DATE),endTime);					
					break;
			}///////////switch
		}//////////if
		System.out.println("[⚜] 시작시간(sche_start):"+sche_start+"/ 끝시간(sche_end):"+sche_end);
		map.put("sche_start", sche_start);
		map.put("sche_end", sche_end);
		
		
		return dao.findRecordByPeriod(map);
	}
	*/
	
	// 일정 상세보기용(일정 하나 클릭시)
	// 로그인한 사람의 권한 확인
	public Map view(Map map) {
		return dao.view(map);
	}
	// 일정 참조인 목록보기
	public List viewRef(Map map) {
		return dao.findRefByNo(map);
	}
	
	
	
	// 일정 입력용
	@Override
	public int insert(Map map) {
		String sche_startdate = (String)map.get("sche_startdate_d")+" "+(String)map.get("sche_startdate_t");
		String sche_enddate = (String)map.get("sche_enddate_d")+" "+(String)map.get("sche_enddate_t");
		map.put("sche_startdate", sche_enddate);
		map.put("sche_enddate", sche_enddate);
		return dao.insertSche(map);
	}
	
	/*
		일정을 입력한 후에 해당 일정번호를 가져오는 (TOP 쿼리문) 쿼리를 실행해서
		일정 참조인 입력용 테이블에 sche_no를 전달해야하는데...  
	*/
	
	/*
	// 일정 참조인 입력용 - 일단은 일정 입력용에서 입력하는걸로 시도해보고 안되면 다시 살리기
	public int insertRef(Map map) {
		String sche_no="";
		
		// 참조인 이름-아이디를 고르게 한 후 아이디를 가져와서
		// AddressDAO.java 에 getOneMember메소드 작성 - 가져온 아이디를 분리해서...id를 해당 메소드에 넣어서 
		
		for(int i=0; i<map.size(); i++) {
			Map mapForOne = null;
			mapForOne.put("id",(map.get(Integer.toString(i+1))));
			mapForOne.put("sche_no", sche_no);
//			dao.i n s e r t R e f(mapForOne); //한사람씩 레코드에 넣음
		}
		
		
		return 0;
	}
	
	*/

	@Override
	public int delete(Map map) {
		
		//int affected = dao.find
		
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
	
}
