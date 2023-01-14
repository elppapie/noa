<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container">
	<div class="jumbotron">
		<h1>
			공지사항 <small>상세보기 페이지</small>
		</h1>
	</div>
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td>${record.no}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">글쓴이</th>
				<td>${record.name }</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td>${record.postDate}</td>
			</tr>

			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${record.title}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2">${record.content }</td>
			</tr>
		</tbody>
	</table>
	<!-- 수정/삭제/목록 컨트롤 버튼 -->
	<div class="text-center">
		<%-- 
		<c:if test="${sessionScope.id==record.id }" var="isWriter">
		--%>
		<!-- 세션영역에 있는 아이디값 가져오기 -->
		<!-- 씨큐리티 적용시 -->
		<c:set var="sessionId"><sec:authentication property="principal.username"/> </c:set>
		<c:if test="${sessionId==record.id }">
			<a href="<c:url value="/views/notice/Edit.do?no=${record.no}"/>"
			class="btn btn-success">수정</a> 
			<a
			href="javascript:isDelete(${record.no})" class="btn btn-success">삭제</a>
		
		</c:if>
		
		<a
			href="<c:url value="/views/schedule/Notice.do?nowPage=${param.nowPage}"/>"
			class="btn btn-success">목록</a>
	</div>
	<!-- 한줄 코멘트 입력 폼 -->
	<form id="form" 
		class="form-inline col-sm-12 d-flex justify-content-center mt-3">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" name="no"
			value="${record.no}" />
		<!-- 댓글 수정용 -->
		<input type="hidden" name="lno" /> <input type="text" id="linecomment"
			name="linecomment" class="form-control mx-2 w-50"
			placeholder="한줄 댓글을 입력하세요" /> <input type="button"
			class="btn btn-danger mx-2" value="등록" id="submit" />
	</form>
	<!-- 한줄 코멘트 목록 -->
	<div class="row d-flex justify-content-center mt-3">
		<div class="col-sm-8">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th class="col-2">작성자</th>
						<th>코멘트</th>
						<th class="col-2">작성일</th>
						<th class="col-2">삭제</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body" id="comments-list">
					<c:if test="${empty record.comments }" var="isEmpty">
						<tr id="empty-comment">
							<td colspan="4">등록된 한줄 댓글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not isEmpty}">
						<c:forEach var="comment" items="${record.comments}">
							<tr>
								<td>${comment.name }</td>
								<td class="text-left line-comment" title="${comment.lno}">${comment.lineComment}</td>
								<td>${comment.lpostDate}</td>
								<td>
								<%-- 
								<c:if test="${sessionScope.id==comment.id}" var="isSame">
								--%>
								<!-- 씨큐리티 사용시 -->
								<c:if test="${sessionId==comment.id}" var="isSame">
									<button class="btn btn-info btn-sm my-delete">삭제</button>
								</c:if>
								<c:if test="${not isSame }">
									삭제불가
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	//[ajax로 서버에 데이터를 요청하는 함수]
	/*
	※AJAX에서의 요청방식
	 -GET, POST요청 :
		 data:key1=value1&key2=value2&...
		 혹은 data:{key1:value1,key2:value2,...}
		 contentType:"application/x-www-form-urlencoded"(디폴트)			 
		 스프링에서는 @RequestParam으로 데이타를 받는다
	 -POST,PUT, DELETE요청
		data:JSON.stringify({key1:value1,key2:value2,...})
	    contentType:"application/json"
	    스프링에서는 @RequestBody 로 데이터를 받는다.
	*/
	//코멘트 등록 및 수정처리
	$('#submit').click(function(){
		console.log($(this).val());
		console.log($('#form').serialize());
		var action;
		if($(this).val()==='등록')
			action="<c:url value="/onememo/comments/Write.do"/>"		
		else
			action="<c:url value="/onememo/comments/Edit.do"/>";
		
		//ajax로 요청
		$.ajax({
			url:action,
			data:$('#form').serialize(),
			dataType:'json',
			type:'post'})
			.done(function(data){
				console.log('서버로부터 받은 데이타:',data);
				if($('#submit').val()==='등록'){//등록처리
					
					
					var tr="<tr><td>"+data.name+"</td><td class='text-left line-comment' title='"+data.lno+"'>"+data.linecomment+"</td><td>"+getToday()+"</td><td><span class='btn btn-info btn-sm my-delete'>삭제</span></td></tr>";
					
					
					$('#comments-list').prepend(tr);
					if($("#empty-comment").length !=0){//댓글이 없습니다 요소 삭제
						$("#empty-comment").remove();
					}
				}
				else{//수정처리
					$('#submit').val('등록');
					$('td[title="'+data.lno+'"]').html(data.linecomment);
					$('td[title="'+data.lno+'"]').css('color','red');
				}
				//입력값 클리어 및  포커스 주기
				$('#linecomment').val("");
				$('#linecomment').focus();
				
			})
			.fail(function(error){
				console.log('에러:',error);
			});			
	});
		
		
		
	
	//오늘날짜 얻는 함수
	function getToday(){
		var date = new Date();
		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	
	//※댓글 목록의 제목 클릭시-click이벤트걸때 반드시  $(document).on('이벤트명','셀렉터',콜백함수)으로
	//그래야 동적으로 추가된 요소에도 이벤트가 발생한다
	$(document).on('click','.line-comment',function(){
		//먼저 각 댓글 작성자의 아이디를 Ajax로가져온다.
		console.log('댓글 번호:',$(this).attr('title'));
		var this_ = $(this);//클릭한 제이쿼리객체
		
		$.ajax({
			url:"<c:url value="/onememo/comments/GetId.do"/>",
			data:"lno="+this_.attr('title')
			
		}).done(function(data){
			
			console.log('댓글 작성자 아이디:',data);
			//if('${sessionScope.id}'===data){//본인 댓글만 수정
			if('${sessionId}'===data){//본인 댓글만 수정(씨큐리티 적용시)
				//입력상자값을 클릭한 제목으로 변경
				$('#linecomment').val(this_.html());
				//버튼의 텍스트를 수정으로 변경
				$('#submit').val('수정');
				//폼의 hidden인 lno의 value를 클릭한 제목의 lno값으로 설정
				$('input[name=lno]').val(this_.attr('title'));
				console.log('히든값 설정 확인(lno):',$('input[name=lno]').val());
			}
		}).fail(function(error){
			console.log('아이디 찾기 오류:',error);
		});
		
		
		
		
	});
	
	//댓글 삭제 처리
	$(document).on('click','.my-delete',function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			console.log($(this).parent().prev().prev().attr('title'));
			var lno=$(this).parent().prev().prev().attr('title');
			var this_ = $(this);
			$.ajax({
				url:"<c:url value="/onememo/comments/Delete.do"/>",
				type:"delete",
				data:JSON.stringify({"lno":lno}),
				dataType:'json',
				contentType:"application/json"
			})
			.done(function(data){
				console.log('삭제 성공:',data);
				//클릭한 tr삭제
				this_.parent().parent().remove();
			})
			.fail(function(error){
				console.log('삭제 실패:',error);
			});
		}
	});
	
	
	//메모글 삭제
	function isDelete(no){
		if(confirm("삭제 할래요?")){
			location.replace("<c:url value="/onememo/bbs/Delete.do?no="/>"+no);
		}
	}
	
</script>


			