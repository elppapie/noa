<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<style>
	.dayyy{
		height:100px;
	
	}
	
	.boxxxx{
		height:auto;
		border-left:1px solid black;
		width: 100px;
	}

</style>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="<c:url value="Schedule/year.kosmo"/>" role="tab" aria-selected="false">연간달력</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active " id="home-tab" data-bs-toggle="tab" href="<c:url value="Schedule/month.kosmo"/>" role="tab" aria-controls="overview" aria-selected="true">월간달력</a>
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
      <a href="<c:url value="/Notice/list.kosmo"/>" class="btn btn-otline-dark align-items-center"><i class="fa-solid fa-square-plus"></i> 공지사항(임시)</a>
      <a href="<c:url value="/Schedule/write.kosmo"/>" class="btn btn-otline-dark align-items-center"><i class="fa-solid fa-square-plus"></i> 일정추가</a>
      <a href="#" class="btn btn-otline-dark"><i class="fa-solid fa-magnifying-glass"></i> 일정검색</a>
      <a href="#" class="btn btn-primary text-white me-0"><i class="fa-solid fa-download"></i> 달력저장</a>
    </div>
  </div>
</div>  

<div class="tab-content tab-content-basic">
<!----Main Page의 Content 작성---->
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">2023 January <code>월간일정</code></h4>
					<p>\${message} : ${message}</p>
                  <p class="card-description">
                    현재시간 <code>\${ }</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
							<td class="day sun" >
								일
							</td>
							<td class="day" >
								월
							</td>
							<td class="day" >
								화
							</td>
							<td class="day" >
								수
							</td>
							<td class="day" >
								목
							</td>
							<td class="day" >
								금
							</td>
							<td class="day sat" >
								토
							</td>
                        </tr>
                      </thead>
                      <tbody>
	                      <c:if test="true">
		                      <%-- <c:forEach items="">--%>
		                      	<tr>
		                      		<td class="dayyy">1</td>
		                      		<td class="dayyy">2</td>
		                      		<td class="dayyy">3</td>
		                      		<td class="dayyy">4</td>
		                      		<td class="dayyy">5</td>
		                      		<td class="dayyy">6</td>
		                      		<td class="dayyy">7</td>
		                      	</tr>
		                      <%-- </c:forEach>--%>
	                      </c:if>
	                      		                      	<tr>
		                      		<td class="dayyy">1</td>
		                      		<td class="dayyy">2</td>
		                      		<td class="dayyy">3</td>
		                      		<td class="dayyy">4</td>
		                      		<td class="dayyy">5</td>
		                      		<td class="dayyy">6</td>
		                      		<td class="dayyy">7</td>
		                      	</tr>	                      
		                      	<tr>
		                      		<td class="dayyy">1</td>
		                      		<td class="dayyy">2</td>
		                      		<td class="dayyy">3</td>
		                      		<td class="dayyy">4</td>
		                      		<td class="dayyy">5</td>
		                      		<td class="dayyy">6</td>
		                      		<td class="dayyy">7</td>
		                      	</tr>
		                      	<tr>
		                      		<td class="dayyy">1</td>
		                      		<td class="dayyy">2</td>
		                      		<td class="dayyy">3</td>
		                      		<td class="dayyy">4</td>
		                      		<td class="dayyy">5</td>
		                      		<td class="dayyy">6</td>
		                      		<td class="dayyy">7</td>
		                      	</tr>		                      	
		                      	<tr>
		                      		<td class="dayyy">1</td>
		                      		<td class="dayyy">2</td>
		                      		<td class="dayyy">3</td>
		                      		<td class="dayyy">4</td>
		                      		<td class="dayyy">5</td>
		                      		<td class="dayyy">6</td>
		                      		<td class="dayyy">7</td>
		                      	</tr>		
                      </tbody>
                    </table>
                    <%-- 
                    <form method="POST" action="<c:url value='Schedule/month.kosmo'/>">
                    	<label for="fname">아이디 입력:</label>
  						<input type="text" id="fname" name="fname"/><br/><br/>
  						<input type="hidden" name="id" value="month"/>
  						<input type="submit" value="검색"/>
                    </form>
                    
                    <form method="POST" action="<c:url value='view.kosmo'/>">
                    	<label for="fname">글번호 입력:</label>
  						<input type="text" id="fname" name="sche_no"/><br/><br/>
  						<input type="submit" value="글번호 검색"/>
                    </form>
                    --%>
                    
                    
                  </div>
                  <%-- 
                  <div class="boxxxx">
                  	ddd
                  </div>
                  --%>
                </div>
              </div>


<%--
<table class="calendar_body">

<thead>
	<tr bgcolor="lavender">
		<td class="day sun" >
			일
		</td>
		<td class="day" >
			월
		</td>
		<td class="day" >
			화
		</td>
		<td class="day" >
			수
		</td>
		<td class="day" >
			목
		</td>
		<td class="day" >
			금
		</td>
		<td class="day sat" >
			토
		</td>
	</tr>
</thead>
<tbody id="">
	<tr>
		<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
			<c:choose>
				<c:when test="${dateList.value=='today'}">
	<!-- 오늘 -->
					<td class="today" id="today${dateList.date}" onclick="today(${dateList.date})">
						<div class="date">
							${dateList.date}
						</div>
						<input type="hidden" name="cal_no" id="c_hidden${dateList.date}" value="${dateList.cal_no}" disabled>
						<input type="hidden" name="today" id="today_hidden" value="${dateList.date}" disabled>
						<div class="T_content" id="T_content${dateList.date}">
							${fn:replace(dateList.schedule_content, replaceChar, "<br/>")}
						</div>
					</td>
				</c:when>
				<c:when test="${date_status.index%7==6}">
	<!-- 토요일 -->
					<td class="sat_day" id="satDay${dateList.date}" onclick="satDay(${dateList.date})">
						<div class="sat" id="sat">
							${dateList.date}
						</div>
						<input type="hidden" name="cal_no" id="c_hidden${dateList.date}" value="${dateList.cal_no}" disabled>
						<input type="hidden" class="satDay" name="satDay" id="today_hidden1" value="${dateList.date}" disabled>
						<div class="Sat_content" id="Sat_content${dateList.date}">
							${fn:replace(dateList.schedule_content, replaceChar, "<br/>")}
						</div>
					</td>
	</tr>
				</c:when>
				<c:when test="${date_status.index%7==0}">
	<!-- 일요일 -->
	<tr>	
				<td class="sun_day" id="sunDay${dateList.date}" onclick="sunDay(${dateList.date})">
					<div class="sun">
						${dateList.date}
					</div>
					<input type="hidden" name="cal_no" value="${dateList.cal_no}" id="c_hidden${dateList.date}" disabled>
					<input type="hidden" class="sunDay" name="sunDay" id="today_hidden1" value="${dateList.date}" disabled>
					<div class="Sun_content" id="Sun_content${dateList.date}">
						${fn:replace(dateList.schedule_content, replaceChar, "<br/>")}
					</div>
				</td>
				</c:when>
				<c:otherwise>
				<!-- 나머지  -->
				<td class="normal_day" id="NDay${dateList.date}" onclick="NDay(${dateList.date})">
					<div class="date">
						${dateList.date}
					</div>
					<input type="hidden" name="cal_no" value="${dateList.cal_no}" id="c_hidden${dateList.date}" disabled>
					<input type="hidden" class="NDay" name="NDay" id="today_hidden1" value="${dateList.date}" disabled>
					<div class="N_content" id="N_content${dateList.date}">
						${fn:replace(dateList.schedule_content, replaceChar, "<br/>")}
					</div>
				</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tr>
</tbody>
</table>
--%>
	<div>
		<a href="<c:url value="/Schedule/fullcalendar.kosmo"/>">fullcalendar 출력</a><br/>
		<h3>관리자 페이지(임시)</h3>
		<a href="<c:url value="/Admin/deptList.kosmo"/>">최고관리자 페이지(부서/팀 목록)</a><br/>
		<a href="<c:url value="/Admin/members.kosmo"/>">최고관리자 페이지(구성원 목록)</a><br/>
		<a href="<c:url value="/Admin/groups.kosmo"/>">최고관리자 페이지(그룹 목록)</a><br/>
	</div>
</div>

