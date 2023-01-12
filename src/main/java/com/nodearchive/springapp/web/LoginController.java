package com.nodearchive.springapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Login")
public class LoginController {

	@GetMapping("/login.kosmo")
	public String loginPage() {
		//타일즈 미적용 - 노드아카이브 접속 시 첫 페이지.
		return "login/login";
	}
	
	@PostMapping("/login.kosmo")
	public String login() {
		
		return "forward:/home.kosmo";
	}
}
