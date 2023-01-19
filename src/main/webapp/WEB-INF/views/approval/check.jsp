<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<title>상세보기</title><!-- 내가 결재 요청한 문서 상세보기 -->

<script>

	$(document).on('click', '#check', function(e){//결재 진행 상황 확인하기

		e.preventDefault();

		location.href="${pageContext.request.contextPath}/Approval/#.kosmo";//결재 상황 확인 페이지로 이동

		//$("#form").submit();

	});

	

	$(document).on('click', '#back', function(e){//돌아가기 - 발신 목록 페이지로 이동

		e.preventDefault();

		

		location.href="${pageContext.request.contextPath}/Approval/approvallist.kosmo";

	});

</script>

<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}



</style>

</head>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<body>

	<article>

		<div class="container" role="main">

			<h2>상세보기 페이지</h2>

			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/approval/selectform.kosmo">

				<div class="mb-3">

					<label for="title">제목</label>

					

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

				

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

			

				</div>

			

			</form>

			<div >

				<button type="button" class="btn btn-sm btn-primary" id="check">결재상황확인</button>

				<button type="button" class="btn btn-sm btn-primary" id="back">돌아가기</button>

			</div>

		</div>

	</article>

</body>

</html>