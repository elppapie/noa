package com.nodearchive.springapp.service.impl;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class ChatDTO {	
	String m_id;
	
	//[메신저 채팅]	
	int chat_no;	
	Date chat_regidate;
	
	//[메신저 메세지]
	String cm_no;
	String cm_content;
	Date cm_regidate;
	
	//[메신저 친구 목록]
	int group_no;	
	Date cml_regidate; //구성원이 목록에 등록된 날	
	String group_name;
	Date group_regidate; //그룹이 만들어 진 날
	String group_separator; //그룹 분류(ex.메신저 친구목록)
	
}
