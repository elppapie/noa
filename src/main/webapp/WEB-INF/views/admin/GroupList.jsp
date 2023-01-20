<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 뷰 페이지 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="res" value="${pageContext.request.contextPath}/resources" />
<c:set var="memberList" value="${group_member_list['member_list']}"/>



<style>
	.iamnothref{
		text-decoration:none;
	}

</style>




<div
	class="d-sm-flex align-items-center justify-content-between border-bottom">
	<!----Main Page의 Nav 메뉴 작성---->
	 <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/Admin/deptList.kosmo"/>" aria-selected="false">부서/팀 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="#"  aria-selected="false">그룹 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/Admin/members.kosmo"/>" aria-selected="false">구성원 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#more" role="tab" aria-selected="false">blank</a>
    </li>
  </ul>
  <div>
    <div class="btn-wrapper">
      <a href="#" class="btn btn-otline-dark align-items-center"><i class="fa-solid fa-square-plus"></i> blank</a>
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

			<h3 class="card-title">그룹정보 </h3>

			<div>
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th class="col-1">그룹명</th>
							<th class="col-1">그룹장(연락처)</th>
							<th class="col-1">그룹 생성일</th>
							<th class="col-1">그룹 소속 인원(수)</th>
						</tr>
					</thead>
					<tbody class="table-sm">
						<c:if test="${empty groupList}" var="emptyGroup">
							<tr>
								<td colspan='4'>
									등록된 그룹이 없습니다<br/><br/>
									<a href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">부서 등록하기</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${not emptyGroup}">
							<!-- 부서별 정보 뿌리기 -->
							<c:forEach var="dept" items="${deptList}">
								<tr>
									<td>${group["group_name"]}</td>
									<td>${group["group_leader_name"]}(${group["group_leader_contact"]})</td>
									<td>${group["group_regidate"]}</td>
									<td class="text-left">
									<%-- 	<c:forTokens var="team" items="${teamList}" delims=", ">
											<c:if test='${team["dept_code"] eq dept["dept_code"]}'>
											${team["team_name"]}
											</c:if>
										</c:forTokens>--%>
									</td>
									<td>${group["group_members"]}</td>
									<td>
										<div class="btn btn-primary">
											<a class="iamnothref" href="<c:url value='/Admin/edit.kosmo?edit=${edit}&group_code=${group["group_code"]}'/>">
											수정하기
											</a>
										</div>&nbsp;
										<div class="btn btn-danger">
											<a class="iamnothref"href="<c:url value='/Admin/delete.kosmo?delete=${delete}&group_code=${group["group_code"]}'/>">
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