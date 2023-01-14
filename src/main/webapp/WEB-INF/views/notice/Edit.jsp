<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
    
   <div class="jumbotron">
		<h1>
			공지사항 <small>수정 페이지</small>			
		</h1>
	</div>
	<c:if test="${! empty InputError}">
		<div class="alert alert-success alert-dismissible fade show">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${InputError}
		</div>
	</c:if>
	<form method="post" action="<c:url value="/views/notice/Edit.do"/>">
	<input type="hidden" name="no" value="${record.no}"/>  
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input type="text" value="${record.title}" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="5" name="content">${record.content}</textarea>
	  </div>
      <button type="submit" class="btn btn-light">수정</button>
    </form>	
</div>
