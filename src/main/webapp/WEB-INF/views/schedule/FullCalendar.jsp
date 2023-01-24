<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@ page import="java.util.List" --%>
<%--@ page import="java.util.Map"--%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="memberList" value="${organization.getTeamMembersList()}" />
<c:set var="one" value="${oneSchedule}"/>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- 제이쿼리 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>




<!-- ⚜⚜⚜⚜ request 영역으로 전달된 List<Map>을 변수 calendarList에 담기 ⚜⚜⚜⚜ -->
<c:set var="calendarList" value="${calendarList}"/>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
<a href="<c:url value="/Admin/deptList.kosmo"/>">관리자페이지</a>
  <ul class="nav nav-tabs" role="tablist">
     <%-- 
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="<c:url value='/Admin/deptList.kosmo'/>" role="tab" aria-selected="true">관리자페이지(뷰페이지구성/임시버튼)</a>
    </li>
    --%>
    <%-- 
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="<c:url value="Schedule/year.kosmo"/>" role="tab" aria-selected="false">연간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active " id="home-tab" data-bs-toggle="tab" href="<c:url value="Schedule/month.kosmo"/>" role="tab" aria-controls="overview" aria-selected="true">월간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="<c:url value="Schedule/week.kosmo"/>" role="tab" aria-selected="false">주간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#more" role="tab" aria-selected="false">More</a>
    </li>
    --%>
  </ul>
  <div>
    <div class="btn-wrapper">
      <%-- 
      <a href="<c:url value="/Notice/list.kosmo"/>" class="btn btn-otline-dark align-items-center"><i class="fa-solid fa-square-plus"></i> 공지사항(임시)</a>
      --%>
      <a href="#" class="btn btn-otline-dark"><i class="fa-solid fa-download"></i> 달력저장</a>
      <a href="#" class="btn btn-otline-dark"><i class="fa-solid fa-magnifying-glass"></i> 일정검색</a>
      <a href="<c:url value="/Schedule/write.kosmo"/>" class="btn  btn-primary text-white me-0 align-items-center"><i class="fa-solid fa-square-plus"></i> 일정추가</a>
    </div>
  </div>
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

<!-- The Modal -->
<div class="modal viewEventModal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 style="font-weight:bold;">일정 조회/수정</h3>
        <button type="button" class="close closeModal" data-dismiss="modal">닫기</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body card-body">
		<!-- BS4에서 긁어옴 -->
		<form class="needs-validated" action="<c:url value='/Schedule/editOk.kosmo'/>" method='POST'>
			<div class="form-group">
				<label for="sche_title">일정종류:</label>
				<input type="text" class="form-control" value="${one['SCHE_TYPE']}" name="sche_type" id="sche_type">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>			
			</div>		
		
			<div class="form-group">
				<label for="sche_title">일정명:</label>
				<input type="text" class="form-control" value="${one['SCHE_TITLE']}" name="sche_title" id="sche_title">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>			
			</div>
			<div class="form-group">
				<label for="sche_content">일정내용:</label>
				<input type="text" class="form-control" value="${one['SCHE_CONTENT']}" name="sche_content" id="sche_content">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>			
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">시작날짜:</span>
				</div>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_STARTDATE'],' ')[0]}" name="sche_startdate_d" id="sche_startdate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">시작시간:</span>
				</div>
				<input type="time" class="form-control" value="${fn:split(one['SCHE_STARTDATE'],' ')[1]}" name="sche_startdate_t" id="sche_startdate_t">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">마감날짜:</span>
				</div>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_ENDDATE'],' ')[0]}" name="sche_enddate_d" id="sche_enddate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">마감시간:</span>
				</div>
				<input type="time" class="form-control" value="${fn:split(one['SCHE_ENDDATE'],' ')[1]}" name="sche_enddate_t" id="sche_enddate_t">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group">
				<label for="sche_color">일정색깔:</label>
				<input type="color" class="form-control" value="${one['SCHE_COLOR']}" name="sche_color" id="sche_color">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			
			<div class="form-group">
				<label for="sche_status">일정상태:</label>
				<input type="text" class="form-control" value="${one['SCHE_STATUS']}" name="sche_status" id="sche_status">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<%-- 
			<div class="form-group form-check">
				<label class="form-check-label">
					<input class="form-check-input" type="checkbox" name="remember"> Remember me
				</label>
			</div>
			--%>
			<div class="form-group input-group">
				<label for="sche_ref">참조인:</label><br/>
				<c:if test="${ref-list.size() > 1}">
					<c:forEach items="${ref-list}" var="ref">
						<c:if test="${ref['m_id'] != requestScope['m_id']}">
							
							
							
							<div class="input-group-prepend">
								<span class="input-group-text text-dark">이름:</span>
							</div>
							<input type="text" class="form-control" value="${ref['m_name']}" name="sche_ref" id="sche_ref">
							<div class="input-group-prepend">
								<span class="input-group-text text-dark">직급:</span>
							</div>
							<input type="text" class="form-control" value="${ref['position_name']}" name="sche_ref" id="sche_ref">
							<div class="input-group-prepend">
								<span class="input-group-text text-dark">부서:</span>
							</div>
							<input type="text" class="form-control" value="${ref['dept_name']}" name="sche_ref" id="sche_ref">
							<div class="input-group-prepend">
								<span class="input-group-text text-dark">팀:</span>
							</div>
							<input type="text" class="form-control" value="${ref['team_name']}" name="sche_ref" id="sche_ref">
							<div class="input-group-prepend">
								<span class="input-group-text text-dark">아이디:</span>
							</div>
							<input type="text" class="form-control" value="${ref['m_id']}" name="sche_ref" id="sche_ref">																									

						</c:if>
					</c:forEach>

				</c:if>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			
			
			<div class="form-group">
				<label for="selectDeptMember">참조인 변경:</label> 
				<select
					class="form-control" id="selectDeptMember" name="memberList"
					multiple size="10" style="height: 100%;">
					<c:forEach var="member" items="${memberList}">
						<c:if test="${member['m_id'] != m_id}">
							<option value="${member['m_id']}">${member["m_name"]},
								팀번호:${member["team_no"]}, 직급:${member["position_name"]}, 아이디:${member["m_id"]}
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<input type="hidden" name="sche_no" value="${one['SCHE_NO']}"/>
			<input type="submit" class="btn btn-primary" value="제출"/>
			<input type="submit" class="btn btn-primary" value="목록으로"/>
		</form>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
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
//	var hoo = '${calendarList[1]["SCHE_TITLE"]}';
	
	console.log(hiii);
//	console.log('typeof hiii:'+typeof hiii);
//	console.log(typeof hiii[1]);
//	console.log(hoo);
//	console.log(typeof hoo);
//	console.log(typeof hoo[1]);
//	console.log(hoo[1]);
//	console.log("이거되려나:"+'${calendarList[1]["SCHE_CONTENT"]}')
	
//	console.log(hiii[1]["SCHE_TITLE"]);
//	console.log(hiii[1].SCHE_TITLE);
	
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
					return date.date.year + '  년  ' + (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator: true, // 현재 시간 마크
				events: data,
				eventClick : function(info){
					$.ajax({
					    url: "<c:url value='/Schedule/oneEvent.kosmo?sche_no="+info.event._def.publicId+"'/>",
					    type: 'GET',
					    contentType : "application/json",
					    dataType: 'json'
					})
					.done(function(data){
						$('.viewEventModal').modal('show');
						//$('.viewEventModal').show();
						//viewModalOpen(info);
						$('#sche_title').val(info.event._def.title);
						$('#sche_content').val(data['sche_content']);
						$('#sche_startdate_d').val(data['sche_startdate'].split(" ")[0]);
						$('#sche_startdate_t').val(data['sche_startdate'].split(" ")[1]);
						$('#sche_enddate_d').val(data['sche_enddate'].split(" ")[0]);
						$('#sche_enddate_t').val(data['sche_enddate'].split(" ")[1]);
						$('#sche_color').val(data['sche_color']);
						$('#sche_status').val(data['sche_status']);
						$('#sche_type').val(data['sche_type']);
						for(const i in data['sche_ref']){
							console.log("안녕 나는 "+i+"야");
						}
						//$('#sche_ref').val(data['sche_ref']);
					});
					
					
					
					var oneEvent = '${one}';
					console.log("oneEvent: "+oneEvent);
					console.log(info);
					console.log(typeof info);
					console.log(info.event._def.title);
					console.log(info.event._def.publicId);
				}
			});
			calendar.render();
		});
		request.fail(function(jdXHR, textStatus){
			console.log(jdXHR);
			alert("Request failed: "+textStatus );
		});
		
		
		function viewModalOpen(info){
			
		    //if(현재로그인한사람/세션에서 아이디 가져오기 == null){
			//	alert();
			//	location.href='login.jsp';
			//}
		    //$('.viewEventModal').modal({backdrop: 'static'});
			$('.viewEventModal').modal("show");
			
		}
		$('.closeModal').click(function(){
			$('.viewEventModal').modal('hide');
		});
	});
});
</script>