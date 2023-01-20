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


 <script type="text/javascript">
	$(function(){
	$("#tempsave").click(function(){
		if(confirm("임시보관을 하시겠습니까?")){
			document.approvalForm.action = "${path}/tempSave.ap?${_csrf.parameterName}=${_csrf.token}";
			document.approvalForm.submit();
			}
		});
	$("#approvereq").click(function(){
		if(confirm("문서를 기안 하시겠습니까?")){
			document.approvalForm.action = "${path}/approvereq.ap?${_csrf.parameterName}=${_csrf.token}";
			document.approvalForm.submit();
			}
		});
	});
</script>

</head>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<body>
<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
 
<form name = "approvalForm" method = "post" enctype = "multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

<c:forEach var="dto" items="${list}" begin = "0" end = "0"> 
<input type="hidden" name="load_id" value = "${dto.load_id}"> 
<input type="hidden" name="category" value = "${dto.category}"> 
<input type="hidden" name="form_name" value = "${dto.form_name}"> 

</c:forEach>
<c:forEach var="dto2" items="${list2}" begin = "0" end = "0"> 
<input type="hidden" name="depart_name" value = "${dto2.depart_name}">
</c:forEach> 
<table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;">
<tr>
<br>

&nbsp;<button type="button" id = "approvereq">결재요청</button> &nbsp;
<button type="button" id = "tempsave">임시저장</button> &nbsp;
</tr>
<hr>
<!-- Header --> 
   <colgroup> 
    <col width="310">
    <col width="400"> 
   </colgroup> 
	<tbody>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 0px !important; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;" colspan="2">
			
			<c:forEach var="dto" items="${list}" begin = "0" end = "0"> 
				${dto.form_name} 
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
				
	<table style="border: 1px solid rgb(0, 0, 0); font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse; width: 318px;"><!-- User --> 
      <colgroup> 
       <col width="90"> 
       <col width="120"> 
      </colgroup> 
      
	<tbody>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
			 문서번호 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">-</span>
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
							<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
							<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
							<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span> 
				</span><br>
			</td>
		</tr>
		<tr style="height: 32px;">
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
 			부&nbsp;&nbsp;&nbsp;서
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
				<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<c:forEach var="dto2" items="${list2}" varStatus = "status" begin = "0" end = "0">
					${dto2.depart_name}
					</c:forEach>				
				</span>
				<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
					<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
					<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
				</span> 
				<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				
		기&nbsp;안&nbsp;일
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
				<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> - </span>
				<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
					<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
					<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
					<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
				</span> 
				<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
					<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
				</span> 
				</span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				
		기 안 자
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<c:forEach var="dto2" items="${list2}" varStatus = "status" begin = "0" end = "0">
					${dto2.name} ${dto2.rank}
					</c:forEach>
					</span> 
					
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
						<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
						<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
						</span> 
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
					<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> 
				</span><br>
			</td>
		</tr>
		<tr>
		</tr>
	</tbody>
</table>

			</td>
			<td style="background: white; padding: 0px !important; border: currentColor; align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">
			<table style = "float:right">
					<tr>
					<c:forEach var="dto" items="${list}"> 
						<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 10px; font-weight: normal; vertical-align: middle;  text-align: center; width: 60px; height:10px;">(${dto.co_approve})</td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach var="dto" items="${list}"> 
						<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 10px; font-weight: normal; vertical-align: middle;  text-align: center; width: 60px; height:10px;">${dto.rank}</td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach var="dto" items="${list}"> 
						<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 10px; font-weight: normal; vertical-align: top;  text-align: center; width: 60px; height:60px;">${dto.name}<br><c:if test = "${load_status == '결재완료'}"><img src = "${path}/resources/images/adminImages/stamp.png"></c:if></td>
					</c:forEach>
					</tr>
					<tr>
					<c:forEach var="dto" items="${list}">
						<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; color: rgb(0, 0, 0); font-size: 10px; font-weight: normal; vertical-align: middle;  text-align: center; width: 60px; height:10px;">결재일</td>
					</c:forEach>	
					</tr>
			</table>
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
					<!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. -->
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
						<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
						<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
					</span>
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span>
				</span><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><br>
				
			</td>
		</tr>
	</tbody>
</table>

 
<table style="border: 2px solid; width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px;"><colgroup> 
   <col width="140"> 
   <col width="660"> 
  </colgroup> 
  
	<tbody>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				
		제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype="">
					<input class="ipt_editor" name = "title" type="text" size = "100">
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
						<span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
						<span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
						<span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> 
					</span> 
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
					<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> 
				</span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px;border:1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="2">
				
상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용
			</td>
		</tr>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 5px;border:1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{editor}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_editor" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 200px; margin-top: 0px; margin-bottom: 0px;">
				<textarea cols="120" id="testedit1" name="content" rows="10" data-sample="2"
                                    data-sample-short>
                                			내용을 입력하세요.
                </textarea>

				</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="inputGroupFile01" name = "files" size = "100">
                        <label class="custom-file-label" for="inputGroupFile01">파일첨부</label>
                    </div>
			</td>
		</tr>
	</tbody>
</table>
</form>
</span></span>
<p style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p>
</body>
</html>
<script>
        //default
        initSample();

        //inline editor
        // We need to turn off the automatic editor creation first.
        CKEDITOR.disableAutoInline = true;

        CKEDITOR.inline('editor2', {
            extraPlugins: 'sourcedialog',
            removePlugins: 'sourcearea'
        });

        var editor1 = CKEDITOR.replace('editor1', {
            extraAllowedContent: 'div',
            height: 460
        });
        editor1.on('instanceReady', function () {
            // Output self-closing tags the HTML4 way, like <br>.
            this.dataProcessor.writer.selfClosingEnd = '>';

            // Use line breaks for block elements, tables, and lists.
            var dtd = CKEDITOR.dtd;
            for (var e in CKEDITOR.tools.extend({}, dtd.$nonBodyContent, dtd.$block, dtd.$listItem, dtd.$tableContent)) {
                this.dataProcessor.writer.setRules(e, {
                    indent: true,
                    breakBeforeOpen: true,
                    breakAfterOpen: true,
                    breakBeforeClose: true,
                    breakAfterClose: true
                });
            }
            // Start in source mode.
            this.setMode('source');
        });
    </script>
    <script data-sample="1">
        CKEDITOR.replace('testedit', {
            height: 150
        });
    </script>
    <script data-sample="2">
        CKEDITOR.replace('testedit1', {
            height: 400
        });
    </script>
    <script data-sample="3">
        CKEDITOR.replace('testedit2', {
            height: 400
        });
    </script>
    <script data-sample="4">
        CKEDITOR.replace('tool-location', {
            toolbarLocation: 'bottom',
            // Remove some plugins that would conflict with the bottom
            // toolbar position.
            removePlugins: 'elementspath,resize'
        });
    </script>