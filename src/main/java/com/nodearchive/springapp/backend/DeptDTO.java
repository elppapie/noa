package com.nodearchive.springapp.backend;

import java.sql.Date;

import com.nodearchive.springapp.calendar.Sche_RefDTO;
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
public class DeptDTO {
	private String dept_code;
	private String dept_name;
	private Date dept_regidate;
}
