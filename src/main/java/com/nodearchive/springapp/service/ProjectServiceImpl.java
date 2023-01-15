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
public class ProjectServiceImpl implements ProjectService<Map>{

	@Autowired
	private ProjectDAO dao;
	
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	
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
		List lists= dao.findRecordByName(map);
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
				req.getContextPath()+"/Project/list.kosmo?"+searchString);
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
		Map record=dao.findRecordByNo(map);
		
		//[TEST] Project 선택했을때 가져올 값 확인
		//project_no로 데이터 가져옴
		return record;
	}

	//insert
	@Override
	public int insert(Map map) {
		
		int newProj = dao.save(map);
		//[TEST]------------------------------------------------
		System.out.println("project_no:"+map.get("project_no"));
		System.out.println("project_name"+map.get("project_name"));
		System.out.println("newProj:"+newProj);
		//------------------------------------------------------		
		return newProj;
	}


	
	//update
	@Override
	public int update(Map map) {
		int project_no = (int) map.get("project_no");
		//System.out.println("project_no:"+project_no);
		int sche_no = dao.selectScheNo(project_no);
		//System.out.println("2.sche_no:"+sche_no);
		map.put("sche_no", sche_no);
		return dao.update(map);
	}
	
	//해당 프로젝트의 sche_no 구하기 
	//프로젝트 수정시 필요
	//**SCHEDULE 테이블 키값 속성 변동시 수정 필요
	public int selectScheNo(int project_no) {
		int sche_no = dao.selectScheNo(project_no);
		//System.out.println("1.sche_no:"+sche_no);
		return sche_no;
	}
	

	//수정 삭제 요청시 등록자와 요청자가 같은지 확인
	public boolean isSameMember(Map map) {
		int reqProject = (int) map.get("project_no");
		String reqMember = (String) map.get("m_id");
		String respMember = dao.checkMember(map);
		boolean result=true;
		System.out.println(reqMember.equals(respMember));
		if(reqMember.equals(respMember)) {
			return result;
		}
		return result;
	}
	
	
	//트랜잭션 처리 관련 빈 주입 받기
	@Autowired
	private TransactionTemplate  transactionTemplate;
	//project_no에 따른 하위 업무 삭제용 DAO주입 받기
	@Autowired
	private TaskDAO tdao;

	//delete
	@Override
	public int delete(Map map) {
	
		int affected=0;//삭제된 업무 총 수 저장용
		//타입 파라미터<T>: 트랜잭션 처리 작업 후 반환할 타입으로 지정
		affected=transactionTemplate.execute(new TransactionCallback<Integer>() {
			//아래 메소드에 트랜잭션으로 처리할 작업들을 기술
			@Override
			public Integer doInTransaction(TransactionStatus status) {
				int deletedTaskCount=0;
				
				//project_no에 따른 모든 하위 업무 삭제
				//int deletedTaskCount=tdao.taskDeleteByProjNo(map);
				tdao.deleteList(map);
				System.out.println("업무 삭제 완료");
				//해당 project 삭제
				dao.projectDelete(map);
				System.out.println("프로젝트 삭제 완료");
				//doInTransaction()의 반환값이 execute()메소드의 반환값이다 
				return deletedTaskCount;
			}
		});
		
		return affected;
	}

}
