<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


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
<h1>\${param.searchColumn}: ${param.searchColumn}</h1>
<h1>\${param.searchWord}: ${param.searchWord}</h1>
</div>


<!-- body END -->