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
	
	
	//받은 메일함 
	public List<Map> recByMailReceive(Map map){
		return template.selectList("mailByReceive", map);
	}
	
	//보낸 메일함 
	public List<Map> recByMailSend(Map map){
		return template.selectList("mailBySend", map);
	}
	
	//임시 메일함 
	public List<Map> recByMailTemp(Map map){
		return template.selectList("mailByTemp", map);		
	}
	
	//내게 쓴 메일함 
	public List<Map> recByMailMy(Map map){
		return template.selectList("mailByMy", map);
	}
	
	//스팸 메일함 
	public List<Map> recByMailSpam(Map map){
		return template.selectList("mailBySpan", map);
	}
	
	//즐겨찾기 메일함 
	public List<Map> recByMailfav(Map map){
		return template.selectList("mailFindByFav", map);
	}
	
	//휴지통 메일함 
	public List<Map> recByMailTrash(Map map){
		return template.selectList("mailByTrash", map);
	}
	
	//메일 전체 목록
	public List<Map> recByMailLists(Map map){
		return template.selectList("mailByLists", map);
	}
	
	
}
