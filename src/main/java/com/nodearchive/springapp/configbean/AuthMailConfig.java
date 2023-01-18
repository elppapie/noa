package com.nodearchive.springapp.configbean;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class AuthMailConfig {
	
	//authmail.properties에서 값을 읽어온다.
	@Value("${mail.transport.protocol}")
	private String mail_transport_protocol;
	@Value("${mail.smtp.auth}")
	private String mail_smtp_auth;
	@Value("${mail.smtp.starttls.enable}")
	private String mail_smtp_starttls_enable;
	@Value("${mail.smtp.debug}")
	private String mail_smtp_debug;
	@Value("${mail.smtp.ssl.trust}")
	private String mail_smtp_ssl_trust;
	@Value("${mail.smtp.ssl.protocols}")
	private String mail_smtp_ssl_protocols;
	@Value("${mail.sender.port}")
	private String mail_sender_port;
	@Value("${mail.set.username}")
	private String mail_set_username;
	@Value("${mail.set.password}")
	private String mail_set_password;
	
	@Bean
	public JavaMailSender javaMailSender() {
		Properties mailProperties = new Properties();
		mailProperties.put("mail.transport.protocol", mail_transport_protocol);
		mailProperties.put("mail.smtp.auth", mail_smtp_auth);
		mailProperties.put("mail.smtp.starttls.enable", mail_smtp_starttls_enable);
		mailProperties.put("mail.smtp.debug", mail_smtp_debug);
		mailProperties.put("mail.smtp.ssl.trust", mail_smtp_ssl_trust);
		mailProperties.put("mail.smtp.ssl.protocols", mail_smtp_ssl_protocols);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setJavaMailProperties(mailProperties);
		mailSender.setHost(mail_smtp_ssl_trust);
		mailSender.setPort(Integer.parseInt(mail_sender_port));
		mailSender.setUsername(mail_set_username);
		mailSender.setPassword(mail_set_password);
		mailSender.setDefaultEncoding("utf-8");
				
		return mailSender;
	}

}
