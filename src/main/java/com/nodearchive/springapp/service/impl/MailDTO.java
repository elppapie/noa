package com.nodearchive.springapp.service.impl;

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
public class MailDTO {

	private int mail_no;//PK-메일일련번호
	private String m_id;//FK-메일 아이디
	private int mail_type;//메일 종류
	private String mail_title;//메일 제목
	private String mail_content;//메일 내용
	private java.sql.Timestamp mail_regidate;//메일 작성일
	private int mail_mark;//중요 메일
	private int mail_check;//메일 읽음 표시
	
}
