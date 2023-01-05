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
public class EmpDTO {
	private String emp_code; //pk
	private String emp_name;
	private String emp_addr;
	private java.sql.Date emp_regidate;
	private String emp_email;
	
}
