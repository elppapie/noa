package com.nodearchive.springapp.service.utils;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class TaskDTO {
	String task_no;
	String task_name;
	String task_content;
	String task_categoty;
	String m_id;
	int project_no;
	int sche_no;
}
