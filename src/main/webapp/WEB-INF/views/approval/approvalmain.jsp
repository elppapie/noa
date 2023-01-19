<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!-- 전자결재 메인 -->
 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>



<link rel="stylesheet" href="${path}/css/approvalStyle.css">
<script src="${path}/js/jquery-3.5.1.js"></script>



<style>
    * {font-family: 'InfinitySans-RegularA1'; }
</style>


    <div class="index_section2">
        <form action="">
            <h2>결재현황</h2>
            <div id="e-pay-status">
                <span>
                    <p></p><a href="${path}/Approval/waitlist.kosmo?approver_status=결재대기" style="color:rgb(59, 211, 39);">결재대기</a>
                    <div>${approvalCount_YET}건</div>
                </span>
                <span>
                    <p></p><a href="${path}/Approval/onlist.kosmo?approver_status=결재중" style="color:rgb(59, 211, 39);">결재중</a>
                    <div>${approvalCount_UNDER}건</div>
                </span>
                <span>
                    <p></p><a href="${path}/Approval/comlist.kosmo?approver_status=결재완료" style="color:rgb(59, 211, 39);">결재완료</a>
                    <div>${approvalCount_DONE}건</div>
                </span>
            </div>
        </form>
   
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

	$(document).on('click', '#btnWriteForm', function(e){

		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/Approval/selectform.kosmo";//작성하기 버튼 누르면 이동하는 write페이지

	});

</script>
</head> 
<body>
<article>
<div class="container">
<div class="table-responsive">
<div class="col">
	<button type="button" class="btn float-right btn-sm btn-dark" id="btnWriteForm">작성하기</button>

</div>
        <form action="">
            <h4 style="float:right; margin-right:114px; margin-top:50px; color:gray;"><a href="${path}/Approval/approvallist.kosmo">결재 발신목록 보기</a></h4><!--내가 보낸 리스트 전체보기-->
            <h2 style="margin-bottom: 0; margin-top:70px">결재 수신목록</h2><!-- 내가 결재할 리스트 -->
            <table id="e-pay-list" style="margin-bottom:100px"  class="table table-striped table-sm">
                
                <tr>
                    <th>글번호</th>
                    <th>기안자</th>
                    <th>종류</th>
                    <th>제목</th>
                    <th>기안일</th>
                    <th>상태</th>
                </tr>
                <c:if test="${empty mainList}">
                	<!-- </table>-->
                		<h3 style="top:50%; text-align:center; margin-left:300px; margin-top:150px; margin-bottom:140px">
                			조회된 결재목록이 없습니다.
                		</h3>
                </c:if>
                <c:if test="${mainList != null}">
	                <c:forEach var="list" items="${mainList}">
		                <tr>
		                    <td>${list['APPROVAL_CODE']}</td>
		                    <td>${list['M_NAME']}</td>
		                    <td>${list['AF_NAME']}</td>
		                      <!--  <td>${list['APPROVAL_TITLE']}</td> --><!-- 상세보기 페이지로 이동 - 결재/반려 -->
		                      <td><a href="${path}/Approval/read.kosmo?approval_code=${list['APPROVAL_CODE']}" >${list['APPROVAL_TITLE']}</a></td>
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

