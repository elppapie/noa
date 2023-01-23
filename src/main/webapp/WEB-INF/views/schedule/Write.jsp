<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="memberList" value="${organization.getTeamMembersList()}" />

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
	    <div class="card">
        <div class="card-body">
        <h2 style="font-weight:bold;">일정 입력</h2><br/>
		<!-- BS4에서 긁어옴 -->
		<%--<h5> 일정 종류를 먼저 고르게 한 후 이 폼(개인일정)을 띄워줘야 하지 않을까</h5>
		\${message} : ${message}--%>
		<form class="needs-validated" action="<c:url value='/Schedule/writeOk.kosmo'/>" method="POST">
		  	<p>일정 종류 선택 </p>
		  	<%-- - 선택시 관련 폼이 아래에 뜨도록 하기 - choose / when 태그로? 자스 변수 설정? --%>
		    <div class="form-check">
		      <label class="form-check-label" for="radio5">
		        <input type="radio" class="form-check-input" id="radio5" name="sche_type" value="PERSONAL" checked>개인일정
		      </label>
		    </div>
		    <div class="form-check">
		      <label class="form-check-label" for="radio1">
		        <input type="radio" class="form-check-input" id="radio1" name="sche_type" value="PROJECT">프로젝트
		      </label>
		    </div>
		    <div class="form-check">
		      <label class="form-check-label" for="radio2">
		        <input type="radio" class="form-check-input" id="radio2" name="sche_type" value="TASK">업무
		      </label>
		    </div>
		    <div class="form-check">
		      <label class="form-check-label" for="radio3">
		        <input type="radio" class="form-check-input" id="radio3" name="sche_type" value="MRR">회의실예약
		      </label>
		    </div>
		    <div class="form-check">
		      <label class="form-check-label" for="radio4">
		        <input type="radio" class="form-check-input" id="radio4" name="sche_type" value="AUL">근태
		      </label>
		    </div>
		
			<br/>
			<div class="form-group">
				<label for="sche_title">일정명:</label>
				<input type="text" class="form-control" placeholder="일정명을 입력하세요" name="sche_title" id="sche_title">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>			
			</div>
			<div class="form-group">
				<label for="sche_content">일정내용:</label>
				<input type="text" class="form-control" placeholder="일정내용을 입력하세요" name="sche_content" id="sche_content">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>			
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정시작날짜:</span>
				</div>
				<label for="sche_startdate_d"></label>
				<input type="text" class="form-control" placeholder="일정시작날짜를 고르세요" name="sche_startdate_d" id="sche_startdate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정시작시간:</span>
				</div>
				<label for="sche_startdate_t"></label>
				<input type="text" class="form-control" placeholder="일정시작시간을 고르세요" name="sche_startdate_t" id="sche_startdate_t">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정마감날짜:</span>
				</div>
				<label for="sche_enddate_d"></label>
				<input type="text" class="form-control" placeholder="일정마감날짜를 고르세요" name="sche_enddate_d" id="sche_enddate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정마감시간:</span>
				</div>
				<label for="sche_enddate_t"></label>
				<input type="text" class="form-control" placeholder="일정마감시간을 고르세요" name="sche_enddate_t" id="sche_enddate_t">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group">
				<label for="sche_color">일정색깔:</label>
				<select class="form-control" id="sche_color" name="sche_color">
					<option value="#3944BC">파란색</option>
					<option value="#f5f5f5">흰색</option>
					
				</select>
			</div>
<%-- 					
					<input type="text" class="form-control" placeholder="일정색깔을 입력하세요" name="sche_color" id="sche_color">
					<div class="valid-feedback">Valid.</div>
	    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
--%>						
			
			
			<p>일정 상태 선택</p>
			<div class="form-group">
				<div class="form-check">
			      <label class="form-check-label" for="radio12">
			        <input type="radio" class="form-check-input" id="radio12" name="sche_status" value="0">미완료
			      </label>
			    </div>
			    <div class="form-check">
			      <label class="form-check-label" for="radio13">
			        <input type="radio" class="form-check-input" id="radio13" name="sche_status" value="1">완료
			      </label>
			    </div>
			</div>
			<div class="form-group">
				<label for="selectDeptMember">참조인 추가:</label> 
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
			
			
			<%-- input type="hidden" name="sche_status" value="0"/>--%>
			<%-- 
			<div class="form-group form-check">
				<label class="form-check-label">
					<input class="form-check-input" type="checkbox" name="remember"> Remember me
				</label>
			</div>
			--%>
			<input type="hidden" name="m_id" value="song1234@samsung.com"/>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		</div>
		</div>


	</div>
</div>
<script>
	<%--자스로 빈내용 제출안되게 하기--%>

	$(document).ready(function(){
	    	$( "#sche_startdate_d" ).datepicker({ format: 'yyyy-mm-dd' });
	    	$( "#sche_enddate_d" ).datepicker({ format: 'yyyy-mm-dd' });
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


</script>
