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

</style>




<div
	class="d-sm-flex align-items-center justify-content-between border-bottom">
	<!----Main Page의 Nav 메뉴 작성---->
</div>

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section"
		role="tabpanel" aria-labelledby="todo-section">
		
	
		
		<div class="">
			<div>조직도</div>
		</div>
		<div class="">
			<div>
				<h3>부서정보 </h3>
			</div>
			<div>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-1">부서명</th>
							<th class="col-1">부서책임자(연락처)</th>
							<th class="col-1">부서 생성일</th>
							<%-- <th class="col-1">부서 소속 팀</th>--%>
							<th class="col-1">부서 소속 인원(수)</th>
							<th class="col-1">
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
								<td colspan='4'>
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
									<td>${dept["dept_leader_name"]}(${dept["dept_leader_contact"]})</td>
									<td>${dept["dept_regidate"]}</td>
									<td class="text-left">
									<%-- 	<c:forTokens var="team" items="${teamList}" delims=", ">
											<c:if test='${team["dept_code"] eq dept["dept_code"]}'>
											${team["team_name"]}
											</c:if>
										</c:forTokens>--%>
									</td>
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
		
		<div class="">
			<div>조직도</div>
		</div>
		<div class="">
			<div>
				<h3>팀정보</h3>
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
									<td>${team["dept_code"]}</td>
									<td>${team["team_name"]}</td>
									<td>${team["team_leader_name"]}(${team["m_team_leader"]})</td>
									<td>${team["team_regidate"]}</td>
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