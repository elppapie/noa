<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
</head>
<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<script type="text/javascript">
$(function(){
	$(".co_approve").change(function(){
		var co_approve = $(this).val();
		var getter_id = $(this).data("num");
		var load_id = $(this).data("num2")
		location.href = "${path}/changeco_approve.ap?co_approve="+ co_approve + "&getter_id="+ getter_id + "&load_id="+ load_id + "&${_csrf.parameterName}=${_csrf.token}";
		alert("결재정보가 변경되었습니다");
	});
	
	$(".delete_one").click(function(){
		var getter_id = $(this).data("num");
		var load_id = $(this).data("num2")
		location.href = "${path}/deleteco_approve.ap?getter_id="+ getter_id + "&load_id="+ load_id + "&${_csrf.parameterName}=${_csrf.token}";
		alert("결재정보가 삭제되었습니다");
	});
});
</script>

<hr>
  	<form name = "loadlineForm" method = "post">
	<table  style="width:100%; text-align:center;">
		<tr>
			<th weight = "10%">
			결재순번
			</th>
			<th weight = "20%">
			부서
			</th>
			<th weight = "20%">
			이름
			</th>
			<th weight = "20%">
			직위
			</th>
			<th weight = "10%">
			결재/협조
			</th>
			<th weight = "10%">
			삭제
			</th>
		</tr>
		
	<c:set var="cnt" value="1"/>
	<c:forEach var="dto" items="${list}" varStatus = "status">
	 	<c:set var="sum" value="${sum+1}"/>
		<tr>
			<td>
				<%-- ${sum} --%>
				<!-- 역순 -->
				<%-- ${fn:length(list) - status.index} --%>
				${status.count}
			</td>
			<td>
				${dto.depart_name} 
			</td>
			<td>
				${dto.name}
			</td>
			<td>
				${dto.rank} 
			</td>
			<td>
			   <select class="co_approve" name = "co_approve" data-num="${dto.getter_id}" data-num2="${dto.load_id}">
                     <option <c:if test="${dto.co_approve == '결재'}">selected</c:if> value="결재">결재</option>
                     <option <c:if test="${dto.co_approve == '협조'}">selected</c:if> value="협조">협조</option>
               </select>
			</td>
			<td>
				<button type="button" name="delete_one" class="delete_one" value="삭제" data-num="${dto.getter_id}" data-num2="${dto.load_id}">
					<span class="mr-1"><i class="far fa-trash-alt remove-note"></i></span>
				</button>
			</td>
		</tr>
	  </c:forEach>
	  <tr>
	  <td colspan = "6">
	  <hr>
	  </td>
	  </tr>
	  <c:forEach var="dto2" items="${list2}" varStatus = "status" begin = "0" end = "0">
		<tr>
			<td weight = "10%">
			기안자 :
			</td>
			<td weight = "20%">
			${dto2.depart_name}
			</td>
			<td weight = "20%">
			${dto2.name}
			</td>
			<td weight = "20%">
			${dto2.rank}
			</td>
			<td weight = "10%">
			기안
			</td>
			<td weight = "10%">
			-
			</td>
		</tr>
	   </c:forEach>
	</table>
	</form>
	<hr>

</body>
</html>