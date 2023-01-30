package com.nodearchive.springapp.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nodearchive.springapp.service.impl.AddressDAO;
import com.nodearchive.springapp.service.impl.AdminDAO;
import com.nodearchive.springapp.service.utils.AuthMailHandler;
import com.nodearchive.springapp.service.utils.AuthMailTempKey;

@Service
public class LoginServiceImpl {
	
	@Autowired
	private AddressDAO dao;
	@Autowired
	private AdminDAO admin_dao;
	//난수 인증코드를 생성하기 위한 클래스 주입 
	@Autowired
	private AuthMailTempKey authKey;
	@Autowired
	private AuthMailHandler mailHandler;
	//스프링 씨큐리티 password 암호화
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	public void signUp(Map map) {
		
		
	}

	public Map sendAuthMail(Map map) {
		//map에 넘어오는 정보 : 사용자가 입력한 이메일 주소
		// 이메일 주소로 인증 메일을 보낼 것임
		
		//1. 인증 메일에 포함시킬 난수 인증코드를 준비.
		String key=authKey.getKey(30, false);
		//2. 인증 메일 발송하기
		try {
			mailHandler.setSubject("[NodeArchive에서 발송한 인증 이메일]"); //메일 제목
			mailHandler.setText( //메일 내용
					"<h1>NodeArchive 메일 인증</h1>"+
					"<br/>인증 코드 : "+key+
					"<br/>==================================="
					);
			mailHandler.setFrom("nodeArchive@noa.com", "노드아카이브");
			mailHandler.setTo(map.get("email").toString());
			mailHandler.send();
		} 
		catch (MessagingException e) {
			System.out.println("이메일 발송 중 예외 발생");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			System.out.println("setFrom()호출 중 예외 발생");
			e.printStackTrace();
		}
		//3. 생성한 난수 인증코드와 발송 완료했음을 서버에 클라이언트 단에 알리기 위한 정보를 맵에 담아서 반환.
		map.put("key", key); //인증코드 저장
		map.put("isSuccess", true); //인증메일 발송 성공여부 저장. catch절에 안 들어갔다면 성공한 것.
		return map;
	}
	
	public Map insertUser(Map<String,String> map) {
		//사용자가 입력한 비밀번호를 암호화
		String rawPassword=map.get("m_password");
		String encodedPassword=passwordEncoder.encode(rawPassword);//원문을 암호화
		//암호화된 비밀번호로 다시 설정
		map.put("m_password", encodedPassword);
		System.out.println("비밀번호 원문:"+rawPassword);
		System.out.println("암호화된 비밀번호:"+encodedPassword);
		System.out.println("암호일치여부 판단"+passwordEncoder.matches(rawPassword, encodedPassword));
		int affected=admin_dao.saveUser(map);	
		System.out.println(affected+"행이 입력되었어요");
		return map;
	} 

}
