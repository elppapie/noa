<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<link rel="stylesheet" href="${path}/css/approvalStyle.css">
<script src="${path}/js/jquery-3.5.1.js"></script>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">
<style>
body {
padding-top: 70px;
padding-bottom: 30px;
}
</style>
<script>
$(document).on('click', '#appList', function(e){//전체
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/Approval/approvallist.kosmo";
});
$(document).on('click', '#waitList', function(e){//대기
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/Approval/waitlist.kosmo";
});
$(document).on('click', '#onList', function(e){//진행
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/Approval/onlist.kosmo";
});
$(document).on('click', '#comList', function(e){//완료
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/Approval/comlist.kosmo";
});
$(document).on('click', '#rejectList', function(e){//반려
	e.preventDefault();
	location.href = "${pageContext.request.contextPath}/Approval/rejectlist.kosmo";
});
	

</script>
</head> 
<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<body>
<article>
<div class="container">
<div class="table-responsive">
<div >
	<button type="button" class="btn-sm btn-secondary" id="appList">전체</button>
	<button type="button" class="btn-sm btn-secondary" id="waitList">대기</button>
	<button type="button" class="btn-sm btn-secondary" id="onList">진행</button>
	<button type="button" class="btn-sm btn-secondary" id="comList">완료</button>
	<button type="button" class="btn-sm btn-secondary" id="rejectList">반려</button>
	
</div>
        <form action="">
            <h2 style="margin-bottom: 0; margin-top:70px">결재 대기목록</h2>
            <table id="e-pay-list" style="margin-bottom:100px"  class="table table-striped table-sm">
                
                <tr>
                    <th>글번호</th>
                    <th>기안자</th>
                    <th>종류</th>
                    <th>제목</th>
                    <th>기안일</th>
                    <th>상태</th>
                </tr>
                <c:if test="${empty waitlist}">
                	</table>
                		<h3 style="top:50%; text-align:center; margin-left:300px; margin-top:150px; margin-bottom:140px">
                			조회된 결재목록이 없습니다.
                		</h3>
                </c:if>
                <c:if test="${waitlist != null}">
	                <c:forEach var="list" items="${waitlist}">
		                <tr>
		                    <td>${list['APPROVAL_CODE']}</td>
		                    <td>${list['M_NAME']}</td>
		                    <td>${list['AF_NAME']}</td>
		                    <td>${list['APPROVAL_TITLE']}</td>
		                    <td>${list['APPROVAL_REGIDATE']}</td>
		                    <td>${list['APPROVER_STATUS']}</td>
		                </tr>
	                </c:forEach>
                </c:if>
        	</table>        
        </form>
    </div>
</table>

</div>

</div>

</article>
