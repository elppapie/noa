package com.nodearchive.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MailDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	
	//받은 메일함 가져오기
	public List<Map> findRecByMailReceive(Map map){
		return template.selectList("mailFindByReceive", map);
	}
	
	//보낸 메일함 가져오기
	public List<Map> findRecByMailSend(Map map){
		return template.selectList("mailFindBySend", map);
	}
	
	//임시 메일함 가져오기
	public List<Map> findRecByMailTemp(Map map){
		return template.selectList("mailFindByTemp", map);		
	}
	
	//내게 쓴 메일함 가져오기
	public List<Map> findRecByMailMy(Map map){
		return template.selectList("mailFindByMy", map);
	}
	
	//스팸 메일함 가져오기
	public List<Map> findRecByMailSpam(Map map){
		return template.selectList("mailFindBySpan", map);
	}
	
	//즐겨찾기 메일함 가져오기
	public List<Map> findRecByMailfav(Map map){
		return template.selectList("mailFindByFav", map);
	}
	
	//휴지통 메일함 가져오기
	public List<Map> findRecByMailTrash(Map map){
		return template.selectList("mailFindByTrash", map);
	}
	
	//
	
	
}
