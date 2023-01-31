<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
	<h3>보낸 메일함</h3>
	<div class="text-right mb-2">
	</div>
	<table class="table table-light table-hover text-center">

		<thead>
			<tr>
				<th class="col-1">중요 메일 표시</th>
				<th class="col-2">메일 읽음/안읽음 표시</th>
				<th class="col-3">보낸 사람</th>
				<th class="col-4">제목</th>
				<th class="col-5">수신 날짜</th>				
				
			</tr>
		</thead>
		<tbody class="table-sm down-file-body">
			<c:if test="${empty receviemail}" var="isEmpty">
				<tr>
					<td colspan="6">메일이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach var="mail" items="${receviemail}" varStatus="loop">
					<tr>
						<td>${mail.MAIL_CHECK}</td>
						<td>${mail.MAIL_MARK}</td>
						<td>${mail.M_ID}</td>						
						<td>${mail.MAIL_TITLE}</td>
						<td>${mail.MAIL_REGIDATE}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>	
	</div>
</div>