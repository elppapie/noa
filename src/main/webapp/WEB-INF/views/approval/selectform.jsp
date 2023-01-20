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


<script>

	$(document).on('click', '#cancel', function(e){//취소

		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/Approval/approvalmain.kosmo";

	});
	
	
		$(document).on('click', '#appWrite', function(e){//기안문 작성
	
			e.preventDefault();
	
			location.href = "${pageContext.request.contextPath}/Approval/appForm.kosmo";//작성하기 버튼 누르면 이동하는 write페이지
	
		});
		
</script>
<script type="text/javascript">
	$(function(){
		loadline();
	});	
	
	function loadline(){
		$.ajax({
			///selectLineView.ap?${_csrf.parameterName}=${_csrf.token}"
			url: "${path}/Approval/selectLineView.kosmo",
			type: "post",
			success : function(result) {
				$("#load_line").html(result);
			},
			error: function(){
				alert("결재자 선택 오류");
			}
		});
	};	
	$(function(){
		$("#all_loadline").click(function(){//모든 부서 리스트
			///selectAllmemform.ap
			location.href = "${path}/Approval/selectLineView.kosmo;
		});
		$("#loadline").click(function(){//해당 부서 리스트
			///selectform.ap
			location.href = "${path}/Approval/selectLineView.kosmo";
		});
	});

//function formselect(){//양식 선택 후 기안문작성 버튼 클릭시
	 //var form = $("#selectform option:selected").val();
	 ///form1.fo?form_name='+form,'문서기안'
	// window.open('${path}/Approval/appForm.kosmo,'width=860,height=1100,location=no,status=no,scrollbars=yes');
	//location.href = "${path}/Approval/appForm.kosmo;		 
		
	//};


</script>

<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>

</head>

<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<body>

	<article>
              <div class="card" onload = "loadline();">
                 <div class="card-body">
                    <form name = "selectform" action = "${path}/Approval/문서양식선택엑션메서드.kosmo" method = "post"> <!-- /selectAppAction.ap -->
                   <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 스프링 시큐리티   -->
		                <div class="row">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">결재선 선택</h4>
		                                <div id = btn>
		                                <button type = "button" id = "all_loadline" class ="btn btn-secondary btn-sm">모든 부서 리스트</button>
		                                <button type = "button" id = "loadline" class ="btn btn-secondary btn-sm">해당 부서 리스트</button>
		                                </div>
		                                <select multiple="multiple" size="10" class="duallistbox" name = "getter_id">
		                                 <c:forEach var="dto" items="${list}" varStatus = "status">
		                                    <option value="${dto.id}">${dto.id}  ${dto.depart_name} ${dto.name} ${dto.rank} </option>
		                                </c:forEach>   
		                                </select>
		                              	<!-- 결재선 표기 위치 -->
		                              	<div id = "load_line"></div>
		                              	 <br><hr>
									</div>
		                        </div>
		                    </div>
		                 </div>
		                 <br>
                      	<button type = "submit" id = "load_line_select" class ="btn btn-secondary btn-sm">결재선선택</button>  
             		  </form>
             		 <div>
             		<br><hr><br> 
                     <h5 class="card-title">기안양식선택</h5>
                     <h6 class="card-subtitle">기안 양식을 선택하세요</h6>
                     <select class="select2 form-control custom-select" name = "selectform" id = "selectform" style="width: 100%; height:36px;">
                         <optgroup label="일반">
                             <option value="업무기안">업무기안</option>
                         </optgroup>
                         <optgroup label="보고">
                             <option value="회의록">회의록</option>
                             <option value="계획보고">사업계획보고</option>
                             <option value="결과보고">사업결과보고</option>
                             <option value="교육보고">교육보고서</option>
                         </optgroup>
                         <optgroup label="신청">
                             <option value="교육신청">교육신청</option>
                         </optgroup>
                      </select>
                      <br>
                      <br>
	                      <div>
	                  <!--<button type = "button" class ="btn btn-secondary btn-sm" onclick="formselect(); self.close();">기안문작성</button> -->
	                 	  <button type = "button" class ="btn btn-secondary btn-sm" id="appWrite">기안문작성</button>
	                      <button type="button" class="btn btn-sm btn-secondary" id="cancel">취소</button><!-- 메인화면으로 이동 -->
	                     </div>
                     </div>
                </div>
          </div> 

	</article>

</body>

</html>
