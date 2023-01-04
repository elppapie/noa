package com.nodearchive.springapp.configbean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	//타일즈 관련 클래스(뷰 리졸버 와 타일즈 구성용 클래스)를 자바코드로 컨테이너에 등록
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		//사용할 뷰 설정
		resolver.setViewClass(TilesView.class);
		//뷰 리졸버의 우선순위 설정: 이 뷰리졸버의 우선순위가 InternalResourceViewResolver보다 높게 해야한다
		resolver.setOrder(0);
		return resolver;
	}/////////////
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"/WEB-INF/views/tiles3/noaLayouts.xml"});		
		return configurer;
	}/////////////////////////////
}
