package com.nodearchive.springapp.service.impl;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;




@NoArgsConstructor
public class NoticeDTO {
	private String no;
	private String title;
	private String content;
	private java.sql.Date postDate;
	private String id;
	
	//아래는 게시판 테이블 생성시 컬럼에서 제외
	private String name;
	//각 글 번호(no)에 따른 댓글 총수 저장용
	private String commentCount;
	
	//no에 따른 모든 한줄 댓글 목록 저장용
	//마이바티스의 ResultMap 태그의 collection태그 적용해야한다
	//List<LineCommentDTO> comments;
	
	
}
