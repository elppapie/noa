package com.nodearchive.springapp.web;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nodearchive.springapp.service.LoginServiceImpl;

@Controller
@RequestMapping("/Login")
public class LoginController {

	@Autowired
	private LoginServiceImpl service;
	
	
	//로그인 페이지로 이동하는 메소드
	@GetMapping("/login.kosmo")
	public String loginPage() {
		//타일즈 미적용 - 노드아카이브 접속 시 첫 페이지.
		return "login/login";
	}
	//로그인 처리하는 메소드
	@PostMapping("/login.kosmo")
	public String login(
			HttpServletRequest req,
			HttpServletResponse res
			) {
		//return "forward:/home.kosmo";
		return "login/login";
	}
	//에러메세지 띄우기
	@RequestMapping("/errorPage.kosmo")
	public String errorPage() {
		return "login/errorPage.noa";
	}
	//마이페이지 이동
	@RequestMapping("/myPage.kosmo")
	public String myPage() {
		return "login/MyPage.noa";
	}
	
	//회원가입 폼 페이지로 이동하는 메소드
	@GetMapping("/signUp.kosmo")
	public String signUpPage() {
		return "login/signUp";
	}
	
	@RequestMapping(value="/emailAuth.kosmo",produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map emailAuth(@RequestParam Map map) {
		//서비스 호출 - map에 저장된 key,value 쌍
		//email:사용자가 입력한 이메일 주소
		//key:생성된 난수 알파벳 인증코드
		//isSuccess:인증용이메일 발송 성공여부 (true) false(null)면 예외발생한 것.	
		map=service.sendAuthMail(map);
		return map;
	}
	
	//회원가입 폼으로 입력받아 처리하는 메소드
	@PostMapping("/signUp.kosmo")
	public String signUp(
//			Authentication auth, // 인증이 안 된 사용자는 자바 설정파일의 loginPage()메소드에 지정된 페이지로 바로 Redirect가 된다.  
			Model model,
			@RequestParam Map map,
			@RequestParam(required = false, defaultValue = "1") int nowPage,
			//nowPage가 전달된다면 해당 값이, nowPage가 없으면 기본값 1로 초기화한다.
			HttpServletRequest req
			) {
		
		//map = 회원가입 폼에서 입력한 값들이 전달된다.
		service.signUp(map);
		
		return "forward:/Login/login.kosmo";
	}
	
	@ResponseBody
	@PostMapping("/users.kosmo")
	private Map insertUser(@RequestBody Map<String,String> map) {
		//씨큐리티 전용 유저 입력... 회원가입 절차
		map = service.insertUser(map);
		return map;
	}
	
	
}
