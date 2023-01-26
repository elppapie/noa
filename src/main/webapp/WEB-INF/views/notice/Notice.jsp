<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
   <div class="jumbotron">
		<h1>
			공지사항			
		</h1>
	</div>
	<div class="text-right mb-2">
		<a href="<c:url value="/Notice/write.kosmo"/>" class="btn btn-light">글등록</a>
	</div>
	<table class="table table-light table-hover text-center">

		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-2">글쓴이</th>				
				<th class="col-2">작성일</th>
			</tr>
		</thead>
		<tbody class="table-sm down-file-body">
			
			<tr>
				<td>01</td>
				<td><a href="http://localhost:8080/NodeArchive/Notice/view.kosmo">2023년 신년사 입니다.</a></td>
				<td>관리자</td>
				<td>2022-12-31</td>
			</tr>
		</tbody>
	</table>
	<!-- 페이징 출력 -->
	<div>${listPagingData.pagingString}</div>
	<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post">  
	  <div class="mx-quto input-group mt-5 justify-content-center">
	  <div class="dropdown">
	  <button class="btn btn-light dropdown-toggle" data-toggle="dropdown">
	  선택
	  </button>
	  <div class="dropdown-menu">
	  	<a class="dropdown-item" href="#">제목</a>
	  	<a class="dropdown-item" href="#">내용</a>
	  	<a class="dropdown-item" href="#">작성자</a>
	  </div>
	 </div>

		
			<mx-auto><input name="query" type="text"
				class="form-control" placeholder="검색어 입력" aria-label="search"
				aria-describedby="button-addon2"> </mx-auto>
			<button class="btn btn-grey" type="submit" id="button-addon2">검색</button>
		</div>

	</form>
	 
</div>