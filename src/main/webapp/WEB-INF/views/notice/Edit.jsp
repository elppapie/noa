<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("/notice/Edit.jsp - 공지사항 수정");
	//DB 등록 - NoticeService - NoticeDAO
	response.sendRedirect("view.kosmo?no=1");
 %>
 
 <style>
textarea{
      width: 100%;
      height: 500px;
}
</style>

<div class="container">
    
   <div class="jumbotron">
		<h2>
			공지사항 수정		
		</h2>
	</div>
	<form action="view.kosmo" method="post" enctype="multipart/form-data" onsubmit="return check()">
	
		<label><kbd class="ios">제목</kbd></label>
		<input type="text" name="title" value="2023년 신년사 입니다." class="form-control">
		

	
		<label><kbd class="ios">내용</kbd></label>
		<textarea>노드아카이브 임직원 여러분 새해 복 많이 받으시고 건강하게 지내시길 바랍니다.</textarea>	
		
		
	
		
			<button type="submit" class="btn btn-light" onClick="location.href='edit.kosmo?title='">수정</button>
			<button type="button" class="btn btn-light" onclick="history.back()">취소</button>
		
	
</form>
</div>
