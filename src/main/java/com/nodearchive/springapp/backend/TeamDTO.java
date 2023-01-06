package com.nodearchive.springapp.backend;

import java.sql.Date;

import com.nodearchive.springapp.calendar.ScheRefDTO;

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
public class TeamDTO {
	private int team_no;
	private String dept_code;
	private String team_name;
	private Date team_regidate;
}
