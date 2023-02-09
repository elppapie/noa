<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 뷰 페이지 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="res" value="${pageContext.request.contextPath}/resources" />
<c:set var="m_id" ><sec:authentication property="principal.username"/></c:set>


<style>
.iamnothref {
	text-decoration: none;
	color: white;
}

.italic {
	font-style: italic;
	color: rgb(211, 211, 211);
}
.item-with-badge-notification {
    position:relative;
    padding-top:20px;
    display:inline-block;
}
.notify-badge{
    position: absolute;
    right:-20px;
    top:10px;
    background:red;
    text-align: center;
    border-radius: 30px 30px 30px 30px;
    color:white;
    padding:5px 10px;
    font-size:15px;
}
</style>



<%-- 
<div
	class="d-sm-flex align-items-center justify-content-between border-bottom">
	<!----Main Page의 Nav 메뉴 작성---->
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item"><a class="nav-link active" href="#"
			aria-selected="true">부서/팀 조회</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/Admin/groups.kosmo"/>" aria-selected="false">그룹
				조회</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/Admin/members.kosmo"/>" aria-selected="false">구성원
				조회</a></li>
		<li class="nav-item"><a class="nav-link border-0" href="#more"
			aria-selected="false">blank</a></li>
	</ul>
	<div>
		<div class="btn-wrapper">
			<a href="<c:url value="/Schedule/write.kosmo"/>"
				class="btn btn-otline-dark align-items-center"><i
				class="fa-solid fa-square-plus"></i> blank</a> <a href="#"
				class="btn btn-otline-dark"><i
				class="fa-solid fa-magnifying-glass"></i> blank</a> <a href="#"
				class="btn btn-primary text-white me-0"><i
				class="fa-solid fa-download"></i> blank</a>
		</div>
	</div>
</div>
--%>
<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section"
		role="tabpanel" aria-labelledby="todo-section">
		<div class="row">
			<div class="col-sm-12">
				<div class="row flex-grow">
					<div class="statics-details d-flex align-items-center justify-content-between grid-margin stretch-card">
						<div class="col-md-4">
							<div>
	                            <p class="statistics-title">회사이름 넣기</p>
	                            <h3 class="rate-percentage">NodeArchive</h3>                            
	                        </div>
	                        <div>
	                            <p class="statistics-title">설립일</p>
	                            <h3 class="rate-percentage">23.23.23</h3>                            
	                        </div>
                        </div>
                        <div class="col-md-8 d-flex">
                        	<div class="col-md-4">
								<div class="item-with-badge-notification">
		                            <p class="statistics-title">메일</p>
		                            <h3 class="rate-percentage">32.53%</h3>                            
		                        	<p class="text-danger d-flex">이번달 <i class="mdi mdi-menu-up"></i><span>-0.5%</span></p>
		                        </div>
		                        <div class="item-with-badge-notification">
		                            <p class="statistics-title">진행 프로젝트</p>
		                            <h3 class="rate-percentage">32.53%</h3>           
		                        	<p class="text-danger d-flex">이번달 <i class="mdi mdi-menu-up"></i><span>-0.5%</span></p>
						            <span class="notify-badge">!</span>
		                        </div>
		                        <div class="item-with-badge-notification">
		                            <p class="statistics-title">진행 일정</p>
		                            <h3 class="rate-percentage">32.53%</h3>
									<p class="text-danger d-flex">이번달 <i class="mdi mdi-menu-up"></i><span>-0.5%</span></p> 
									<span class="notify-badge">!</span>                          
		                        </div>
                        	
                        	</div>
                        	<div class="col-md-4">
		                        <div class="item-with-badge-notification">
		                            <p class="statistics-title">메신저</p>
		                            <h3 class="rate-percentage">32.53%</h3>
		                            <p class="text-danger d-flex">이번달 <i class="mdi mdi-menu-up"></i><span>-0.5%</span></p>
		                            <span class="notify-badge">!</span>                            
		                        </div>
		                        <div class="item-with-badge-notification">
		                            <p class="statistics-title">Bounce Rate</p>
		                            <h3 class="rate-percentage">32.53%</h3>
		                            <p class="text-danger d-flex">이번달 <i class="mdi mdi-menu-up"></i><span>-0.5%</span></p>
		                            <span class="notify-badge">!</span>                            
		                        </div>
                        	
                        	</div>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="card">
					<div class="card-body">내 프로필 넣기</div>
				</div>
			</div>
			<!-- col-sm-4 끝 -->
			<div class="col-lg-8">
				<div class="row flex-grow">
					<div class="col-12 grid-margin stretch-card">


						<div class="card">
							<div class="card-body">



								<h4 class="card-description">
									<code>조직도</code>
								</h4>
								<div class="">
									<h3 class="card-title">부서정보</h3>
									<div class="table-responsive mt-1">
										<table class="table table-hover text-center table-responsive">
											<thead>
												<tr>
													<th class="col-2">부서명</th>
													<th class="col-4">부서책임자(연락처)</th>
													<th class="col-2">부서 생성일</th>
													<th class="col-2">부서 소속 인원(수)</th>
													<th class="col-2">
														<div class="btn btn-primary btn-lg">
															<a class="iamnothref"
																href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}&enroll=dept'/>">
																신규 부서 추가 </a>
														</div>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty deptList}" var="emptyDept">
													<tr>
														<td colspan='10'>등록된 부서가 없습니다<br /> <br /> <a
															href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">부서
																등록하기</a>
														</td>
													</tr>
												</c:if>
												<c:if test="${not emptyDept}">
													<!-- 부서별 정보 뿌리기 -->
													<c:forEach var="dept" items="${deptList}">
														<tr>
															<td>${dept["dept_name"]}</td>
															<td>${dept["dept_leader_name"]}(
																${dept["dept_leader_contact"]} )</td>
															<td>${fn:split(dept["dept_regidate"]," ")[0]}</td>
															<td>${dept["dept_members"]}</td>
															<td>
																<div class="btn btn-primary">
																	<a class="iamnothref"
																		href="<c:url value='/Admin/edit.kosmo?dept_code=${dept["dept_code"]}'/>">
																		수정하기 </a>
																</div>&nbsp;
																<div class="btn btn-danger">
																	<a class="iamnothref"
																		href="<c:url value='/Admin/delete.kosmo?dept_code=${dept["dept_code"]}'/>">
																		삭제하기 </a>
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
				<!-- col- -->
				<div class="row flex-grow">
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<div class="">
									<h4 class="card-description">조직도</h4>
								</div>
								<div class="">
									<div>
										<h3 class="card-title">팀정보</h3>
									</div>
									<div class="table-responsive mt-1">
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
															<a class="iamnothref"
																href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}&enroll=team'/>">
																신규 팀 추가 </a>
														</div>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty teamList}" var="emptyTeam">
													<tr>
														<td colspan='6'>등록된 팀이 없습니다<br /> <br /> <a
															href="<c:url value='/Admin/enroll.kosmo?emp_code=${emp_code}'/>">팀
																등록하기</a>
														</td>
													</tr>
												</c:if>
												<c:if test="${not emptyTeam}">
													<!-- 팀별 정보 뿌리기 -->
													<c:forEach var="team" items="${teamList}">
														<tr>
															<td>${team["dept_name"]}</td>
															<td>${team["team_name"]}</td>
															<c:if test="${team['team_leader_name'] != null}"
																var="hasLeader">
																<td>${team["team_leader_name"]}(
																	${team["team_leader_contact"]} )</td>
															</c:if>
															<c:if test="${not hasLeader}">
																<td class="italic">팀 책임자가 없습니다</td>
															</c:if>
															<td>${fn:split(team["team_regidate"]," ")[0]}</td>
															<td>${dept["dept_members"]}</td>
															<td>
																<div class="btn btn-primary">
																	<a class="iamnothref"
																		href="<c:url value='/Admin/edit.kosmo?dept_code=${team["dept_code"]}&team_no=${team["team_no"]}'/>">
																		수정하기 </a>
																</div>&nbsp;
																<div class="btn btn-danger">
																	<a class="iamnothref"
																		href="<c:url value='/Admin/delete.kosmo?dept_code=${team["dept_code"]}&team_no=${team["team_no"]}'/>">
																		삭제하기 </a>
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
			</div>
			<!-- col-sm-8 끝 -->
		</div>
		<!-- row 끝남 -->
	</div>
</div>