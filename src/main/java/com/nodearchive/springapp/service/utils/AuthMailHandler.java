package com.nodearchive.springapp.service.utils;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.Getter;

@Getter
public class AuthMailHandler {
	
	private JavaMailSender mailSender;
	private MimeMessage message;
	// MimeMessageHelper 설명
	//https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/mail/javamail/MimeMessageHelper.html
	private MimeMessageHelper messageHelper;
	
	//JavaMailSender객체는 생성자 주입 사용
	public AuthMailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	//메일 제목
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	//메일 내용
	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);;
	}
	//메일 발송자
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}
	//메일 수신자
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	//Add an inline element to the MimeMessage 
	//DataSource로부터 요소를 얻어와 메세지(메일)에 포함시키는 메소드 = 첨부파일???
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}
	//메일 전송
	public void send() {
		mailSender.send(message);
	}
}
