package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.nodearchive.springapp.service.impl.ProjectDAO;
import com.nodearchive.springapp.service.impl.ReportDAO;
import com.nodearchive.springapp.service.impl.TaskDAO;
import com.nodearchive.springapp.service.utils.ListPagingData;
import com.nodearchive.springapp.service.utils.PagingUtil;

@Service
public class ReportServiceImpl implements ReportService<Map>{

	@Autowired
	private ReportDAO dao;
	
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	
	//insert
	@Override
	public int insert(Map map) {
		return dao.createReport(map);
	}
	
	//selectList - 리포트 목록
	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount=dao.getTotalRecordCount(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);
		//글 전체 목록 얻기
		List lists= dao.selectReportList(map);
		String searchString="";
		if(map.containsKey("searchWord")) {
			searchString+="searchColumn="+map.get("searchColumn")+"&searchWord="+map.get("searchWord")+"&";
		}
		if(map.containsKey("set_startdate")) {
			searchString+="set_startdate="+map.get("set_startdate")+"&set_enddate="+map.get("set_enddate")+"&";
		}
		
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/Report/list.kosmo?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
												.lists(lists)//글 전체 목록 설정
												.map(map)//페이징 관련 데이타 저장된 맵 설정
												.pagingString(pagingString)//페이징 표시 문자열 설정
												.build();										
		return listPagingData;
	}
	
	//selectOne
	@Override
	public Map selectOne(Map map) {
		//report_no로 데이터 가져옴
		return dao.findRecordByNo(map);
	}
	
	//isSameMember
	//수정 삭제 요청시 등록자와 요청자가 같은지 확인
	public boolean isSameMember(Map map) {
		int reqProject = Integer.parseInt(map.get("report_no").toString());
		String reqMember = map.get("m_id").toString();
		String respMember = dao.checkMember(map);
		boolean result=true;
		//System.out.println(reqMember.equals(respMember));
		if(reqMember.equals(respMember)) {
			return result;
		}
		return result;
	}

	//update
	@Override
	public int update(Map map) {
		int affacted=0;
		boolean checkResult=isSameMember(map);
		if(checkResult ==true) {
			affacted=dao.update(map);
		}
		return affacted;
	}
	
	//deleteOne
	@Override
	public int deleteOne(Map map) {
		int affacted=0;
		boolean checkResult=isSameMember(map);
		if(checkResult ==true) {
			affacted=dao.deleteOne(map);
		}
		return affacted;
	}

	//deleteList
	@Override
	public int deleteList(List list) {
		return dao.deleteList(list);
	}

	//insertMember
	@Override
	public int insertMember(List list) {
		return dao.insertMember(list);
	}

	//selectMember
	@Override
	public List selectMember(Map map) {
		List mlist = dao.selectMember(map);
		return mlist;
	}

}
