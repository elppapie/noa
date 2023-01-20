package com.nodearchive.springapp.service.utils;

import java.util.Random;

public class AuthMailTempKey {
	//난수 인증코드를 소문자로 할 것인지, 대문자로 할 것이지 설정. true >> 소문자.
	private boolean lowerCheck;
	//난수 인증코드 자릿수 설정 >> 데이터베이스 컬럼 자료크기가 50이므로 size는 50보다 작아야 한다.
	private int size;
	
	public String getKey(int size, boolean lowerCheck){
		//size는 50보다 큰 경우 서버단에서 예외 발생
		Exception IndexOutOfBoundsException = new IndexOutOfBoundsException();
		try{
			if(size>50) throw IndexOutOfBoundsException;
		}
		catch(Exception e) {e.printStackTrace();}
		this.size = size;
		this.lowerCheck = lowerCheck;
		return init();
	}
	
	private String init() {
		Random rand = new Random();
		StringBuffer sb = new StringBuffer();
		int num=0;
		do {
			num=rand.nextInt(75) + 48;
			if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
				sb.append((char)num);
			}
			else continue;
		}
		while(sb.length()<size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
}
