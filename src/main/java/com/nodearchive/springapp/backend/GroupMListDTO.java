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
public class GroupMListDTO {
	private String m_id;
	private int group_no;
	private java.sql.Date gml_regidate;

}
