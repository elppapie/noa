package com.nodearchive.springapp.service.impl;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class ReportDTO {
	String report_no;
	Date report_regidate;
	Date report_startdate;
	Date report_enddate;
	String m_id;
}
