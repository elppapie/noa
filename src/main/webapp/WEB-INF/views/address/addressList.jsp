<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

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
</style>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
  
  
  
  <ul class="nav nav-tabs aligh-items-center" role="tablist">
    <li class="nav-item align-items-baseline">
      <div class="form-check">
	      <label class="form-check-label">
	       <input type="checkbox" class="form-check-input"/>전체 선택
	      </label>
	      <i class="input-helper"></i>
      </div>
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
  <div>
    <div class="btn-wrapper">
      <a href="#" class="btn btn-otline-dark align-items-center"><i class="fa fa-light fa-filter"></i> 정렬</a>
      <a href="#" class="btn btn-otline-dark"><i class="fa fa-light fa-address-book"></i> 조직도 검색</a>
      <a href="#" class="btn btn-primary text-white me-0"><i class="fa fa-light fa-download"></i> Export</a>
    </div>
  </div>
</div> 

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
<div class="row">
	<div class="col-sm-4">
		<div class="card card-rounded">
			<div class="card-body addr-list-overflow-y-auto">
			${myInfo['emp_name']}
			<ul class="list-unstyled">
				<li>
				<a data-bs-toggle="collapse" href="#dept1">여기에 부서명</a>
					<div class="collapse" id="dept1">
						<ul class="list-unstyled">
							<li>
							여기에 팀명
							</li>
						</ul>
					</div>
				</li>
			</ul>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="card card-rounded">
			<div class="card-body">
				<div class="table-reponsive addr-list-scroll-x-auto">
                  <table class="table table-stripped table-hover">
                    <thead>
                      <tr>
                        <th>  </th>
                        <th> 프로필 </th>
                        <th> 이름 </th>
                        <th> 소속 팀 </th>
                        <th> 연락처ㆍ비고 </th>
                      </tr>
                    </thead>
                    <tbody>
                      
                      <!-- 여기서 forEach반복 -->
                      <c:forEach items="membersList" var="member">
	                      <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
	                      <tr>
	                      	<td class="addr-list-checkbox-td-padding-right-0">
	                      		<input type="checkbox"/>
	                      	</td>
	                        <td class="py-1"> <img src="${path}/resources/images/logo-noa-messanger.png" alt="프로필사진"/> </td>
	                        <td> ${member['m_name']} </td>
	                        <td> ${member['team_name']} </td>
	                        <td> ${fn:substring(member['m_private_contact'],0,2)} </td>
	                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>		

			</div>
		</div>
	</div>
</div>

<h1>\${param.searchColumn}: ${param.searchColumn}</h1>
<h1>\${param.searchWord}: ${param.searchWord}</h1>
</div>


<!-- body END -->