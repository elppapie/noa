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
<!-- BS4 validation? -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.fc-col-header-cell-cushion{
		text-decoration:none;
		color:black;
	}
	.fc-daygrid-day-number{
		text-decoration:none;
		color:black;
	}
	.sche_color{
		outline:none;
		border: none;
		width: 50px;
		height:50px;
		border-radius: 100px;
	}	
	input::placeholder { /*이거 왜 안 먹히지*/
 		color: black;
  		opacity: 1; /* Firefox */
	}
	.personInfo{
		margin-left:20px;
	}
	
	input[type=color] {
    	display: none;
	}
	#color_front{
		border-radius: 50%;
		width: 50px;
		height: 50px; 
		/*background-color:red;*/
		display:inline-block;
	}
	
	
	
</style>

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
      <%-- 
      <a href="#" id="addSchedule" class="btn  btn-primary text-white me-0 align-items-center"><i class="fa-solid fa-square-plus"></i> 일정추가</a>
    	--%>
      <a href="#" class="btn  btn-primary text-white me-0 align-items-center" id="addSchedule"><i class="fa-solid fa-square-plus"></i> 일정추가</a>
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
<div class="modal" id="viewEventModal">
  <div class="modal-dialog">
    <div class="modal-content">
	<form class="needs-validation" action="<c:url value='/Schedule/editOk.kosmo'/>" method='POST' novalidate>

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 style="font-weight:bold;">일정 조회/수정</h3>
        <span id="color_front"></span>
        <input class="sche_color" type="color" name="sche_color" id="sche_color"/>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body card-body">
		<!-- BS4에서 긁어옴 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정제목</span>
				</div>
				<input type="text" class="form-control" name="sche_title" id="sche_title" required>
    			<div class="invalid-feedback">일정명을 입력하세요</div>			
			</div>
			<div class="form-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정내용</span>
				</div>
				<textarea class="form-control" name="sche_content" id="sche_content" rows="5" style="height:70px;width:100%;" required></textarea>
    			<div class="invalid-feedback">일정내용을 입력하세요</div>			
			</div>
			<div class="form-group input-group">
				<div class="input-group-prepend">
				<div class="dropdown">
				    <input type="button" class="input-group-text text-dark dropdown-toggle" value="일정종류" data-toggle="dropdown" required/>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="#">개인일정</a>
				      <a class="dropdown-item" href="#">프로젝트</a>
				      <a class="dropdown-item" href="#">업무</a>
				      <a class="dropdown-item" href="#">연차</a>
				    </div>	
				</div>			
				</div>
				<input type="text" class="form-control" name="sche_type" id="sche_type" required>
    			<div class="invalid-feedback">일정종류를 선택하세요</div>			
			</div>			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">시작시간</span>
				</div>
				<input type="text" class="form-control" name="sche_startdate_d" id="sche_startdate_d" required>
				<input type="time" class="form-control" name="sche_startdate_t" id="sche_startdate_t" required>					
			</div>			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">마감시간</span>
				</div>
				<input type="text" class="form-control" name="sche_enddate_d" id="sche_enddate_d" required>
				<input type="time" class="form-control" name="sche_enddate_t" id="sche_enddate_t" required>    						
			</div>
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">참조인</span>
				</div>
				<div class="form-controll" id="ref-list">
				<!-- 여기에 참조인 정보 append -->
				</div>
			</div>

			<div class="form-group">
				<label for="selectDeptMember">참조인 변경</label> 
				<select class="form-control" id="selectDeptMember" name="memberList" multiple size="5" style="height: 100%;">
					<c:forEach var="member" items="${memberList}">
						<c:if test="${member['m_id'] != m_id}">
							<option value="${member['m_id']}">${member["m_name"]},
								팀번호:${member["team_no"]}, 직급:${member["position_name"]}, 아이디:${member["m_id"]}
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<input type="hidden" name="sche_status" id="sche_status"/>
			<input type="hidden" name="sche_no" id="sche_no"/>
			<input type="hidden" id="calendarList" name="calendarList" value="${calendarList}"/>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		<input type="submit" class="btn btn-primary" value="저장하기"/>
		<input type="submit" class="btn btn-primary" value="목록으로"/>
		<input type="button" class="btn btn-primary close closeModal" value="닫기" data-dismiss="modal">
      </div>

	</form>
    </div>
  </div>
</div>


<!-- The Modal -->
<div class="modal" id="writeEventModal">
  <div class="modal-dialog">
    <div class="modal-content">
	<form class="needs-validation" action="<c:url value='/Schedule/writeOk.kosmo'/>" method='POST' novalidate>
      <!-- Modal Header -->
      <div class="modal-header">
        <h3 style="font-weight:bold;">일정 등록</h3>
        <span id="color_front_write"></span>
        <input class="sche_color" type="color" name="sche_color" id="sche_color_write"/>
      </div>

      <!-- Modal body -->
      <div class="modal-body card-body">
	       modal body start
	       		<!-- BS4에서 긁어옴 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정제목</span>
				</div>
				<input type="text" class="form-control" placeholder="제목을 입력하세요" name="sche_title" id="sche_title_write" required>
    			<div class="invalid-feedback">일정명을 입력하세요</div>
			</div>
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정내용</span>
				</div>
				<textarea class="form-control" placeholder="내용을 입력하세요" name="sche_content" id="sche_content_write" rows="5" style="height:70px;width:100%;" required></textarea>
    			<div class="invalid-feedback">일정내용을 입력하세요</div>			
			</div>
			<div class="form-group input-group">
				<div class="input-group-prepend">
				<div class="dropdown">
				    <input type="button" class="input-group-text text-dark dropdown-toggle" value="일정종류" data-toggle="dropdown" required/>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="#">개인일정</a>
				      <a class="dropdown-item" href="#">프로젝트</a>
				      <a class="dropdown-item" href="#">업무</a>
				      <a class="dropdown-item" href="#">연차</a>
				    </div>	
				</div>			
				</div>
				<input type="text" class="form-control" placeholder="종류를 선택하세요" name="sche_type" id="sche_type_write" required>
    			<div class="invalid-feedback">일정종류를 선택하세요</div>			
			</div>			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">시작시간</span>
				</div>
				<input type="text" class="form-control" placeholder="시작시간을 선택하세요" name="sche_startdate_d" id="sche_startdate_d_write" required>
				<input type="time" class="form-control" name="sche_startdate_t" id="sche_startdate_t_write" required>					
			</div>			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">마감시간</span>
				</div>
				<input type="text" class="form-control" placeholder="마감시간을 선택하세요" name="sche_enddate_d" id="sche_enddate_d_write" required>
				<input type="time" class="form-control" name="sche_enddate_t" id="sche_enddate_t_write" required>    						
			</div>
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">참조인 선택</span>
				</div>
				<div class="form-controll" id="ref-list_write">
				<!-- 여기에 참조인 정보 append -->			
				</div>
			</div>

			<%-- 
			<div class="form-group">
				<label for="selectDeptMember">참조인 변경</label> 
				<select class="form-control" id="selectDeptMember" name="memberList" multiple size="5" style="height: 100%;">
					<c:forEach var="member" items="${memberList}">
						<c:if test="${member['m_id'] != m_id}">
							<option value="${member['m_id']}">${member["m_name"]},
								팀번호:${member["team_no"]}, 직급:${member["position_name"]}, 아이디:${member["m_id"]}
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			--%>
			<input type="hidden" name="sche_status" id="sche_status_write" value="0"/>
			<input type="hidden" id="calendarList" name="calendarList" value="${calendarList}"/>
	       modal body end
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
		<input type="submit" class="btn btn-primary" id="" value="저장하기"/>
		<input type="button" class="btn btn-primary close closeModal" value="닫기" data-dismiss="modal">   
      </div>
      
      </form>

    </div>
  </div>
</div>
<!-- modal 끝 -->

<script>
document.addEventListener('DOMContentLoaded', function() {

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
				eventClick:function(info){
					//링크 안 뜨게끔 하기
					//info.jsEvent.preventDefault();
					
					    //url:"<c:url value='/Schedule/oneEvent.kosmo'/>",
					$.ajax({
					    url: "<c:url value='/Schedule/oneEvent.kosmo?sche_no="+info.event._def.publicId+"'/>",
					    type:'POST',
					    contentType:'application/json',
					    dataType:'json'
					})
					.done(function(data){
						$('#viewEventModal').modal('show');
						//$('#viewEventModal').modal({backdrop: 'static', keyboard: false}, 'show');
						//$('.viewEventModal').show();
						//viewModalOpen(info);
						$('#sche_no').val(info.event._def.publicId);
						$('#sche_title').val(info.event._def.title);
						$('#sche_content').val(data['sche_content']);
						$('#sche_startdate_d').val(data['sche_startdate'].split(" ")[0]).attr("placeholder",data['sche_startdate'].split(" ")[0]);
						$('#sche_startdate_t').val(data['sche_startdate'].split(" ")[1]);
						$('#sche_enddate_d').val(data['sche_enddate'].split(" ")[0]).attr("placeholder",data['sche_enddate'].split(" ")[0]);
						$('#sche_enddate_t').val(data['sche_enddate'].split(" ")[1]);
						$('#sche_color').val(data['sche_color']).css('background-color',data['sche_color']);
							$("#color_front").css('background-color',data['sche_color']);
						$('#sche_status').val(data['sche_status']);
						$('#sche_type').val(data['sche_type']);
						//console.log("ref-list 출력:"+data['ref-list']);
						var people='';
						
						for(var person of data['ref-list']){
							var personInfo;
							personInfo ='<h6 class="personInfo" name="ref-list">'+person['dept_name']+' '+person['team_name']+' '+person['m_name']+' '+person['position_name']+'<h6/>'
							$('#ref-list').append(personInfo);
							//console.log("안녕 나는 "+person['m_name']+"야");
							people= people+personInfo;
						}
						//console.log("people"+people);
						//$('#sche_ref').val(data['sche_ref']);
					});
					
				}
				
			});
			calendar.render();
		});
		request.fail(function(jdXHR, textStatus){
			console.log(jdXHR);
			alert("Request failed: "+textStatus );
		});
		
		
		$('.closeModal').click(function(){
			$('#viewEventModal').modal('hide');
		});
		
		
		$('#sche_startdate_d').datepicker({
			format: "yyyy-mm-dd"
		});
		$('#sche_enddate_d').datepicker({
			format: "yyyy-mm-dd"
		});
		
		// 색상 전달하는 input 둥글게 못 바꿔서 쓰는 편법: span 으로 표시하기
		// 단점: 
		// 색상 팔레트가 화면 왼쪽 상단에 뜬다
		// 처음 떴을 때 background-color 설정이 안됨 
		$("#sche_color").change(function(event) {
		    console.log($(this).val());
		    $("#color_front").css('background-color',$(this).val());
		});

		$("#color_front").click(function(event) {
		    $("#sche_color").click();
		});
		$("#viewEventModal").on('hide.bs.modal', function(){
			alert('모달 닫기 전에 참조인 목록을 지웁니다');
			$('#ref-list').empty();
		});
		
	});
	
	//일정 추가
	$(function(){
		//BS4 제공 빈칸 validation
		(function() {
			'use strict';
			window.addEventListener('load', function() {
				// Get the forms we want to add validation styles to
				var forms = document.getElementsByClassName('needs-validation');
				// Loop over them and prevent submission
				var validation = Array.prototype.filter.call(forms, function(form) {
					form.addEventListener('submit', function(event) {
						if (form.checkValidity() === false) {
						  event.preventDefault();
						  event.stopPropagation();
						}
						form.classList.add('was-validated');
					}, false);
				});
			}, false);
		})();//validation 익명함수
		
		
		//일정 추가버튼으로 모달 띄우기
		$('#addSchedule').click(function(event){
			$('#writeEventModal').modal('show');
			//구성원 목록을 모달에 띄워줘야 사용자가 선택가능
			$.ajax({
				//나중엔 여기로 로그인한 사람의 정보 넘겨주고 정보 받아와야 함
				//현재는 Controller에다가 kim1234를 하드코딩함
				//원래는 jsp 딴에서 hidden으로 넘겨줘야 하는데 (씨큐리티랑 연결)
				url: '<c:url value="/Schedule/getMember.kosmo"/>',
				method: "post",
				dataType: "json"
			})
			.done(function(data){
				//alert('우와 JSON으로 받아오기 성공'+data);
				//console.log("현재 회사 다니는 사람들 목록: "+data);
				//console.log("목록의 데이터 종류: "+(typeof data));
				data.forEach(function(item,index){
					//왜 0번방에 아무도 안 들어가있지..?
					//일단은 index != 0 조건 설정해서 for문 돌림
					if(index != 0){	
						//console.log(index+"번 아이디는"+item.m_id);
						//console.log(index+"번 이름은"+item.m_name);
						//console.log("append성공한건가");
					////////////////////////////////////////////// 이 부분에 에러가 있다... data.forEach 고침... item.index로 넣었었음. 걍 위에꺼랑 합침	
						var personInfo = item.dept_name+' '+item.team_name+' '+item.m_name+' '+item.position_name;
						//console.log(personInfo);
						//$('#ref-list_write').append('<c:forEach var="member" items="${memberList}"></c:forEach>');
						$('#ref-list_write').append(
								'<div class="form-check">'+
								'<label class="form-check-label" for="check'+index+'">'+
								'<input type="checkbox" class="form-check-input" id="check'+index+'" name="memberList" value="'+item.m_id+'"/>'
								+personInfo+
								'</label>'+
								'</div>'
						);
					///////////////////////////////////////////////////////////////////////////////////////////////////////
					}////if
				});

			})
			.fail(function(req,status,error){
				//console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',req.status,req.responseText,error,status);
				alert('응답코드:'+req.status+',에러메시지:'+req.responseText+',error:'+error+',status:'+status);
			});
			
			
			
			
			
		});
		//닫기버튼 클릭시 모달 닫기
		$('.closeModal').click(function(){
			$('#viewEventModal').modal('hide');
		});
		
		//datepicker 구현
		$('#sche_startdate_d_write').datepicker({
			format: "yyyy-mm-dd"
		});
		$('#sche_enddate_d_write').datepicker({
			format: "yyyy-mm-dd"
		});
		
		// 색상 전달하는 input 둥글게 못 바꿔서 쓰는 편법: span 으로 표시하기
		// 단점: 
		// <1> 색상 팔레트가 화면 왼쪽 상단에 뜬다
		// <2> 처음 떴을 때 background-color 설정이 안됨
		$("#sche_color_write").change(function(event) {
		    console.log($(this).val());
		    $("#color_front_write").css('background-color',$(this).val());
		});

		$("#color_front_write").click(function(event) {
		    $("#sche_color_write").click();
		});
		//디폴트 일정색은 yellow로 일단설정(white는 너무 안 보임..)
		$("#color_front_write").css('background-color','#F95F53');
		
		
		//모달 닫히기 전 참조인 목록 제거
		$("#writeEventModal").on('hide.bs.modal', function(){
			alert('모달 닫기 전에 참조인 목록을 지웁니다');
			$('#ref-list_write').empty();
		});
		
		
		
		
		

		
		
		
	});
	
});
</script>
