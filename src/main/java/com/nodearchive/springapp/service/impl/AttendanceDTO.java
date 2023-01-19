package com.nodearchive.springapp.service.impl;

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
	private java.sql.Date att_date;
	private int att_worktime;
	private int att_state;
	private double total;
	private String uname;

}
