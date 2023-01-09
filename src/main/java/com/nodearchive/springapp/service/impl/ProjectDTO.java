package com.nodearchive.springapp.service.impl;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProjectDTO {
	//project
	private int project_no;
	private String project_name;
	
	//task
	private int task_no;
	private String task_name;
	private String task_content;
	private String task_categoty;
	
	//report
	private String report_no;
	private java.sql.Date report_regidate;
	private java.sql.Date report_startdate;
	private java.sql.Date report_enddate;
	
	//schedule 테이블에서 가져올 데이터 
	private int sche_no;
	private java.sql.Date sche_startdate;
	private java.sql.Date sche_enddate;
	
	//members 테이블에서 가져올 데이터
	private String m_id;
	private String m_name;
}