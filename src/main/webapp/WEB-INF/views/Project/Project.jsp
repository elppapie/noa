<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		<!-- 여기서 EL로 찍어보면!!! -->
		<%Map map = new HashMap<>(); %>
		<form class="form-inline" method="POST" action="<c:url value='/Task/list.kosmo'/>"> 
			<input type="text" name="loginId" class="form-control mx-2"/> 
			<input type="text" name="set_startdate" class="form-control mx-2"  />
			<input type="text" name="set_enddate" class="form-control mx-2"  />
			<input type="text" name="searchColumn" class="form-control mx-2" />
			<input type="text" name="searchWord" class="form-control mx-2" /> 
			
			<input type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
		1.${selectTaskList}
		2.${selectTaskList.lists}
		
	1: ${selectListReport.lists}
	2: ${selectListReport.map}
	3: ${selectListReport[lists]}

	<!-- 2: ${selectOneProject.PROJECTloginId_NAME} -->
			<input type="text" name="set_startdate" class="form-control mx-2"  />
			<input type="text" name="set_enddate" class="form-control mx-2"  />
			<input type="text" name="searchColumn" class="form-control mx-2" value="" />
			<input type="text" name="searchWord" class="form-control mx-2" value="" /> 
			<input type="text" name="report_name" class="form-control mx-2"  />
			<input type="text" name="report_comment" class="form-control mx-2"  />
			<input type="text" name="report_startdate" class="form-control mx-2"  />
			<input type="text" name="report_enddate" class="form-control mx-2"  />
			<input type="text" name="report_commet" class="form-control mx-2"  />
			<input type="text" name="report_startdate" class="form-control mx-2"  />
			<input type="text" name="report_enddate" class="form-control mx-2"  />
			
			<input type="text" name="task_no" class="form-control mx-2" value="" /> 
			
			
			<input type="text" name="task_name" class="form-control mx-2" value="" />
			<input type="text" name="task_content" class="form-control mx-2" value="" />
			<input type="text" name="task_category" class="form-control mx-2" value="" /> 
	
	
		<form action="<c:url value='/Report/mlist.kosmo'/>" method="post">
			
			<div class="form-group">
				<label><kbd class="lead">멤버 선택</kbd></label>
				<input type="text" name="report_no" class="form-control mx-2" value="" />
				<div class="d-flex">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="member"
							value="kim1234@samsung.com" id="member1"> <label class="custom-control-label"
							for="POL">kim1234@samsung.com</label>
					</div>
					<div class="custom-control custom-checkbox mx-2">
						<input type="checkbox" class="custom-control-input" name="member"
							value="park1234@samsung.com" id="member2"> <label class="custom-control-label"
							>park1234@samsung.com</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="member"
							value="song1234@samsung.com" id="member3"> <label class="custom-control-label"
							>song1234@samsung.com</label>
					</div>
					<div class="custom-control custom-checkbox ml-2">
						<input type="checkbox" class="custom-control-input" name="member"
							value="hong1234@samsung.com" id="member4"> <label class="custom-control-label"
							>hong1234@samsung.com</label>
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
		</form>
		1. ${reportMember}
	</div>
</div>

kim1234@samsung.com
hong1234@samsung.com
song1234@samsung.com
song1234@lge.com
park1234@samsung.com
na1234@samsung.com
