<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
  <ul class="nav nav-tabs aligh-items-center" role="tablist">
    <li class="nav-item">
      <div class="form-check">
	      <label class="form-check-label">
	       <input type="checkbox" class="form-check-input"/>전체 선택
	      </label>
	      <i class="input-helper"></i>
      </div>
    </li>
    <li class="nav-item d-flex align-items-center">
      <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#" role="tab"><i class="mdi mdi-email-outline"></i> 메일 </a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#" role="tab"><i class="mdi mdi-message-text-outline"></i> 메신저 </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#" role="tab"><i class="mdi mdi-share-variant"></i> 공유 </a>
    </li>
  </ul>
  <div>
    <div class="btn-wrapper">
      <a href="#" class="btn btn-otline-dark align-items-center"> 정렬</a>
      <!-- <i class="mdi mdi-sort"></i> -->
      <a href="#" class="btn btn-otline-dark"> 조직도 검색</a>
      <!-- <i class="mdi mdi-account-search"></i> -->
      <a href="#" class="btn btn-primary text-white me-0"> Export</a>
      <!-- <i class="icon-download"></i> -->
    </div>
  </div>
</div> 

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
</div>


<!-- body END -->