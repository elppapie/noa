<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="<c:url value="Schedule/year.kosmo"/>" role="tab" aria-controls="overview" aria-selected="true">연간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="<c:url value="Schedule/month.kosmo"/>" role="tab" aria-selected="false">월간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="<c:url value="Schedule/week.kosmo"/>" role="tab" aria-selected="false">주간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link border-0" id="more-tab" data-bs-toggle="tab" href="#more" role="tab" aria-selected="false">More</a>
    </li>
  </ul>
  <div>
    <div class="btn-wrapper">
      <a href="#" class="btn btn-otline-dark align-items-center"><i class="icon-share"></i> Share</a>
      <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> Print</a>
      <a href="#" class="btn btn-primary text-white me-0"><i class="icon-download"></i> Export</a>
    </div>
  </div>
</div>  

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
</div>
