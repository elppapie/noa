package com.nodearchive.springapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.AddressDAO;
import com.nodearchive.springapp.service.impl.OrganizationDTO;
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
	
	
	
	
	//페이징 있는 전체 구성원 목록 조회
	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		Map temp = dao.getEmpInfoByMId(map);
		//로그인 중인 구성원의 기업코드 구해서 map에 전달하기
		map.put("emp_code", temp.get("emp_code"));
		map.put("emp_name", temp.get("emp_name"));
		
		//전체 레코드수	
		int totalRecordCount = dao.getTotalRecordCount(map); //검색시에도 페이징 해야 함으로 맵을 넘겨준다
		//페이징을 위한 기본정보 설정
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalRecordCount);
		map.put(PagingUtil.NOW_PAGE, nowPage);
		//나머지 페이징 정보를 map에 세팅한다. >> START, END, TOTAL_PAGE
		PagingUtil.setMapForPaging(map);
		
		//내 기업의 구성원 전체 목록 얻기
		//membersList의 key
		//|mark |m_profile_img |m_name  |position_name |team_name |m_id        |m_private_contact |m_hiredate | r
		//즐겨찾기|프로필사진링크   | 이름    | 직급명         | 팀명      |이메일주소(id)| 개인연락처          | 입사일     | 행번호(rownum, 페이징용)
		List membersList = dao.getAllMembers(map);		
		
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
	}//////////selectList()
	
	
	//⚠️페이징 없는 전체 구성원 목록 조회
	public List selectListNoPaging(Map map) {
		Map temp = dao.getEmpInfoByMId(map);
		//로그인 중인 구성원의 기업코드 구해서 map에 전달하기
		map.put("emp_code", temp.get("emp_code"));
		map.put("emp_name", temp.get("emp_name"));
		
		//내 기업의 구성원 전체 목록 얻기
		//membersList의 key
		//|mark |m_profile_img |m_name  |position_name |team_name |m_id        |m_private_contact |m_hiredate | emp_name 
		//즐겨찾기|프로필사진링크   | 이름    | 직급명         | 팀명      |이메일주소(id)| 개인연락처          | 입사일     |       기업 명
		List membersList = dao.getAllMembersNoPaging(map);		
		
		return membersList;
	}//////////selectList()

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

	public OrganizationDTO getOrg(Map map) {
		Map temp = dao.getEmpInfoByMId(map);
		//로그인 중인 구성원의 기업코드 구해서 map에 전달하기
		map.put("emp_code", temp.get("emp_code"));
		map.put("emp_name", temp.get("emp_name"));
		//기업의 부서 얻어오기 
		//<Map> dept_code=부서코드, dept_name=부서명, m_dept_leader=부서책임자, dept_leader_name=부서책임자이름 의 List컬렉션 
		//|dept_code |dept_name |dept_leader_id      |dept_leader_name |
		// 부서코드    |부서명     | 부서책임자 아이디      |  부서책임자 이름
		List<Map> deptList = dao.getDeptOrg(map);
		
		//팀 목록 얻어오기
		List<String> deptCodeList = new Vector<>();
		deptList.forEach(t->deptCodeList.add(t.get("dept_code").toString()));
		
		//<Map> dept_code=부서코드, team_no=팀일련번호, team_name=팀명, m_team_leader=팀책임자, team_leader_name=팀책임자이름의 List컬렉션
		List<Map> teamList = dao.getTeamOrg(deptCodeList);
		
		//해당 부서를 key값으로 부서의 팀 목록을 value값으로 가지는 컬렉션
		// key값: dept_code=부서코드 
		// value값: List<Map> dept_code=부서코드, team_no=팀일련번호, team_name=팀명, m_team_leader=팀책임자, team_leader_name=팀책임자이름  
		Map<String,List> teamListByDept = new HashMap<>();
		deptCodeList.forEach(deptCode->  
			teamListByDept.put(deptCode, dao.getTeamListByDept(deptCode))
		);		

		//팀별 팀 구성원 얻어오기
		//리스트 컬렉션에 팀 일련번호 넣기
		List<Integer> teamNoList = new Vector<>();
		teamList.forEach(t->teamNoList.add(Integer.parseInt(t.get("team_no").toString())));
		//teamMembersList
		//|team_no |m_id       |m_name   |m_profile_img |position_name |
		// 팀 번호  | 팀원 아이디  | 팀원이름  |프로필사진링크   | 직급명        |
		List<Map> teamMembersList = dao.getTeamMembers(teamNoList);

		OrganizationDTO dto = new OrganizationDTO();
		dto.setDeptList(deptList);
		dto.setTeamList(teamList);
		dto.setTeamMembersList(teamMembersList);
		dto.setTeamListByDept(teamListByDept);
		return dto;
	}////////////getOrg()


	

}
