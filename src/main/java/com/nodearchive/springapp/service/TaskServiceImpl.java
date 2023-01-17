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
import com.nodearchive.springapp.service.impl.ProjectDTO;
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
		//[TEST]------------------------------------------------
		System.out.println("project_no:"+map.get("project_no"));
		System.out.println("project_name"+map.get("project_name"));
		System.out.println("newProj:"+newTask);
		//------------------------------------------------------		
		return newTask;
	}
	
	//selectOne
	@Override
	public Map selectOne(Map map) {
		Map record=dao.findRecordByNo(map);
		
		//[TEST] task 선택했을때 가져올 값 확인
		//task_no로 데이터 가져옴
		return record;
	}
	
	//selectList
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
		//그러면 총 페이지수와 시작/끝 행번호가 맵에 설정됨
		PagingUtil.setMapForPaging(map);
		//글 전체 목록 얻기
				List lists= dao.selectTaskByDate(map);
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
						req.getContextPath()+"/Task/list.kosmo?"+searchString);
				//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
				ListPagingData<Map> listPagingData = ListPagingData.builder()
														.lists(lists)//글 전체 목록 설정
														.map(map)//페이징 관련 데이타 저장된 맵 설정
														.pagingString(pagingString)//페이징 표시 문자열 설정
														.build();										
		return listPagingData;	
	}
	
	//update
	@Override
	public int update(Map map) {
		int task_no = (int) map.get("task_no");
		int sche_no = dao.selectScheNo(task_no);
		if(isSameMember(map)==true) {
			map.put("sche_no", sche_no);
		}
		return dao.update(map);
	}
	
	//해당 프로젝트의 sche_no 구하기 
	//업무 수정시 필요
	//**SCHEDULE 테이블 키값 속성 변동시 수정 필요
	public int selectScheNo(int task_no) {
		int sche_no = dao.selectScheNo(task_no);
		return sche_no;
	}

	//수정, 삭제 요청시 등록자와 요청자가 같은지 확인
	public boolean isSameMember(Map map) {
		int reqProject = (int) map.get("task_no");
		String reqMember = (String) map.get("m_id");
		String respMember = dao.checkMember(map);
		boolean result=true;
		if(reqMember.equals(respMember)) {
			return result;
		}
		return result;
	}
	
	//delete
	@Override
	public int delete(Map map) {
		return dao.deleteOne(map);
	}

}
