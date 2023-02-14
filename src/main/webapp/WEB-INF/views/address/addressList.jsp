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
.p15{
	padding:15px;
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
	padding-left:10px;
}
.addr-list-tab-two{
	padding-left:18px;
}
.addr-list-tab-two a , .addr-list-tab-one a {
	text-decoration:none;
	color: #b1b1b1;
}
.addr-list-emp-nameAZDL{
	text-decoration:none;
	color: #1f1f1f;
}
.addr-list-emp-nameAZDL:hover{
	text-decoration:none;
	color: #1f1f1f;
}
.addr-list-tab-two li , .addr-list-tab-one li {
	margin-top:3px;
	margin-bottom:3px;
}
.addr-list-no-member-exits > h2{
	text-align:center;
	height:60px;
	line-height:60px !important;
	font-size:1.2rem !important;
	color: #c1c1c1 !important;
}
.input-helper::before{
	border: 2px solid #304839 !important;
	border-radius: 5px !important;
}
.input-helper::after{
	background-color: #324a3b !important;
	border-radius: 5px !important;
}
.profile-img-box-shadowing{
  box-shadow: rgba(136, 165, 191, 0.48) 6px 2px 16px 0px, rgba(255, 255, 255, 0.8) -6px -2px 16px 0px;
  border-radius: 50px;
  margin-right: 10px;
  width: 100px; 
  height: 100px;
}
.member-title{
  color: #c1c1c1;
  font-size: smaller;
  padding: 0px 8px;
  border-right: 1.8px solid #c1c1c1;
  margin-right: 8px;
}
.member-title-no-divider{
  color: #c1c1c1;
  font-size: smaller;
}
.member-content{
  font-weight: bolder;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<div class="container-scroller"> 
<div class="content-wrapper" style="height:680px;padding-top:10px;">
<div class="d-sm-flex align-items-center justify-content-between border-bottom">
  <ul class="nav nav-tabs aligh-items-center" role="tablist">
    <li class="nav-item">
      <a class="nav-link" href="#" ><i class="fa fa-color-gray fa-light fa-envelope"></i> 메일 </a>
    </li>
    <li class="nav-item addr-list-messanger-border-top-custom">
      <a class="nav-link border-0" href="#" ><i class="fa fa-color-gray fa-light fa-comment"></i> 메신저 </a>
    </li>
    <li class="nav-item">
      <a class="nav-link"  href="#" ><i class="fa fa-color-gray fa-light fa-share-nodes"></i> 공유 </a>
    </li>
  </ul>
  <div class="form-group member-search0914-box-shadow" style="margin:0px;float:right;">
	<div class="input-group">
		<input class='navbar-member-search-input0914' type="text" class="form-control" placeholder="구성원 검색" id="top-input-search-members" value="${param.searchWord}"/>
		<div class="input-group-append d-flex justify-content-center align-items-center top-btn-search-members-append" onclick="openSearchOrg('${path}/Address/allListNoPaging.kosmo?','${param.m_id}')">
			<button type="button" class="btn btn-rounded top-btn-search-members">
				<i class="ti-search"></i>
		</button>
		</div>
	</div>
  </div>
</div> 

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
<div class="row">
	<div class="col-sm-3">
		<div class="card card-rounded">
			<div class="card-body addr-list-overflow-y-auto addr-list-card-body-custom-height">
			<h4 class="card-title card-title-dash border-bottom pb-2 mb-2"><i class="fa fa-light fa-address-book"></i> 조직도</h4>
			<div id="addr-list-org-my-emp-name" ><i class="fa fa-solid fa-building-user"></i> 
			<!-- onclick="openSearchOrg('${path}/Address/allListNoPaging.kosmo?','${param.m_id}',true)" -->
				<a href="<c:url value='/Address/allListNoPaging.kosmo'/>" class="addr-list-emp-nameAZDL">${myInfo['emp_name']}</a>
			</div>
			<ul class="list-unstyled addr-list-tab-one" id='addr-list-teams-check-ajax'>
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
								<a href="${teams['team_no']}" class="addr-list-team-no-onclick-ajax">
									└ ${teams['team_name']}
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
	<div class="col-sm-9">
		<div class="card card-rounded">
			<div class="card-body addr-list-card-body-custom-height toggle-member-list-show-hidden" id="addr-list-card-body-memberlist-card">
				<div class="table-reponsive overflow-y-scroll custom-scrollbar" style='height:506px; padding-right:8px;padding-top:50px;overflow-x:hidden;'>
                  <table class="table table-stripped table-hover ">
                    <thead class="table-thead-sticky">
                      <tr style="border-bottom:none;">
                        
                        <th class="addr-list-checkbox-td-padding-right-0" style="border-bottom:none;">
                        	<div class="form-check m-0" style="width:20px">
	                        	<label class="form-check-label">
	                        		<input type="checkbox" class="btn-check-all-onoff form-check-input"/>
	                        		<i class="input-helper"></i>
	                        	</label>  
                        	</div>
                        </th>
                        
                        <th style="border-bottom:none;padding-left:35px;"> 프로필 </th>
                        <th style="border-bottom:none;padding-left:40px;"> 이름 </th>
                        <th style="border-bottom:none;padding-left:25px;"> 소속 팀 </th>
                        <th style="padding-left:25px;border-bottom:none;"> 직급 </th>
                        <th style="padding-left:25px;border-bottom:none;"> 개인 연락처 </th>
                      </tr>
                    </thead>
                    <tbody id='addr-list-members-tbody-forcheckbox'>
                      
                      <!-- 여기서 forEach반복 -->
                      <c:forEach items="${membersList}" var="member">
	                      <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
	                      <tr>
	                      	
	                      	<td class="addr-list-checkbox-td-padding-right-0">
	                        	<div class="form-check m-0" style="width:20px">
		                        	<label class="form-check-label">
		                        		<input type="checkbox" class="btn-check-all-onoff form-check-input" />
		                        		<i class="input-helper"></i>
		                        	</label>  
	                        	</div>
	                        </td>
	                      	
	                      	<!-- 
	                      	<td class="addr-list-checkbox-td-padding-right-0">
	                      		<input type="checkbox"/>
	                      	</td>	                      	
	                      	-->
	                      	
	                        <td class="py-1"> <img src="${path}/resources/imagesft/logo-noa-messanger.png" alt="프로필사진"/> </td>
	                        <td> ${member['m_name']} <span hidden>${member['m_id']}</span></td>
	                        <td> ${member['team_name']} </td>
	                        <td style="padding-left:0px;"> ${member['position_name']} </td>
	                        <td style="padding-left:0px;"> ${fn:substring(member['m_private_contact'],0,3)}-${fn:substring(member['m_private_contact'],3,7)}-${fn:substring(member['m_private_contact'],7,11)} </td>
	                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>		
                <c:if test="${empty membersList}">
                	<div class="addr-list-no-member-exits">
                		<h2>${param.searchWord}(으)로 검색된 구성원이 없습니다⚠️</h2>
                	</div>
                </c:if>
			</div>
			
			<!-- 구성원 상세보기 div 시작 -->
			<div class="card-body d-flex flex-column justify-content-center p-15" style="display:none !important;" id="hidden-member-details">
              <div style="width:565.5px;height:506px; padding:40px 10px;" class="d-flex flex-column justify-content-center">
                <div class="d-flex align-items-center my-3" >
                  <div style="margin:0px 15px;flex-grow: 1;">
                    <img src="./images/profileskh.jpg" class="profile-img-box-shadowing"/>
                  </div>
                  <div class="d-flex flex-column" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title-no-divider">아이디</span>
                    <span class="member-content" id="span-m-detail-m_id">m_id</span>
                  </div>
                  <div class="d-flex flex-column" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title-no-divider">이름</span>
                    <span class="member-content" id="span-m-detail-m_name">m_name</span>
                  </div>
                </div>
                <div class="d-flex align-items-center my-3">
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">소속 </span>
                    <span class="member-content" id="span-m-detail-team_name">team_name</span>
                  </div>
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">직책</span>
                    <span class="member-content"  id="span-m-detail-is_leader"></span>
                  </div>
                </div>
                <div class="d-flex align-items-center my-3" >
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">직급 </span>
                    <span class="member-content" id="span-m-detail-position_name">position_name</span>
                  </div>
                </div>
                <div class="d-flex align-items-center my-3">
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">개인연락처</span>
                    <span class="member-content" id="span-m-detail-m_private_contact">010-5316-9953</span>
                  </div>
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">사내연락처 </span>
                    <span class="member-content" id="span-m-detail-m_emp_contact">02-345-9953 or None</span>
                  </div>
                </div>
                <div class="d-flex align-items-center my-3" >
                  <div class="d-flex align-items-baseline" style="margin:0px 15px;flex-grow: 1;">
                    <span class="member-title">입사일 </span>
                    <span class="member-content" id="span-m-detail-m_hiredate">m_hiredate</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 구성원 상세보기 div 끝 -->
            
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
  	  const addrListTbody = document.querySelector('#addr-list-card-body-memberlist-card > div > table > tbody')
  	  const alMemberListCardBody = document.querySelector('#addr-list-card-body-memberlist-card')
	  
  	  let btn_all = document.querySelector('input.btn-check-all-onoff');
   	  btn_all.addEventListener('click',toggle_btn_check_all_onoff)
      let addr_list_mlist_tbody = document.querySelector('#addr-list-members-tbody-forcheckbox');
      addr_list_mlist_tbody.addEventListener('click',count_tbody_checked_checkbox);
      addr_list_mlist_tbody.onclick = count_tbody_checked_checkbox;
      
      const hmd = document.querySelector('#hidden-member-details');
      
  	  document.addEventListener('click',e => {
  		//전체선택/전체해제 체크박스용 js
  		btn_all = document.querySelector('input.btn-check-all-onoff');
    	btn_all.addEventListener('click',toggle_btn_check_all_onoff)
    	addr_list_mlist_tbody = document.querySelector('#addr-list-members-tbody-forcheckbox');
    	//addr_list_mlist_tbody.onclick = count_tbody_checked_checkbox;
    	addr_list_mlist_tbody.addEventListener('click',count_tbody_checked_checkbox);
    	//tr 클릭 시 구성원 상세보기 띄우기
    	addr_list_mlist_tbody.addEventListener('click',e => {
    		if(event.target.type === 'checkbox') return;
    		let member_id = get_tr_element_from_children(e.target).querySelector('span').textContent.trim();
    		console.log('➡️구성원 m_id: ',member_id)
    		$.ajax({
    			url:'<c:url value="/Address/searchOneMember.kosmo"/>',
    			data: "m_id="+member_id,
    			dataType:'json'
    		}).done(data=>{
    			//data에 담긴 구성원 정보를 hidden에 값 설정
    			console.log(data)
    			hmd.querySelector('#span-m-detail-m_id').textContent = data['m_id']
				hmd.querySelector('#span-m-detail-m_name').textContent = data['m_name']
				hmd.querySelector('#span-m-detail-team_name').textContent = data['team_name']
				let duty = '';
				if (data['m_team_leader']===undefined){
					duty+='👑팀장';
					if (data['m_dept_leader']===undefined) duty+=' & 👑부서장';
				}
				else duty+='팀원';					
				hmd.querySelector('#span-m-detail-is_leader').textContent = duty
				hmd.querySelector('#span-m-detail-position_name').textContent = data['position_name']
				hmd.querySelector('#span-m-detail-m_private_contact').textContent = data['m_private_contact']
				hmd.querySelector('#span-m-detail-m_emp_contact').textContent = data['m_emp_contact']
				hmd.querySelector('#span-m-detail-m_hiredate').textContent = data['m_hiredate']
    			
				//hidden 띄우기 닫기
				alMemberListCardBody.style.display='none';
				hmd.style.display='';
				
    				
    		}).fail(error=>{
    			console.log('에러발생: ',error)
   			});
    	});
    	
  	  })
  	  
  	
  	  // * 팀 목록 클릭 시 해당 팀원들 목록 출력하기
	  $('.addr-list-team-no-onclick-ajax').click(e=>{
	      e.preventDefault();
	      let team_no = e.target.href;
	      team_no = team_no.substring(team_no.lastIndexOf('/')+1,team_no.length);
	      console.log('팀 번호는?????'+team_no)
	      $.ajax({
	      	url:'<c:url value="/Address/searchOneTeam.kosmo"/>',
	      	data: "team_no="+team_no,
	      	dataType:'json'
	      }).done(data=>{ //data는 [{json},{json},...] 형태
	    	  console.log('🔔ajax 응답 성공')
	    	  addrListTbody.innerHTML=''
	    	  for(member of data){
	    		  let html = '<tr>'+
			                    '<td class="addr-list-checkbox-td-padding-right-0">'+
		                        	'<div class="form-check m-0" style="width:20px">'+
			                        	'<label class="form-check-label">'+
			                        		'<input type="checkbox" class="btn-check-all-onoff form-check-input" />'+
			                        		'<i class="input-helper"></i>'+
			                        	'</label>'+  
		                        	'</div>'+
		                        '</td>'+
			                    '<td class="py-1"> <img src="'+member["m_profile"]+'" alt="프로필 사진"/> </td>'+
			                    '<td> '+member["m_name"]+'<span hidden>'+member["m_id"]+'</span> </td>'+
			                    '<td> '+member["team_name"]+' </td>'+
			                    '<td style="padding-left:0px;"> '+member["position_name"]+' </td>'+
			                    '<td style="padding-left:0px;"> '+String(member["m_private_contact"]).substr(0,3)+String(member["m_private_contact"]).substr(3,7)+String(member["m_private_contact"]).substr(7,11)+' </td>'+
							  '</tr>'
                  addrListTbody.innerHTML+=html
	    	  }
	      }).fail(error=>{
	    	  console.log(error)
	      });
	  })//////onclick() 
  </script>
</body>

<!-- body END -->