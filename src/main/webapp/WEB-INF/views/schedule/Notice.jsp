<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<c:if test="${empty listPagingData.lists }" var="isEmpty">
				<tr>
					<td colspan="4">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach var="record" items="${listPagingData.lists}" varStatus="loop">
					<tr>
						<td>${record.no}</td>
						<td class="text-left"><a
							href="<c:url value="/views/notice/View.do?no=${record.no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>">${record.title}</a> <span class="badge badge-light">${record.commentCount}</span></td>
						<td>${record.name}</td>						
						<td>${record.postDate}</td>
					</tr>
				</c:forEach>
			</c:if>

		</tbody>
	</table>
	<!-- 페이징 출력 -->
	<div>${listPagingData.pagingString}</div>
	<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post">
       <select class="form-control" name="searchColumn">
	    <option value="title">제목</option>
	    <option value="content">내용</option>
	    <option value="name">작성자</option>	    
	  </select>
      <input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord"/>      
     <!--  <button type="submit" class="btn btn-light">검색</button> -->
      <a href="<c:url value="/Notice/search.kosmo"/>" class="btn btn-light">검색</a>
    </form>
    
</div>

</body>
</html>