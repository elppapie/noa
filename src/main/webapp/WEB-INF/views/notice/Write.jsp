<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
    
   <div class="jumbotron">
		<h1>
			등록 페이지			
		</h1>
	</div>
	<c:if test="${! empty InputError}">
		<div class="alert alert-success alert-dismissible fade show">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${InputError}
		</div>
	</c:if>
	<form method="post" action="<c:url value="/views/notice/Write.do"/>">  
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
      <div class="form-group">
        <label><kbd class="ios">제목</kbd></label>
        <input type="text" value="${param.title}" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <div class="form-group">
		<label><kbd class="ios">내용</kbd></label>
		<textarea class="form-control w-100" rows="5" name="content" placeholder="내용을 입력하세요">${param.content}</textarea>
	  </div>
     <!--  <button type="submit" class="btn btn-light">등록</button> -->
      
      <div class="text-right mb-2">
		<a href="<c:url value="/Schedule/notice.kosmo"/>" class="btn btn-light">등록</a>
	</div>
      
    </form>	
</div>
