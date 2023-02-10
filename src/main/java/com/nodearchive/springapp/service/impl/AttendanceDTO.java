package com.nodearchive.springapp.service.impl;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceDTO {
	
	private int att_no;
	private String m_id;
	private String att_startdate;
	private String att_enddate;
	private Date att_date;
	private String att_date_str;		// 2023-01-01
	private double att_worktime;
	private int att_state;
//	private double total;
	private String uname;
	
	

}
