<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="deptList" value="${organization.getDeptList()}"/>
<c:set var="teamList" value="${organization.getTeamList()}"/>
<c:set var="memberList" value="${organization.getTeamMembersList()}"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- timepicker 관련 cdn  -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>



<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">

		<!-- BS4에서 긁어옴 -->
		<form class="needs-validated" action="<c:url value='/Admin/enroll.kosmo'/>" method="POST">
			<c:choose >
				<c:when test="${fn:contains(enroll,'dept')}">
				  	<h2>부서 입력폼</h2>
					부서입니다
					<div class="form-group">
						<label for="sche_title">부서명:</label>
						<input type="text" class="form-control" placeholder="부서명을 입력하세요" name="dept_name">
						<div class="valid-feedback">Valid.</div>
		    			<div class="invalid-feedback">Please fill out this field.</div>			
					</div>
					<div class="form-group">
						<label for="selectDeptMember">부서인원 구성하기:</label>
						<select class="form-control" id="selectDeptMember" name="memberList" multiple size="10" style="height:100%;">
							<c:forEach var="member" items="${memberList}">
								<option value="${member['m_id']}">${member["m_name"]}, 팀번호:${member["team_no"]}, 직급:${member["position_name"]}<br/>아이디:${member["m_id"]}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="sel1">부서책임자 선택하기:</label>
						<select class="form-control" id="sel1" name="m_dept_leader">
							<c:forEach var="member" items="${memberList}">
								<option value="${member['m_id']}">${member["m_name"]}, 팀번호:${member["team_no"]}, 직급:${member["position_name"]}<br/>아이디:${member["m_id"]}</option>
							</c:forEach>
						</select>
					</div>
					<%-- 기업 코드는 로그인한 사람의 아이디를 항시 얻어올 수 있기 때문에 딱히... 그래도... --%>
				</c:when>
				<c:when test="${fn:contains(enroll,'team')}">
				  	<h2>팀 입력폼</h2>					
					팀입니다용
					<div class="form-group">
						<label for="sche_title">팀명:</label>
						<input type="text" class="form-control" placeholder="팀명을 입력하세요" name="team_name">
						<div class="valid-feedback">Valid.</div>
		    			<div class="invalid-feedback">Please fill out this field.</div>			
					</div>
					<div class="form-group">
						<label for="selectTeamMember">팀인원 구성하기:</label>
						<select class="form-control" id="selectTeamMember" name="memberList" multiple size="10" style="height:100%;">
							<c:forEach var="member" items="${memberList}">
								<%-- c:if test="member['']">--%>
								<option value="${member['m_id']}">${member["m_name"]}, 팀번호:${member["team_no"]}, 직급:${member["position_name"]}, 아이디:${member["m_id"]}</option>
								<%-- </c:if>--%>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="sel2">팀책임자 선택하기:</label>
						<select class="form-control" id="sel2" name="m_team_leader">
							<c:forEach var="member" items="${memberList}">
								<option value="${member['m_id']}">${member["m_name"]}, 팀번호:${member["team_no"]}, 직급:${member["position_name"]}, 아이디:${member["m_id"]}</option>
							</c:forEach>
						</select>
					</div>				
				</c:when>
				<c:when test="${fn:contains(enroll,'member')}">
					멤버입니다용
					// 멤버는... 이런식으로 말고 초대하기로 링크 보내거나 해야할 듯
					// 그럼 링크 타고 신청하기 한 사람의 신청목록을 뿌려줘야 할 듯!
					<h3>구성원 추가(신청목록)</h3>
				</c:when>
				<c:otherwise>
				
				
				</c:otherwise>			
			</c:choose>
			<input type="hidden" name="enroll" value="${enroll}"/>
			<input type="hidden" name="emp_code" value="${emp_code}"/>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>
</div>
<script>
	<%--자스로 빈내용 제출안되게 하기--%>

	$(document).ready(function(){
	    	$( "#sche_startdate" ).datepicker({ format: 'yyyy-mm-dd' });
	    	$( "#sche_enddate" ).datepicker({ format: 'yyyy-mm-dd' });
	    	$( "#sche_startdate_t" ).timepicker({ 
	    	    timeFormat: 'HH:mm:ss',
	    	    interval: 30,
	    	    minTime: '0',
	    	    maxTime: '23:00pm',
	    	    defaultTime: 'now',
	    	    startTime: '10:00',
	    	    dynamic: false,
	    	    dropdown: true,
	    	    scrollbar: true
	    	});
	    	$( "#sche_enddate_t" ).timepicker({ 
	    	    timeFormat: 'HH:mm:ss',
	    	    interval: 30,
	    	    minTime: '0',
	    	    maxTime: '23:00pm',
	    	    defaultTime: 'now',
	    	    startTime: '10:00',
	    	    dynamic: false,
	    	    dropdown: true,
	    	    scrollbar: true
	    	});
	  });
	  
/*
	// Disable form submissions if there are invalid fields
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
	})();
*/
	$(document).ready(function(){
		$('button').click(function(){
			var selectDeptMember = $('#selectDeptMember').val();
			var selectTeamMember = $('#selectTeamMember').val();
			console.log(typeof selectTeamMember);
			console.log(typeof selectDeptMember);
			console.log('콘솔창에 찍는다');
		})
		
		
		
		$.ajax({
			url: "<c:url value='/Admin/enroll.kosmo'/>"
			type: "POST",
			data: {
				arr: 
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8;"
		})
		
	});



</script>
