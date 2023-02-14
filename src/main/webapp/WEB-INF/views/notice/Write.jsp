<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
textarea{
      width: 100%;
      height: 500px;
}

</style>

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
	<form method="post" action="<c:url value="/Notice/writeOk.kosmo"/>">  
		<input type="hidden" name="관리자" value="kim1234@samsung.com"/>    
		<div class="form-group">
		  	<label><kbd class="ios">제목</kbd></label>
		  	<input id="noticeSave" type="text" value="${param.n_title}" class="form-control" placeholder="제목을 입력하세요" name="n_title">
		</div>
		<!-- 원본
		<div class="form-group">
			<label><kbd class="ios">내용</kbd></label>
			<textarea id="noticeSave" class="form-control" rows="10" name="n_content" placeholder="내용을 입력하세요">${param.n_content}</textarea>
		</div>
		 -->
  	     
  	    <div class="form-group">
  	     	<label><kbd class="ios">내용</kbd></label>
  	     	<textarea id="noticeSave" name="n_content" placeholder="내용을 입력하세요.">${param.n_content}</textarea>
		</div>
		  <!--  <button type="submit" class="btn btn-light">등록</button> -->
		     
		<div class="text-right mb-2">
			<button type="submit" class="btn btn-light">등록</button>
		</div>
      	
    </form>	
</div>


