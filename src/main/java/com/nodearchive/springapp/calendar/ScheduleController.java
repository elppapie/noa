package com.nodearchive.springapp.calendar;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Schedule")
public class ScheduleController {
	
	//주간 달력
	@RequestMapping("/week.kosmo")
	public String weekly(
//			Authentication auth,
			) {
		return "schedule/Week";
	}
	
	//월간 달력(메인)
	@RequestMapping("/month.kosmo")
	public String monthly(
			//Authentication auth,
			) {
		return "schedule/Month";
	}
	
	//연간 달력
	@RequestMapping("/year.kosmo")
	public String yearly(
			//Authentication auth,
			) {
		return "schedule/Year";
	}
}
