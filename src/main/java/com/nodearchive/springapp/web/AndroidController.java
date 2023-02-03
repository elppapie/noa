package com.nodearchive.springapp.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nodearchive.springapp.service.AddressServiceImpl;
import com.nodearchive.springapp.service.LoginServiceImpl;
import com.nodearchive.springapp.service.impl.MembersDTO;



@RestController
@RequestMapping("/Android")
public class AndroidController {
	
	@Autowired
	private AddressServiceImpl addrService;
	
	@CrossOrigin
	@PostMapping("/users/login.kosmo")
	public Map login(MembersDTO dto) {
		System.out.println("🔔안드로이드 로그인 테스트:"+dto.getM_id()+", "+dto.getM_password());
		boolean isMember=addrService.isMember(dto);
		System.out.println("🔔안드로이드 로그인 성공여부:"+isMember);
		Map map = new HashMap();
		map.put("isLogin", isMember);
		return map;
	}

}
