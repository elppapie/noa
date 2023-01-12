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
	
		//[TEST]-------------------------------------------------------
		System.out.println("project_no:"+map.get("project_no"));
		System.out.println("project_name"+map.get("project_name"));
		System.out.println("newProj:"+newProj);
		//-------------------------------------------------------		
		
		return newProj;
	}

	//해당 프로젝트의 sche_no 구하기 - 업데이트 중
	//프로젝트 수정시 필요
	/*
	public int selectScheNo(int project_no) {
		return dao.selectScheNo();
	}
	*/
	
	/*업데이트 중
	//update
	@Override
	public int update(Map map) {
		int sche_no = selectScheNo(map.get("project_no"));
		map.put("sche_no", sche_no);
		return dao.update(map);
	}
	*/
	
	
	//트랜잭션 처리 관련 빈 주입 받기
	@Autowired
	private TransactionTemplate  transactionTemplate;
	//글 번호에따른 댓글 삭제용 DAO주입 받기
	//@Autowired
	//private TaskDAO tdao;

	//delete
	
	@Override
	public int delete(Map map) {
		/*
		int affected=0;//삭제된 댓글의 총 수 저장용
		//타입 파라미터<T>: 트랜잭션 처리 작업후 반환할 타입으로 지정
		affected=transactionTemplate.execute(new TransactionCallback<Integer>() {
			//아래 메소드에 트랜잭션으로 처리할 작업들을 기술
			@Override
			public Integer doInTransaction(TransactionStatus status) {
				
				//글번호에 따른 모든 댓글 삭제
				int deletedCommentCount=tdao.deleteByNo(map);
				//트랜잭션 테스트를 위한 에러 발생
				//String str=null;
				//str.length();
				//해당 원본 글 삭제
				dao.delete(map);
				//doInTransaction()의 반환값이 execute()메소드의 반환값이다 
				return deletedCommentCount;
				*/
				return 0;
			//}
		//});
		
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
}
