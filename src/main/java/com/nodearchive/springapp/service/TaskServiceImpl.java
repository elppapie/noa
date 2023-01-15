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
	
	//update
	@Override
	public int update(Map map) {
		int task_no = (int) map.get("task_no");
		//System.out.println("project_no:"+project_no);
		int sche_no = dao.selectScheNo(task_no);
		//System.out.println("2.sche_no:"+sche_no);
		map.put("sche_no", sche_no);
		return dao.update(map);
	}
	

	//수정 삭제 요청시 등록자와 요청자가 같은지 확인
	public boolean isSameMember(Map map) {
		int reqProject = (int) map.get("project_no");
		String reqMember = (String) map.get("m_id");
		//String respMember = dao.checkMember(map);
		boolean result=true;
		//System.out.println(reqMember.equals(respMember));
		//if(reqMember.equals(respMember)) {
		//	return result;
		//}
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
		return dao.deleteOne(map);
	}

	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectScheNo(int project_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
