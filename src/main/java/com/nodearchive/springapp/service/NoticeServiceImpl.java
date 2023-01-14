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

import com.nodearchive.springapp.service.utils.ListPagingData;
import com.nodearchive.springapp.service.impl.NoticeDTO;
import com.nodearchive.springapp.service.NoticeService;
import com.nodearchive.springapp.service.utils.PagingUtil;
import com.nodearchive.springapp.service.impl.NoticeDAO;

/*
  이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
  예]OneMemoServiceImpl클래인 경우 ID값은 oneMemoServiceImpl
  지정도 가능 @Service(value="임의의ID값")
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService<NoticeDTO> {

	//OneMemoDAO주입받는다
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public boolean isLogin(Map map) {
		
		return dao.findMemberByIdAndPwd(map);
	}
	
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	/*
	  첫번째 인자 Map에는 검색 안하면  빈 맵이다
	                   검색시에는 검색어와 검색 컬럼명이 저장됨
	  두번째 인자는 컨텍스트 패스를 얻기 위함(페이징시 절대경로 지정)
	  세번째 인자는 현재 페이지 번호
	  
	 */
	@Override
	public ListPagingData<NoticeDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
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
		List lists= dao.findAll(map);
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
				req.getContextPath()+"/views/bbs/List.do?"+searchString);
		//페이징과 관련된 정보 및 모든 목록을 담는 ListPagingData객체 생성		
		ListPagingData<NoticeDTO> listPagingData = ListPagingData.builder()
													.lists(lists)//글 전체 목록 설정
													.map(map)//페이징 관련 데이타 저장된 맵 설정
													.pagingString(pagingString)//페이징 표시 문자열 설정
													.build();  
		return listPagingData;
	}

	@Override
	public NoticeDTO selectOne(Map map) {
		NoticeDTO record=dao.findRecordByNo(map);			
		return record;
	}

	@Override
	public int insert(Map map) {
		
		return dao.save(map);
	}
	/*
	 //https://mybatis.org/spring/transactions.html
	 [삭제 작업을 트랜잭션 처리하기]
	 1.빈 설정파일(root-context.xml)에 DataSourceTransactionManager 등록
	 2.빈 설정파일(root-context.xml)에 TransactionTemplate 등록
	 3.TransactionTemplate 주입받는다
	 4.TransactionTemplate객체의 execute()메소드로 트랜잭션 작업 실행
	   You can omit to call the commit and rollback method 
	   using the TransactionTemplate.
	 
	 ※트랜잭션 작업에서 런타임 오류시 롤백,정상 실행시 커밋된다
	  트랜잭션 처리는 @Service어노테이션이 붙은 클래스에서 하자
	 */
	
	//트랜잭션 처리 관련 빈 주입 받기
	@Autowired
	private TransactionTemplate  transactionTemplate;
	//글 번호에따른 댓글 삭제용 DAO주입 받기
	
	

	@Override
	public int delete(Map map) {
		int affected=0;//삭제된 댓글의 총수 저장용
		/*
		//타입 파라미터<T>: 트랜잭션 처리 작업후 반환할 타입으로 지정
		affected=transactionTemplate.execute(new TransactionCallback<Integer>() {
			//아래 메소드에 트랜잭션으로 처리할 작업들을 기술
			@Override
			public Integer doInTransaction(TransactionStatus status) {
				
				//글번호에 따른 모든 댓글 삭제
				int deletedCommentCount=ldao.deleteByNo(map);
				//트랜잭션 테스트를 위한 에러 발생
				//String str=null;
				//str.length();
				//해당 원본 글 삭제
				dao.delete(map);
				//doInTransaction()의 반환값이 execute()메소드의 반환값이다 
				return deletedCommentCount;
			}
			
		}); */
		
		//람다함수로 변경
		/*affected = transactionTemplate.execute(status->{
			int deletedCommentCount=ldao.deleteByNo(map);
			dao.delete(map);
			return deletedCommentCount;
		});*/
		
		
		
		return affected;
	}


	@Override
	public int update(Map map) {
		
		return dao.update(map);
	}

	@Override
	public String findNameByNo(Map map) {
		return null;
	}

}
