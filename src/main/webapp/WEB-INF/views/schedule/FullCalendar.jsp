<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@ page import="java.util.List" --%>
<%--@ page import="java.util.Map"--%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- 제이쿼리 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>



<!-- ⚜⚜⚜⚜ request 영역으로 전달된 List<Map>을 변수 calendarList에 담기 ⚜⚜⚜⚜ -->
<c:set var="calendarList" value="${calendarList}"/>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
		<div class="card">
			<div class="card-body">
				<div id='calendar'></div>
				<!-- 1/14 마진 줘봤지만 원하는 느낌이 안 나고 한칸크기/전체 크기를 좀 줄여야 할듯 -->
			</div>
		</div>
	<input type="hidden" id="hidden" value="${calendarList}"/>
	
	</div>
</div>
<script>
<%--
$(function(){
	
	var hii = $('#hidden').val();
	$.each(JSON.parse(hii),function(index,item){
		console.log(item);
	});
});
--%>

document.addEventListener('DOMContentLoaded', function() {
	var hiii = '${calendarList}';
	var hoo = '${calendarList[1]["SCHE_TITLE"]}';
	
	console.log(hiii);
	console.log('typeof hiii:'+typeof hiii);
	console.log(typeof hiii[1]);
	console.log(hoo);
	console.log(typeof hoo);
	console.log(typeof hoo[1]);
	console.log(hoo[1]);
	console.log("이거되려나:"+'${calendarList[1]["SCHE_CONTENT"]}')
	
	console.log(hiii[1]["SCHE_TITLE"]);
	console.log(hiii[1].SCHE_TITLE);
	
	$(function(){
		var request = $.ajax({
			url: "<c:url value='/Schedule/fullcalendarData.kosmo'/>",
			method: "GET",
			dataType: "json"
		});
		
		request.done(function(data){
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				locale: 'ko', // 한국어 설정
				headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator: true, // 현재 시간 마크
				events: data,
				eventClick : function(info){
					info.el.style.borderColor = 'red';
				}
			});
			calendar.render();
		});
		request.fail(function(jdXHR, textStatus){
			console.log(jdXHR);
			alert("Request failed: "+textStatus );
		});
	});
});
</script>