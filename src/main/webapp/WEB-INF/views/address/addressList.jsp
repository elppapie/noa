<%@page import="com.nodearchive.springapp.service.impl.OrganizationDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Node Archive </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${path}/resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="${path}/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${path}/resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${path}/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${path}/resources/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path}/resources/css/vertical-layout-light/style.css">
  <!-- custom style -->
  <link rel="stylesheet" href="${path}/resources/css/noaCss.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path}/resources/images/logo-noa-messanger.png" />
  <!-- font-awesome Kit Code -->
  <script src="https://kit.fontawesome.com/672ea2e509.js" crossorigin="anonymous"></script>
  <!-- bootstrap 4 cdn -->
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">   -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--  Custom CSS   -->

<style>
.addr-list-scroll-x-auto{
	overflow-x:auto;
}
.addr-list-scroll-y-auto{
	overflow-y:auto;
}
.addr-list-checkbox-td-padding-right-0{
	padding-right:0px !important;
}
#addr-list-org-my-emp-name{
	font-weight:bold !important;
	margin-bottom:5px;
}
#addr-list-org-my-emp-name:hover{
	background-color: #c1c1c1;
	cursor:pointer !important;
}
.addr-list-card-body-custom-height{
	height:550px !important;
}
.addr-list-tab-one{
	padding-left:15px;
}
.addr-list-tab-two{
	padding-left:25px;
}
.addr-list-tab-two a , .addr-list-tab-one a {
	text-decoration:none;
	color: #b1b1b1;
}
.addr-list-tab-two li , .addr-list-tab-one li {
	margin-top:3px;
	margin-bottom:3px;
}
</style>
</head>
<body>
<div class="container-scroller"> 
<div class="content-wrapper">
<div class="d-sm-flex align-items-center justify-content-between border-bottom">
  <ul class="nav nav-tabs aligh-items-center" role="tablist">
    <li class="nav-item align-items-baseline">
<!--  
<div class="form-check">
 <label class="form-check-label">
  <input type="checkbox" class="form-check-input"/>전체 선택
 </label>
 <i class="input-helper"></i>
</div>
-->
    </li>
    <li class="nav-item d-flex align-items-baseline">
      <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#" role="tab"><i class="fa fa-color-gray fa-light fa-envelope"></i> 메일 </a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#" role="tab"><i class="fa fa-color-gray fa-light fa-comment"></i> 메신저 </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#" role="tab"><i class="fa fa-color-gray fa-light fa-share-nodes"></i> 공유 </a>
    </li>
  </ul>
  <div class="form-group" style="margin:0px;float:right;">
	<div class="input-group">
		<input type="text" class="form-control" placeholder="구성원 검색" id="top-input-search-members"/>
		<div class="input-group-append d-flex justify-content-center align-items-center top-btn-search-members-append" onclick="openSearchOrg('${path}/Address/allListNoPaging.kosmo?','${param.m_id}')">
			<button type="button" class="btn btn-rounded top-btn-search-members">
				<i class="ti-search"></i>
		</button>
		</div>
	</div>
  </div>
  <div class="btn-wrapper">
    <a href="#" class="btn btn-otline-dark align-items-center"><i class="fa fa-light fa-filter"></i> 정렬</a>
  </div>
</div> 

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
<div class="row">
	<div class="col-sm-4">
		<div class="card card-rounded">
			<div class="card-body addr-list-overflow-y-auto addr-list-card-body-custom-height">
			<h4 class="card-title card-title-dash border-bottom pb-2 mb-2"><i class="fa fa-light fa-address-book"></i> 조직도</h4>
			<div id="addr-list-org-my-emp-name" onclick="openSearchOrg('${path}/Address/allListNoPaging.kosmo?','${param.m_id}')"><i class="fa fa-solid fa-building-user"></i> ${myInfo['emp_name']}</div>
			<ul class="list-unstyled addr-list-tab-one" >
			  <c:set value="${requestScope.org}" var="org" scope="page"/>
			  <c:forEach items="${requestScope.org.deptList}" var="depts">
				<li>
				  <a data-bs-toggle="collapse" href="#${depts['dept_code']}"><i class="fa fa-solid fa-user-group"></i> ${depts['dept_name']}</a>
					<div class="collapse" id="${depts['dept_code']}">
						<ul class="list-unstyled addr-list-tab-two">
						  <%
						  Map deptss=(Map)pageContext.getAttribute("depts");
						  //String dept_code = deptss.get("dept_code").toString();
						  List teamList = ((OrganizationDTO)pageContext.getAttribute("org")).getTeamListByDept().get(deptss.get("dept_code").toString());
						  pageContext.setAttribute("team", teamList);
						  %>
						  <c:forEach var="teams" items="${pageScope.team}">	
							<li>
								<a href="${teams['team_no']}">
									${teams['team_name']} - ${teams['team_leader_name']}
								</a>
							</li>
						  </c:forEach>
						</ul>
					</div>
				</li>
			  </c:forEach>	
			</ul>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="card card-rounded">
			<div class="card-body addr-list-card-body-custom-height" id="addr-list-card-body-memberlist-card">
				<div class="table-reponsive addr-list-scroll-x-auto">
                  <table class="table table-stripped table-hover">
                    <thead>
                      <tr>
                        <th class="addr-list-checkbox-td-padding-right-0">
                        	<input type="checkbox"/>  
                        </th>
                        <th> 프로필 </th>
                        <th> 이름 </th>
                        <th> 소속 팀 </th>
                        <th> 개인 연락처 </th>
                      </tr>
                    </thead>
                    <tbody>
                      
                      <!-- 여기서 forEach반복 -->
                      <c:forEach items="${membersList}" var="member">
	                      <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
	                      <tr>
	                      	<td class="addr-list-checkbox-td-padding-right-0">
	                      		<input type="checkbox"/>
	                      	</td>
	                        <td class="py-1"> <img src="${path}/resources/images/logo-noa-messanger.png" alt="프로필사진"/> </td>
	                        <td> ${member['m_name']} </td>
	                        <td> ${member['team_name']} </td>
	                        <td> ${fn:substring(member['m_private_contact'],0,3)}-${fn:substring(member['m_private_contact'],3,7)}-${fn:substring(member['m_private_contact'],7,11)} </td>
	                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>		

			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
<!-- plugins:js -->
  <script src="${path}/resources/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${path}/resources/vendors/chart.js/Chart.min.js"></script>
  <script src="${path}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="${path}/resources/vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${path}/resources/js/off-canvas.js"></script>
  <script src="${path}/resources/js/hoverable-collapse.js"></script>
  <script src="${path}/resources/js/template.js"></script>
  <script src="${path}/resources/js/settings.js"></script>
  <script src="${path}/resources/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${path}/resources/js/dashboard.js"></script>
  <script src="${path}/resources/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
  <script src="${path}/resources/js/noaJS.js"></script>
  <script src="${path}/chatResources/js/noaChatJS.js"></script>
  <script>
	  
	  const addrMemberListCardBody = document.querySelector("#addr-list-card-body-memberlist-card");
	   
  </script>
</body>

<!-- body END -->