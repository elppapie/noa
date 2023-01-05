package com.nodearchive.springapp.calendar;

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
public class Sche_RefDTO {
	private String m_id;
	private int sche_no;
	private java.sql.Timestamp sr_regidate;
	
}
