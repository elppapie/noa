package com.nodearchive.springapp.backend;

import java.sql.Date;

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
public class EmpGroupDTO {
	private int group_no;
	private String m_id;
	private String group_name;
	private java.sql.Date group_regidate;
	private String group_separator;
}
