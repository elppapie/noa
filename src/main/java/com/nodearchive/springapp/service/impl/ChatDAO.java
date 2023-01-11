package com.nodearchive.springapp.service.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	//회원여부 판단]
	public int authMember(Map map) {		
		
		return template.selectOne("chatLogin", map);
	}
	
	
}
