package com.nodearchive.springapp.configbean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebSecurity
@PropertySource("classpath:config/database.properties")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	//히카리 커넥션 풀 사용:server.xml 및 context.xml에 커넥션 풀 관련 설정 불 필요
	//왜 DatabaseConfig에서는 .properties 파일 변수 그대로 갖다쓰면서... 여기서는 그러질 못하지?
	@Value("${driverClassName}")
	private String driverClassName;
	@Value("${url}")
	private String url;
	@Value("${user}")
	private String username;
	@Value("${password}")
	private String password;
	//히카리 데이타 소스 - 스프링 씨큐리티 적용시에는 주석처리하고 주입받아서 사용
	@Bean 
	public HikariDataSource hikariDataSource() {
		System.out.println("driverClassName:"+driverClassName);
		System.out.println("username:"+username);
		System.out.println("password:"+password);
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		return new HikariDataSource(hikariConfig);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.out.println("[*] configure(HttpSecurity http)에 들어오셨습니다");
		//logger.debug("Using default configure(HttpSecurity)");
		//super.configure(http);
		/*
		http
			.authorizeRequests()
			.anyRequest().authenticated() //모든 요청에 대해 권한이 필요하다
			.and()
			.formLogin() //폼 기반의 인증을 하겠다
			.and()
			.httpBasic() //http 기본인증 사용
			.and()
			.csrf().disable();
		*/
		/*
		http
			.authorizeRequests()
			.anyRequest().authenticated()
			.and()
			.formLogin() //폼 기반의 인증을 하겠다
			.and()
			.csrf().disable();
		*/
		http
			.authorizeRequests()
			.antMatchers("/Login/**","/home.kosmo","/","/resources/**").permitAll() // "/resources/**" 안 넣으면 css 파일 다 깨져서 보임
			.antMatchers("/Address/**","/Mail/**","/Schedule/**","/Chat/**","/Attendance/**","/Approval/**","/Project/**","/Task/**","/Report/**","/Meet/**","/Notice/**").hasAnyRole("USER","ADMIN")//ROLE_는 반드시 생략.자동으로 추가됨으로
			.antMatchers("/Admin/**").hasRole("ADMIN")
			.anyRequest().authenticated()
			//.anyRequest().permitAll()
			.and()
			.formLogin()
			.loginPage("/Login/login.kosmo") //로그인 화면 url 넣기
			.loginProcessingUrl("/Login/login.kosmo") //로그인폼(post)의 action 태그에 넣은 로그인처리 메소드 주소
			.failureUrl("/Login/login.kosmo")
			.usernameParameter("m_id")
			.passwordParameter("m_password")
			.defaultSuccessUrl("/home.kosmo",true) // 로그인이 되어도 계속 로그인하게 시킨 이유가 이거 주석해서
			.and()
			.logout() //로그아웃처리는 디폴트 사용, 
			.and()
			.csrf().disable()
			.sessionManagement()
			.invalidSessionUrl("/Login/login.kosmo")
			.maximumSessions(1)//최대 허용 가능 중복 세션 수.(중복 로그인 방지하기 위해 1로 설정)
			.expiredUrl("/Login/login.kosmo"); //만기된 세션 즉 세션 유효시간이 경과 한 경우 이동할 URL(중복으로 인해 끊어진 경우도 해당함).
			
			
			
	}
	
	//<1>메모리기반 <2>JDBC기반 <3>UserDetailsService(클래스 따로 만들어야)기반
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		/*
		auth
			.inMemoryAuthentication()
			.withUser("user").password("1234").roles("USER")
			.and()
			.withUser("admin").password("1234").roles("USER","ADMIN");
		*/
		auth
			.jdbcAuthentication()
			.dataSource(hikariDataSource())
			.usersByUsernameQuery("SELECT m_id AS username, m_password AS password, m_enabled AS enabled FROM members WHERE m_id = ?")
			.authoritiesByUsernameQuery("SELECT m_id AS username, er_name AS authority from members m JOIN emp_roles er ON m.er_code = er.er_code WHERE m_id = ?");
			//.passwordEncoder(passwordEncoder());
	}//////////////////////
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	//org.springframework.security.web.firewall.RequestRejectedException: The request was rejected because the URL was not normalized.
	//스프더블슬래시 허용
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}

}
