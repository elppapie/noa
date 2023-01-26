package com.nodearchive.springapp.service.impl;

import java.io.IOError;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nodearchive.springapp.service.impl.NoticeDTO;

@Repository
public class NoticeDAO {	
	//마이바티스 프레임워크와 관련된 빈을 주입 받아 JBDC API를 사용하지 않고 SQL 매퍼인 마이바티스 사용
	
	//첫번째)마이바티스 관련 코어 빈을 주입받지 않고 직접 생성(순제어)
	/*
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "onememo/mybatis/configuration.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		}
		catch(IOException e) {e.printStackTrace();}
	}*/
	//두번째)SqlSessionFactory를 직접 생성하지 않고 주입(DI)하기(데이타 소스로 히카리 사용)
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	/* 
	 -로그인/목록/입력에 적용해 보자	
	 [스프링에서 지원하는   마이바티스 관련 API(mybatis-spring-2.버전.jar) 미 사용(마이바티스 코어만 사용)]
	   
		[프로그래밍 순서]
		가. SqlSessionFactory타입의 openSession()메소드로 SqlSession타입 얻기 
		나. SqlSession타입의 메소드 호출
		.쿼리문이	SELECT 
	                  	다중레코드 일때:selectList()
	                  	단일 레코드일때:selectOne()
		.쿼리문이 	INSERT - insert()
	         		DELETE - delete()
	         		UPDATE - update()메소드
	     		      단,I/D/U일때는 반드시 commit()호출
	     
		다.-close()호출   

	 */
	//회원 여부 판단용
	public boolean findMemberByIdAndPwd(Map map) {
		
		return template.selectOne("noticeFindMemberByIdAndPwd", map);	
	}////////////
	public List findAll(Map map) {
		
		return template.selectList("noticeFindAll", map);	
	}
	public int save(Map map) {
		
		return template.insert("noticeSave", map);
		
		
	}
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) 
	 * SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (나)만 하면된다.또한 commit()호출도 불필요
	 */
	@Autowired
	private SqlSessionTemplate template;
	
	public NoticeDTO findRecordByNo(Map map) {	
		//return null;
		return template.selectOne("findRecordByNo", map);
	}
	public int delete(Map map) {		
		
		return template.delete("noticeDelete",map);
	}
	public int update(Map map) {
		
		return template.update("noticeUpdate",map);
	}
	public int getTotalRecordCount(Map map) {
		
		return template.selectOne("noticeTotalRecordCount",map);
	}
	public int saveUser(Map<String, String> map) {
		
		return template.insert("saveUser",map);
	}
}
