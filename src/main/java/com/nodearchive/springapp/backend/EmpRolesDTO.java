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
public class EmpRolesDTO {
	private int er_code;
	private String emp_code;
	private String er_name;
}
