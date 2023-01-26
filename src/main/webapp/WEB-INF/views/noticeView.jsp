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
	
	<div class="row">
	<div class="col-lg-8 d-flex flex-column">
		<div class="row flex-grow">
			<div class="col-12 col-lg-4 col-lg-12 grid-margin stretch-card">
				<div class="card card-rounded">
					<div class="card-body">
						<div class="d-sm-flex justify-content-between align-items-start">

							<h4 class="card-title card-title-dash">공지사항</h4>
							<a href="<c:url value="/Notice/List.kosmo"/>"
								class="fw-bold text-primary"> 상세보기 <i
								class="mdi mdi-arrow-right ms-2"></i></a>

						</div>
						<div class="chartjs-wrapper mt-5">
							<table class="table table-light table-hover text-center">
								<tr>
									<th class="col-1">번호</th>
									<th>제목</th>
									<th class="col-2">글쓴이</th>
									<th class="col-2">등록일</th>
								</tr>
								
								<tr>
									<td>01</td>
									<td><a href="http://localhost:8080/NodeArchive/Notice/view.kosmo">2023년 신년사 입니다.</a></td>
									<td>관리자</td>
									<td>2022-12-31</td>
								</tr>
							</table>

							<!-- 페이징 출력 -->
							<div>${listPagingData.pagingString}</div>

							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	</div>
</div>




