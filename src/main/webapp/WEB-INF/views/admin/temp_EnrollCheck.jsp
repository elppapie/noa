<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
		<c:if test="${fn:contains(enroll,'dept')}">
		부서<br/>
		\${whySo["dept_name"]}:${whySo["dept_name"]}<br/>
		\${fn:length(memberList)}:${fn:length(memberList)}<br/>
		<c:forEach var="member" items="${memberList}">
			새그룹멤버: ${member}<br/>
		</c:forEach>
		\${whySo["m_dept_leader"]}:${whySo["m_dept_leader"]}<br/>
		</c:if>
		<c:if test="${fn:contains(enroll,'team')}">
		팀<br/>
		\${whySo["team_name"]}:${whySo["team_name"]}<br/>
		\${fn:length(memberList)}:${fn:length(memberList)}<br/>
		<c:forEach var="member" items="${memberList}">
			새그룹멤버: ${member}<br/>
		</c:forEach>
		\${whySo["m_team_leader"]}:${whySo["m_dept_leader"]}<br/>
		</c:if>
	</div>
</div>
