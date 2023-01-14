<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">

<!-- BS4에서 긁어옴 -->
<h2>일정 입력폼</h2>
<h5>일정 종류를 먼저 고르게 한 후 이 폼(개인일정)을 띄워줘야 하지 않을까</h5>
\${message} : ${message}
<form action="/Schedule/write.kosmo" method="POST">
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
    <div class="form-check">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" disabled>Option 3
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>




	<div class="form-group">
		<label for="email">일정명:</label>
		<input type="email" class="form-control" placeholder="일정명을 입력하세요" name="sche_title">
	</div>
	<div class="form-group">
		<label for="pwd">일정내용:</label>
		<input type="password" class="form-control" placeholder="일정내용을 입력하세요" name="sche_content">
	</div>
	<div class="form-group">
		<label for="pwd">일정시작시각:</label>
		<input type="password" class="form-control" placeholder="일정시작시각을 입력하세요" name="sche_startdate">
	</div>
	<div class="form-group">
		<label for="pwd">일정마감시각:</label>
		<input type="password" class="form-control" placeholder="일정마감시각을 입력하세요" name="sche_enddate">
	</div>
	<div class="form-group">
		<label for="pwd">일정색깔:</label>
		<input type="password" class="form-control" placeholder="일정색깔을 입력하세요" name="sche_color">
	</div>
	<div class="form-group">
		<label for="pwd">일정종류:</label>
		<input type="password" class="form-control" placeholder="일정종류를 입력하세요" name="pswd">
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
