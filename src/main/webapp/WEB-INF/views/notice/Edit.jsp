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
	<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  -->  
	 <input type="hidden" name="관리자" value="kim1234@samsung.com"/>
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input type="text" value="${record.n_title}" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <!--  원본
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="10" cols="33" name="content">${record.n_content}</textarea>
	  </div>
	  -->
	  <div class="form-group">
    	<label for="exampleFormControlTextarea1">Example textarea</label>
    	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  	  </div>
	  
      <button type="submit" class="btn btn-light">수정</button>
    </form>	
</div>
