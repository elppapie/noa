package com.nodearchive.springapp.calendar;

import java.util.List;

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
public class ScheduleDTO {
	
	private int sche_no;//pk - seq 사용
	private String sche_title;
	private String sche_content;
	private java.sql.Timestamp sche_startdate;
	private java.sql.Timestamp sche_enddate;
	private int sche_mark;
	private int sche_status;
	private String sche_color;
	
	
}
