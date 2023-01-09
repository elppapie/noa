package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.AddressDAO;
import com.nodearchive.springapp.service.utils.ListPagingData;
import com.nodearchive.springapp.service.utils.PagingUtil;



// AddressController용 서비스
// 여기서 주소록 관련 비즈니스 로직을 처리한다.
@Service
public class AddressServiceImpl implements AddressService<Map> {

	@Autowired
	private AddressDAO dao;
	
	//페이징 기본정보(pageSize, blockPage) 리소스 파일(paging.properties)에서 불러오기
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	
	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//로그인 중인 구성원의 기업코드 구해서 map에 전달하기
		map.put("emp_code", dao.getEmpCodeByMId(map).toString());
		
		//전체 레코드수	
		int totalRecordCount = dao.getTotalRecordCount(map); //검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징 정보를 map에 세팅한다. >> START, END, TOTAL_PAGE
		PagingUtil.setMapForPaging(map);
		
////////////////////////////////test
		Set keyss=map.keySet();
		for(Object o:keyss) {
			System.out.println(String.format("[🔔서비스] map의 키:%s, value:%s", o.toString(),map.get(o).toString()));
		}
///////////////////////////////////////////////
		
		//내 기업의 구성원 전체 목록 얻기
		List membersList = dao.getAllMembers(map);
////////////////////////////////test
		for (Object member : membersList) {
			keyss=((Map)member).keySet();
			for(Object o:keyss) {
				System.out.println(String.format("[🔔서비스] member의 키:%s, value:%s", o.toString(),((Map)member).get(o).toString()));
			}
		}
///////////////////////////////////////////////
		
		/*
		 * membersList의 key
		 * : mark, m_profile_img, m_name, position_name, team_name, m_id, R
		 *  mark=즐겨찾기 표시(0이면 즐겨찾기한 구성원이 아닌 것, 1이면 내가 즐겨찾기한 구성원)
		 *  R=페이징 용 컬럼(rownum).
		 */
		
		//검색 시 문자열 채워짐.
		String searchString="";
		if(map.containsKey("searchWord")) {
			searchString+="searchColumn="+map.get("searchColumn")+"&searchWord="+map.get("searchWord")+"&";
		}
		
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/Address/AllList.do?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
													.lists(membersList)//글 전체 목록 설정
													.map(map)//페이징 관련 데이타 저장된 맵 설정
													.pagingString(pagingString)//페이징 표시 문자열 설정
													.build();
		return listPagingData;
	}

	@Override
	public Map selectOne(Map map) {
		
		return null;
	}

	@Override
	public int insert(Map map) {
		
		return 0;
	}

	@Override
	public int delete(Map map) {
		
		return 0;
	}

	@Override
	public int update(Map map) {
		
		return 0;
	}

}
