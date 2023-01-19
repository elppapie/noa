<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- timepicker 관련 cdn  -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<c:set var="dept" value="${map으로저장한이름.dept_code}"/>
<c:set var="team" value="${map으로저장한이름.team_no}"/>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">

		<!-- BS4에서 긁어옴 -->
		<h2>부서 입력폼</h2>
		<h5>일정 종류를 먼저 고르게 한 후 이 폼(개인일정)을 띄워줘야 하지 않을까</h5>
		\${message} : ${message}
		<form class="needs-validated" action="/Schedule/writeOk.kosmo" method="POST">
		  	<p>일정 종류 선택 - 선택시 관련 폼이 아래에 뜨도록 하기 - choose / when 태그로? 자스 변수 설정? </p>
		  	
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
		
			<c:if test="${dept not null}">
				<div class="form-group">
					<label for="sche_title">부서명:</label>
					<input type="text" class="form-control" placeholder="일정명을 입력하세요" name="sche_title" id="sche_title">
					<div class="valid-feedback">Valid.</div>
	    			<div class="invalid-feedback">Please fill out this field.</div>			
				</div>
				<div class="form-group">
					<label for="sel1">부서책임자:</label>
					<select class="form-control" id="sel1">
						<c:forEach var="" items="${team}">
							<option></option>
						</c:forEach>
					</select>
				</div>
			
			
			
			</c:if>
			<div class="form-group">
				<label for="sche_content">부서책임자:</label>
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
				<input type="text" class="form-control" placeholder="일정색깔을 입력하세요" name="sche_color" id="sche_color">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		
			<div class="form-group form-check">
				<label class="form-check-label">
					<input class="form-check-input" type="checkbox" name="remember"> Remember me
				</label>
			</div>
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
