package com.nodearchive.springapp.service;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nodearchive.springapp.service.impl.AddressDAO;
import com.nodearchive.springapp.service.impl.AdminDAO;
import com.nodearchive.springapp.service.impl.OrganizationDTO;
import com.nodearchive.springapp.service.utils.ListPagingData;

@Service
public class AdminServiceImpl implements AdminService<Map>{

	@Autowired
	private AddressDAO addrDao;
	@Autowired
	private AddressServiceImpl addrService;
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//아이디로 기업코드 가져오기
	public String getEmpCode(Map map) {
		//주소록 DAO 가져와서 사용
		return addrDao.getEmpCodeByMId(map);
	}
	
	//기업의 전체 정보 확인
	public OrganizationDTO getOrg(Map map) {
		return addrService.getOrg(map);
	}
	
	
	//부서목록
	public List selectDeptList(Map map) {
		return addrDao.getDeptOrg(map);
	}
	
	//우리회사의 그룹목록 가져오기
	public List<Map> selectGroupList(Map map) {
		//회사 구성원 m_id와 그룹 목록의 그룹장(m_id) 서로 비교해서 해당하는 그룹만 가져오기
		
		// |member_list 	|회사구성원목록(id) 전달해서
		

		return adminDao.selectGroupIdList(selectAllMembersFromEmpList(map));
	}
	
	//우리회사에 다니는 사람들 목록 가져오기 (m_id)
	public Map selectAllMembersFromEmpList(Map map) {
		//접속중인 사람의 소속회사 가져오기 (1/2) address.xml에 있음
		map.put("emp_code", addrDao.getEmpCodeByMId(map));
		//접속중인 사람의 소속회사(emp_code)에 해당하는 사람 목록 List<String> 가져오기 (2/2)
		map.put("member_list", adminDao.selectMemberOfEmpList(map));	
		
		// |emp_code |member_list 	|
		// |회사코드	 |회사구성원목록(id) |
		return map;
	}
	
	//여기에서 그냥 정의.......?
	//접속중인 사람의 소속회사 가져오기 (1/2)
	public String getEmpCodeByMId(Map map) {
		return addrDao.getEmpCodeByMId(map);
	}

	@Override
	public Map selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertEmp(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEmp(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEmp(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAuthority(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAuthority(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAuthority(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDept(Map map) {
		//emp_code 가져와서 map에 전달
		map.put("emp_code",addrDao.getEmpCodeByMId(map));
		
		switch(((String)map.get("enroll")).trim()) { //공통 파라미터 = |enroll |emp_code (기업코드) |
			case "dept": //신규 부서등록, 넘어온 파라미터 = |dept_name (부서명) |memberList (부서인원) |m_dept_leader (부서리더) |
				adminDao.enrollDept(map);
				break;
			case "team": //신규 팀 등록, 넘어온 파라미터 = |team_name (팀명) |memberList (팀인원) |m_team_leader (팀리더) |
				
				break;
			case "member": //신규 구성원 등록
				
				break;
		}
		return 0;
	}

	@Override
	public int deleteDept(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDept(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTeam(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTeam(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTeam(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPosition(Map map) {
		return 0;
	}

	@Override
	public int deletePosition(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePosition(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public OrganizationDTO getOrgAdmin(Map map) {
		//로그인 중인 구성원의 기업코드 구해서 map에 전달하기
		map.put("emp_code", addrDao.getEmpCodeByMId(map));
		//기업의 부서 얻어오기 
		//<Map> dept_code=부서코드, dept_name=부서명, m_dept_leader=부서책임자, dept_leader_name=부서책임자이름 의 List컬렉션 
		//|dept_code |dept_name |dept_leader_id      |dept_leader_name |
		// 부서코드    |부서명     | 부서책임자 아이디      |  부서책임자 이름
		List<Map> deptList = adminDao.getDeptOrg(map);
		
		//부서별 팀 얻어오기
		List<String> deptCodeList = new Vector<>();
		deptList.forEach(t->deptCodeList.add(t.get("dept_code").toString()));
		
		//<Map> dept_code=부서코드, team_no=팀일련번호, team_name=팀명, m_team_leader=팀책임자, team_leader_name=팀책임자이름의 List컬렉션
		List<Map> teamList = adminDao.getTeamOrg(deptCodeList);

		//팀별 팀 구성원 얻어오기
		//리스트 컬렉션에 팀 일련번호 넣기
		List<Integer> teamNoList = new Vector<>();
		teamList.forEach(t->teamNoList.add(Integer.parseInt(t.get("team_no").toString())));
		//teamMembersList
		//|team_no |m_id       |m_name   |m_profile_img |position_name |
		// 팀 번호  | 팀원 아이디  | 팀원이름  |프로필사진링크   | 직급명        |
		List<Map> teamMembersList = addrDao.getTeamMembers(teamNoList);

		OrganizationDTO dto = new OrganizationDTO();
		dto.setDeptList(deptList);
		dto.setTeamList(teamList);
		dto.setTeamMembersList(teamMembersList);
		return dto;
	}////////////getOrg()

}
