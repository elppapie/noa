package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.nodearchive.springapp.service.impl.ProjectDAO;
import com.nodearchive.springapp.service.impl.TaskDAO;
import com.nodearchive.springapp.service.utils.ListPagingData;
import com.nodearchive.springapp.service.utils.PagingUtil;

@Service
public class TaskServiceImpl implements TaskService<Map>{

	@Autowired
	private TaskDAO dao;
	
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	
	//insert
	@Override
	public int insert(Map map) {
		int newTask = dao.insert(map);		
		return newTask;
	}
	
	//selectOne
	@Override
	public Map selectOne(Map map) {
		Map record=dao.findRecordByNo(map);
		return record;
	}
	
	//selectList - 문자열 검색
	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수
		System.out.println("loginId:"+map.get("loginId"));
		int totalRecordCount=dao.getTotalRecordCount(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);

		List lists = dao.getTotalTask(map);
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
				req.getContextPath()+"/Task/list.kosmo?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
											.lists(lists)//글 전체 목록 설정
											.map(map)//페이징 관련 데이타 저장된 맵 설정
											.pagingString(pagingString)//페이징 표시 문자열 설정
											.build();										
		return listPagingData;	
	}
	

	@Override
	public ListPagingData<Map> selectListByProj(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount=dao.getTotalRecordCountByProj(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);

		List lists = dao.getTotalTaskbyProj(map);
		String searchString="";
		if(map.containsKey("project_no")) {
			searchString+="project_no="+map.get("project_no")+"&";
		}
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/Task/list.kosmo?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
											.lists(lists)//글 전체 목록 설정
											.map(map)//페이징 관련 데이타 저장된 맵 설정
											.pagingString(pagingString)//페이징 표시 문자열 설정
											.build();										
		return listPagingData;	
	}

	
	/*
	//selectList - 날짜 검색
	@Override
	public ListPagingData<Map> selectListByDate(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount=dao.getTotalRecordCount(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);

		List lists = dao.selectTaskByDate(map);
		String searchString="";
		if(map.containsKey("set_startdate")) {
			searchString+=map.get("set_startdate");
		}
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/Task/listDate.kosmo?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
											.lists(lists)//글 전체 목록 설정
											.map(map)//페이징 관련 데이타 저장된 맵 설정
											.pagingString(pagingString)//페이징 표시 문자열 설정
											.build();				
		return listPagingData;	
	}
	
	//selectList - 사용자 검색
	@Override
	public ListPagingData<Map> selectListById(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount=dao.getTotalRecordCount(map);//검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징과 관련된 값들을  얻기 위한 메소드 호출
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);

		List lists = dao.selectTaskById(map);
		String searchString="";
		if(map.get("loginId")!=null) {
			searchString+=map.get("loginId");
		}
		//페이징 표시 문자열 얻기
		String pagingString=PagingUtil.pagingBootStrapStyle(
				totalRecordCount, 
				pageSize, 
				blockPage, 
				nowPage,
				req.getContextPath()+"/Task/listId.kosmo?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<Map> listPagingData = ListPagingData.builder()
											.lists(lists)//글 전체 목록 설정
											.map(map)//페이징 관련 데이타 저장된 맵 설정
											.pagingString(pagingString)//페이징 표시 문자열 설정
											.build();				
		return listPagingData;	
	}
	*/
	
	//update
	@Override
	public int update(Map map) {
		int task_no = Integer.parseInt(map.get("task_no").toString());
		int sche_no = dao.selectScheNo(task_no);
		if(isSameMember(map)==true) {
			map.put("sche_no", sche_no);
		}
		return dao.update(map);
	}
	
	//업무해당 프로젝트의 sche_no 구하기 
	//업무 수정시 필요
	//**SCHEDULE 테이블 키값 속성 변동시 수정 필요
	public int selectScheNo(int task_no) {
		int sche_no = dao.selectScheNo(task_no);
		return sche_no;
	}

	//수정, 삭제 요청시 등록자와 요청자가 같은지 확인
	public boolean isSameMember(Map map) {
		int reqProject = Integer.parseInt(map.get("task_no").toString());
		String reqMember = map.get("m_id").toString();
		String respMember = dao.checkMember(map);
		boolean result=false;
		if(reqMember.equals(respMember)) {
			result=true;
		}
		return result;
	}
	
	//delete
	@Override
	public int delete(Map map) {
		int affected=dao.deleteOne(map);
		return affected;
	}

	

}
