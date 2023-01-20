<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- timepicker 관련 cdn  -->
<link rel='stylesheet' type='text/css'href='./css/timepicki.css'/>
<script type='text/javascript'src='./js/jquery.min.js'></script>
<script type='text/javascript'src='./js/timepicki.js'></script>

<c:set var="one" value="${oneSchedule}"/>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
	    <div class="card">
        <div class="card-body">
        <h2 style="font-weight:bold;">일정 조회/수정</h2><br/>
		<!-- BS4에서 긁어옴 -->
		<form class="needs-validated" action="<c:url value='/Schedule/editOk.kosmo'/>" method='POST'>
		  	<p>일정 종류 선택</p>
		  	<%-- \${one['SCHE_NO']} : ${one['SCHE_NO']}--%>
		  	
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
					<span class="input-group-text text-dark">일정시작날짜:</span>
				</div>
				<label for="sche_startdate_d"></label>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_STARTDATE'],' ')[0]}" name="sche_startdate_d" id="sche_startdate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정시작시간:</span>
				</div>
				<label for="sche_startdate_t"></label>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_STARTDATE'],' ')[1]}" name="sche_startdate_t" id="sche_startdate_t">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정마감날짜:</span>
				</div>
				<label for="sche_enddate_d"></label>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_ENDDATE'],' ')[0]}" name="sche_enddate_d" id="sche_enddate_d">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
				<div class="input-group-prepend">
					<span class="input-group-text text-dark">일정마감시간:</span>
				</div>
				<label for="sche_enddate_t"></label>
				<input type="text" class="form-control" value="${fn:split(one['SCHE_ENDDATE'],' ')[1]}" name="sche_enddate_t" id="timepicker">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>	    						
			</div>
			
			<div class="form-group">
				<label for="sche_color">일정색깔:</label>
				<input type="text" class="form-control timepicker" value="${one['SCHE_COLOR']}" name="sche_color" id="sche_color">
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			
			<div class="form-group">
				<label for="sche_color">일정상태:</label>
				<input type="text" class="form-control timepicker" value="${one['SCHE_STATUS']}" name="sche_status" id="sche_status">
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
			<input type="hidden" name="sche_no" value="${one['SCHE_NO']}"/>
			<button type="submit" class="btn btn-primary" >Submit</button>
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

	    	$('#timepicker').timepicki();
	    	//$( "#sche_enddate_t" ).timepicker({});
	    	/*
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
	    	*/
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
