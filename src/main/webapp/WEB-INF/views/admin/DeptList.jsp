<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 뷰 페이지 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="res" value="${pageContext.request.contextPath}/resources" />
<c:set var="deptList" value="${organization.getDeptList()}"/>
<%-- c:set var="deptTeamList" value="${emp_code.getDeptCodeList()}"/>--%>
<c:set var="teamList" value="${organization.getTeamList()}"/>


<style>
	.iamnothref{
		text-decoration:none;
		color:white;
	}
	.italic{
		font-style:italic;
		color:rgb(211,211,211);
	}

</style>




<div
	class="d-sm-flex align-items-center justify-content-between border-bottom">
	<!----Main Page의 Nav 메뉴 작성---->
	 <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" href="#" aria-selected="true">부서/팀 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/Admin/groups.kosmo"/>"  aria-selected="false">그룹 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/Admin/members.kosmo"/>" aria-selected="false">구성원 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" href="#more" aria-selected="false">blank</a>
    </li>
  </ul>
  <div>
    <div class="btn-wrapper">
      <a href="<c:url value="/Schedule/write.kosmo"/>" class="btn btn-otline-dark align-items-center"><i class="fa-solid fa-square-plus"></i> blank</a>
      <a href="#" class="btn btn-otline-dark"><i class="fa-solid fa-magnifying-glass"></i>  blank</a>
      <a href="#" class="btn btn-primary text-white me-0"><i class="fa-solid fa-download"></i>  blank</a>
    </div>
  </div>
</div>

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section"
		role="tabpanel" aria-labelledby="todo-section">
		<div class="card">
			<div class="card-body">	
	
		

			<h4 class="card-description"><code>조직도</code></h4>
		<div class="">
			<h3 class="card-title">부서정보 </h3>
			<div>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-2">부서명</th>
							<th class="col-2">부서책임자(연락처)</th>
							<th class="col-2">부서 생성일</th>
							<th class="col-2">부서 소속 인원(수)</th>
							<th class="col-2">
								<div class="btn btn-primary btn-lg">
									<a class="iamnothref" href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}&enroll=dept'/>">
									신규 부서 추가
									</a>
								</div>
							</th>
						</tr>
					</thead>
					<tbody class="table-sm">
						<c:if test="${empty deptList}" var="emptyDept">
							<tr>
								<td colspan='10'>
									등록된 부서가 없습니다<br/><br/>
									<a href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">부서 등록하기</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${not emptyDept}">
							<!-- 부서별 정보 뿌리기 -->
							<c:forEach var="dept" items="${deptList}">
								<tr>
									<td>${dept["dept_name"]}</td>
									<td>${dept["dept_leader_name"]}( ${dept["dept_leader_contact"]} )</td>
									<td>${fn:split(dept["dept_regidate"]," ")[0]}</td>
									<td>${dept["dept_members"]}</td>
									<td>
										<div class="btn btn-primary">
											<a class="iamnothref" href="<c:url value='/Admin/edit.kosmo?dept_code=${dept["dept_code"]}'/>">
											수정하기
											</a>
										</div>&nbsp;
										<div class="btn btn-danger">
											<a class="iamnothref"href="<c:url value='/Admin/delete.kosmo?dept_code=${dept["dept_code"]}'/>">
											삭제하기
											</a>
										</div>
									</td>
								</tr>
								
								
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
		</div>
		<br/>
		<div class="card">
		<div class="card-body">	
		
		<div class="">
			<h4 class="card-description">조직도</h4>
		</div>
		<div class="">
			<div>
				<h3 class="card-title">팀정보</h3>
			</div>
			<div>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-1">부서명</th>
							<th class="col-1">팀명</th>
							<th class="col-1">팀책임자(연락처)</th>
							<th class="col-1">팀 생성일</th>
							<th class="col-1">팀 소속 인원(수)</th>
							<th class="col-1">
								<div class="btn btn-primary btn-lg">
									<a  class="iamnothref" href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}&enroll=team'/>">
									신규 팀 추가
									</a>
								</div>
							</th>
						</tr>
					</thead>
					<tbody class="table-sm">
						<c:if test="${empty teamList}" var="emptyTeam">
							<tr>
								<td colspan='6'>
									등록된 팀이 없습니다<br/><br/>
									<a href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">팀 등록하기</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${not emptyTeam}">
							<!-- 팀별 정보 뿌리기 -->
							<c:forEach var="team" items="${teamList}">
								<tr>
									<td>${team["dept_name"]}</td>
									<td>${team["team_name"]}</td>
									<c:if test="${team['team_leader_name'] != null}" var="hasLeader">
										<td>${team["team_leader_name"]}( ${team["team_leader_contact"]} )</td>
									</c:if>
									<c:if test="${not hasLeader}">
										<td class="italic">팀 책임자가 없습니다</td>
									</c:if>
									<td>${fn:split(team["team_regidate"]," ")[0]}</td>
									<td>${dept["dept_members"]}</td>
									<td>										
										<div class="btn btn-primary">
											<a class="iamnothref" href="<c:url value='/Admin/edit.kosmo?dept_code=${team["dept_code"]}&team_no=${team["team_no"]}'/>">
											수정하기
											</a>
										</div>&nbsp;
										<div class="btn btn-danger">
											<a class="iamnothref"href="<c:url value='/Admin/delete.kosmo?dept_code=${team["dept_code"]}&team_no=${team["team_no"]}'/>">
											삭제하기
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
		</div>
		
	</div>
</div>