package com.nodearchive.springapp.service.utils;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 뷰페이지에서 
// 레코드 목록 출력과 페이징을
// 동시에 해야할 때 
// 해당 컨트롤러에서 ListPagingData<DTO 또는 Map> 타입을 Model에 저장하면 된다.

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
//제너릭 클래스
public class ListPagingData<T> {

	//레코드 목록 데이타 저장
	private List<T> lists;
	//페이징 관련 데이타 저장
	private Map map;
	//페이징 표시용 문자열 저장
	private String pagingString;
}
