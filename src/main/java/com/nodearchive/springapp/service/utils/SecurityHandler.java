package com.nodearchive.springapp.service.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class SecurityHandler extends SimpleUrlAuthenticationFailureHandler implements AccessDeniedHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityHandler.class);
	
	//로그인(인증) 실패 원인 반환
	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res,
			AuthenticationException exc) throws IOException, ServletException {
		String login_failure = "";
		if(exc instanceof AuthenticationServiceException) login_failure= "시스템 내부 오류가 발생했습니다";
		else if(exc instanceof BadCredentialsException) login_failure= "ID 또는 비밀번호가 일치하지 않습니다";
		else if(exc instanceof DisabledException) login_failure= "사용할 수 없는 계정입니다";
		else if(exc instanceof LockedException) login_failure= "잠긴 계정입니다";
		else if(exc instanceof AccountExpiredException) login_failure= "만료된 계정입니다";
		else if(exc instanceof CredentialsExpiredException) login_failure= "비밀번호가 만료되었습니다";
		else if(exc instanceof SessionAuthenticationException) {
			System.out.println(exc);
			System.out.println("현지메세지"+exc.getLocalizedMessage());
			System.out.println("메세지"+exc.getMessage());
			login_failure= "동시접속 계정 수를 초과했습니다: "+exc.getMessage();
		}
		else login_failure= "계정을 찾을 수 없습니다";
		//리퀘스트 영역에 에러메세지 전달
		req.setAttribute("login-failure", login_failure);
		//로그인 페이지로 이동
		super.setUseForward(true);
        super.setDefaultFailureUrl("/Login/login.kosmo");
        super.onAuthenticationFailure(req, res, exc);		
	}

	//페이지 접근 실패 원인 반환, 에러페이지로 포워딩
	@Override
	public void handle(HttpServletRequest req, HttpServletResponse res,
			AccessDeniedException exc) throws IOException, ServletException {
		switch(exc.getMessage()) {
			case "Access is denied":
				req.setAttribute("access-failure","접근이 제한된 페이지입니다");
				break;
		}
		logger.info("LocalizedMessage : {}",exc.getLocalizedMessage());
		logger.info("Message : {}",exc.getMessage());
		logger.info("StackTrace : {}",exc.getStackTrace());
		//에러 페이지로 이동	
		req.getRequestDispatcher("/Login/errorPage.kosmo").forward(req, res);
	}

}
