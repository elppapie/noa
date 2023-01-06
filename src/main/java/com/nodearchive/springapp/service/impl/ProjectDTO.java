package com.nodearchive.springapp.service.impl;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class ProjectDTO {
	String project_no;
	String project_name;
	String m_id;
	int sche_no;
}