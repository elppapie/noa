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
<c:set var="memberList" value="${organization.getTeamMembersList()}"/>

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
				<h3>구성원 테이블 </h3>
			</div>
			<div>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-1">프로필사진</th>
							<th class="col-1">이름</th>
							<th class="col-1">직급</th>
							<th class="col-1">아이디</th>
							<th class="col-1">소속 팀(일단번호)</th>
							<th class="col-1">
								<div class="btn btn-primary btn-lg">
									<a href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}&enroll=member'/>">
									신규 구성원 추가
									</a>
								</div>
							</th>
						</tr>
					</thead>
					<tbody class="table-sm">
						<c:if test="${empty memberList}" var="emptyMember">
							<tr>
								<td colspan='4'>
									회사에 등록된 구성원이 없습니다<br/><br/>
									<a href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">구성원 초대하기</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${not emptyMember}">
							<!-- 부서별 정보 뿌리기 -->
							<c:forEach var="member" items="${memberList}">
								<tr>
									<td>${member["m_profile_img"]}</td>
									<td>${member["m_name"]}</td>
									<td>${member["position_name"]}</td>
									<td>${member["m_id"]}</td>
									<td>${member["team_no"]}</td>
									<td>
										<div class="btn btn-primary">
											<a class="iamnothref" href="<c:url value='/Admin/edit.kosmo?m_id=${member["m_id"]}'/>">
											수정하기
											</a>
										</div>&nbsp;
										<div class="btn btn-danger">
											<a class="iamnothref" href="<c:url value='/Admin/delete.kosmo?dept_code=${member["m_id"]}'/>">
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