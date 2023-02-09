<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  
<!--------------------------------------------------------->
<div class="row">
	<div class="col-lg-2">
		<div class="row flex-grow">
			<div class="col-12 stretch-card">
			 <div class="card cards-rounded">
			 	<div class="card-body" >
			 		메일 사이드바
			 	<ul class="nav flex-column sub-menu">
				<li class="nav-item"><a class="nav-link" href="/NodeArchive/Mail/writeToOthers.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square" aria-hidden="true"> 메일쓰기</i></a></li>
				<li class="nav-item"><a class="nav-link" href="/NodeArchive/Mail/writeToMe.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square" aria-hidden="true"> 내게쓰기</i></a></li>
				 <li class="nav-item"><a class="nav-link active" href="/NodeArchive/Mail/mailList.kosmo">전체메일</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailView.kosmo">받은메일함</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailSended.kosmo">보낸메일함</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailFavorite.kosmo">즐겨찾기</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailTemp.kosmo">임시메일함</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailMy.kosmo">내게쓴메일함</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailSpam.kosmo">스팸메일함</a></li>
				<li class="nav-item"> <a class="nav-link" href="/NodeArchive/Mail/mailRecycle.kosmo">휴지통</a></li>
		            <!--  
		            전체메일, 받은메일함에서 표시할 항목들
		                *메일 검색 : /Mail/mailSel.kosmo
		                *메일 읽음/안읽음 표시 : /Mail/mailRead.kosmo
		                *메일 즐찾 체크여부 : /Mail/mailCheck.kosmo
		            메일 작성 페이지에서 표시할 항목
		                *메일 임시 저장 : /Mail/sendSave
		                *메일 참조 설정 : /Mail/sendRefer
		            -->
				</ul>	
			 	</div>
			 </div>
			</div>
		</div>
	</div>
	<div class="col-lg-10">
		<div class="card cards-rounded">
			<div class="card-body">
				<div class="d-sm-flex justify-content-between align-items-start">
					<div>
						<h4 class="card-title card-title-dash">받은 메일함</h4>
						<p class="card-subtitle card-subtitle-dash">메일 \${안읽은메일}/\${읽은메일}</p>
					</div>
					<%-- 
					<div>
						<button class="btn btn-primary btn-lg text-white mb-0 me-0"
							type="button">
							<i class="mdi mdi-account-plus"></i>Add new member
						</button>
					</div>
					--%>
				</div>
				<div class="table-responsive  mt-1">
					<table class="table select-table">
						<thead>
							<tr>
								<!-- 체크박스 th -->
								<th>
									<div class="form-check form-check-flat mt-0">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input" aria-checked="false"><i
											class="input-helper"></i><i class="input-helper"></i></label>
									</div>
								</th>
								<th class="col-1">중요표시</th>
								<th class="col-2">읽음/안읽음</th>
								<th class="col-3">보낸이</th>
								<th class="col-4">제목</th>
								<th class="col-5">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty receviemail}" var="isEmpty">
								<tr>
									<td colspan="6">받은 메일이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty }">
								<c:forEach var="mail" items="${receviemail}" varStatus="loop">
									<c:set var="mail_important" value="${mail.MAIL_MARK}"/>
									<c:set var="mail_read" value="${mail.MAIL_CHECK}"/>
									<tr>
										<td>
											<div class="form-check form-check-flat mt-0">
												<label class="form-check-label"> <input
													type="checkbox" class="form-check-input" aria-checked="false"><i
													class="input-helper"></i><i class="input-helper"></i></label>
											</div>
										</td>
										<td>
											<c:if test="${mail_important != 0}">
												<i class=" fa fa-solid fa-star"></i>			
											</c:if>
											<c:if test="${mail_important == 0}">
												<i class=" fa fa-light fa-star"></i>
											</c:if>
										</td>
										<td>
											<c:if test="${mail_read != 0}">
												<i class="fa fa-regular fa-envelope-open"></i>			
											</c:if>
											<c:if test="${mail_read == 0}">
												<i class="fa fa-solid fa-envelope"></i>
											</c:if>
										</td>
										<td>${mail.M_ID}</td>
										<td>${mail.MAIL_TITLE}</td>
										<%-- <td>${mail.M_CONTENT}</td>--%>
										<td>${mail.MAIL_REGIDATE}</td>
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