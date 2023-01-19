<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 현재시간 및 위치 , QR 생성 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript" ></script>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/getmap.js"></script>

<!-- 스캐너 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jsQr.js"></script>

<style>
 /*콘텐츠*/ 
.contents {
	position: absolute;
	width: 1000px;
	height: 860px;
	left: 210px;
	padding: 40px 0 40px 35px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
	background-color : white;
}
.conTitle {
	width: 930px;
	height: 40px;
	line-height: 40px;
	padding-bottom: 20px;
	font-size: 32px;
	border-bottom: 1px solid #e7e7e7;
	text-align: left;
}
.commuteBtn {
	width: 930px;
	height: 40px;
	line-height: 40px;
	padding: 36px 0;
	text-align: center;
	border-bottom: 1px solid #e7e7e7;
}
#qrcreate, #qrenter, #qrleave {
	width: 100px;
	height: 32px;
	margin-right: 20px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}
.option {
	width: 930px;
	height: 150px;
	padding: 30px 0;
	text-align: left;
}
.option input:nth-child(1), input:nth-child(2) {
	border: 1px solid #e7e7e7;
}
.option table {
	width: 930px;
	height: 150px;
}
.option table td {
	height: 50px;
	line-height: 50px;
}
.option table td:nth-child(1) {
	width: 150px;
}
.option table tr:nth-child(3) {
	text-align: center;
}
.option table button {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}
.list {
	width: 930px;
	height: 360px;
}
.list table {
	width: 930px;
	min-height: 95px;
	font-size: 14px;
	text-align: center;
}
.list table tr {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #e7e7e7;
}
.list table thead {
	font-weight: 700;
}



/* 출근, 퇴근, qr 스캐너 모달 */
#gomodal {
	display: none;
	position: relative;
	width: 100%;
	height: 0px;
	float: left;
	z-index: 9999;
}
.modalTitle {
	font-size: 28px;
	font-weight: 700;
	padding-bottom: 20px;
}
.modal_content {
	position: relative;
	width: 300px;
	height: 270px;
	padding: 20px 0;
	margin: 100px auto;
	background: #fefefe;
}
.modal_content_scanner {
	position: relative;
	width: 500px;
	height: 400px;
	padding: 20px 0;
	margin: 100px auto;
	background: #fefefe;
}
.close {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}
.modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}
</style>

<script>
    $(document).ready(function() {
        
        //모달생성
        $("#qrcreate").click(function(){
        	$("#gomodal").attr("style", "display:block");
        });
        
        $(".close").click(function(){
	        $("#gomodal").attr("style", "display:none");
	        $("#leavemodal").attr("style", "display:none");
	        $("#scannermodal").attr("style", "display:none");
        });
        
          
		  //현재 시간 구하기
		  //구글API URL
		  var gqrapi = "http://chart.apis.google.com/chart?cht=qr&chs=144x144&choe=UTF-8&chld=H|0";
		  function getTimeStamp() {
		    var d = new Date();
		    var s =
		      leadingZeros(d.getFullYear(), 4) + '-' +
		      leadingZeros(d.getMonth() + 1, 2) + '-' +
		      leadingZeros(d.getDate(), 2) + ' ' +
		        
		      leadingZeros(d.getHours(), 2) + ':' +
		      leadingZeros(d.getMinutes(), 2) + ':' +
		      leadingZeros(d.getSeconds(), 2);
		    return s;
		  }
		        
		  function leadingZeros(n, digits) {
		    var zero = '';
		    n = n.toString();
		    if (n.length < digits) {
		      for (i = 0; i < digits - n.length; i++)
		        zero += '0';
		    }
		    return zero + n;
		  }
		//현재 위치 구하기
		    function getLocation() {
		    if (navigator.geolocation) {
		        var value = navigator.geolocation.getCurrentPosition(showPosition);
		        console.log(value);
		   	} else { 
		        x.innerHTML = "Geolocation is not supported by this browser.";
		    }
		    }
		    function showPosition(position) {
			    var a = position.coords.latitude;
			    var b = position.coords.longitude;
			    return a;
		    }  
		
		//QR생성
		  $("#qrcreate").click(function () {
				var m_id = $("#m_id").val();
				//var uno = $("#uno").val();
				//var dno = $("#dno").val();	
			    //let today = getTimeStamp() + "," + dno + "," + m_id;
			    let today = getTimeStamp() + "," + m_id;
		 		console.log("큐알생성");
			    $text = today;
			    //입력한 내용 있는지 체크
			    if ($text !== "") {
			      var imgsrc = gqrapi+"&chl="+encodeURIComponent($text); //입력 데이터 인코딩해서 구글 API에 파라메터로 붙이고...
			      //이미지 객체를 생성해서 구글API URL을 "src="로 지정
			      var img = new Image();
			      $(img).load(function (){
			        var $this = $(this);
			        $this.hide();
			        $("#qrout1").empty().append(this); //<div>에 이미지 객체 추가
			        $this.fadeIn(); //QR코드 화면에 보이게
			      }).attr({"src" : imgsrc, "width" : 144, "height" : 144, "alt" : "QR CODE: "+ today }); 
			      //이미지 객체의 속성 지정 "src"에 구글API URL 지정
			    } 
			    else {
			    	$("#qrout1").empty().text("인코딩할 데이터를 입력하세요.");
			    }
		  });
		  
		//출퇴근 스캐너호출 
		  $('#qrenter').click(function() {
				popupOpen('qrenter');
			});
		  function popupOpen(url){
			  	var name="enter";
			    var specs = 'width=510, height=700, menubar=no,status=no,toolbar=no';
			    var newWindow = window.open(url,name,specs);
			    newWindow.focus();
			}
		$('#qrleave').click(function() {
				popupOpen('qrleave');
		});
		
		function popupOpen(url){
			  	var name="leave";
			    var specs = 'width=510, height=700, menubar=no,status=no,toolbar=no';
			    var newWindow = window.open(url,name,specs);
			    newWindow.focus();
		}
    });
</script>
</head>
<body>
	
	<div class="main">
		
		<div class="contents">
			<div class="article">
				<div class="conTitle">출퇴근 관리</div>
				<div class="commuteBtn">
					<input type="hidden" id="m_id" value="${m_id}" var="m_id"/>
<!-- 				<input type="hidden" id="dno" value="<sec:authentication property="principal.dno" var="dno"/>${dno}">  -->
					<button name="go" id="qrcreate">QR생성</button>
					<button name="go" id="qrenter">출근하기</button>
					<button value="" id="qrleave">퇴근하기</button>
					<div id="gomodal">
						<div class="modal_layer"></div>
						<div class="modal_content">
							<div class="modalTitle">QR</div>
							<div id="qrout1"></div>
							<button class="close">닫기</button>
						</div>
					</div>
				</div>
				<div class="option">
					<form name="search_frm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<table>
							<tr>
								<td>기간 선택</td>
								<td>
								<input type="Date" id="startdate" name="startdate" autocomplete="off" style="width:170px; height:30px; padding : 0 10px; color : #787878;"/>
									&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
								<input type="Date" id="enddate" name="enddate" autocomplete="off"   style="width:170px; height:30px; padding : 0 10px; color : #787878;"/>
								</td>
							</tr>
							<tr>
								<td>출퇴근 여부</td>
								<td><input type="radio" id="nomalAtt" name="att_state"
									value="0"> <label for="nomal">정상</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" id="abnomalEnter" name="att_state"
									value="1"> <label for="nomal">지각</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" id="abnomalLeave" name="att_state"
									value="2"> <label for="nomal">기타</label></td>
							</tr>
							<tr>
								<td colspan="2"><button value="" id="search">조회</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="list">
					<table>
						<thead>
							<tr>
								<td colspan="5" style="text-align: left;">조회결과 <span>${listCount}</span>건</td>
							</tr>
							<tr>
								<th>날짜</th>
								<th>근무상태</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무시간</th>
							</tr>
						</thead>
						<c:if test="${listCount eq 0}">
							<tr>
							    <td colspan="5" align="center"> 
								<br> 출퇴근 내역이 없습니다.<br> <br></td>
							</tr>
						</c:if> 
						<c:if test="${listCount ne 0}">
						<%-- <c:if test="${not empty list}"> --%>
							<c:forEach var="cm" items="${RequestScope.list}" varStatus="status">
								<tr>
									<td>${cm.att_date}</td>
									<td>
										<input type="hidden" value="${cm.att_state}" class="app${status.count}">  
                        				<span class="owappval${status.count}"></span> 
									
									</td>
									<td>${cm.att_startdate}</td>
									<td>${cm.att_enddate}</td>
									<td>${cm.att_worktime}</td>
								</tr>
								<script>
			                    if($(".app${status.count}").val() == 1){
			                    	$(".owappval${status.count}").text("지각");
			                    }else if($(".app${status.count}").val() == 0){
			                    	$(".owappval${status.count}").text("정상출근");
			                    }
	                    		</script>
	                    
							</c:forEach>
						</c:if>
						<!-- 앞 페이지 번호 처리 -->
						<tr>
							<td colspan="5"><c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if> <c:if test="${currentPage > 1}">
									<c:url var="dailyprev" value="/Attendance/dailylist.kosmo">
										<c:param name="page" value="${currentPage-1}" />
									</c:url>
									<a href="${dailyprev}">&lt; &nbsp; </a>
								</c:if> 
								<!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
								<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
									<!-- eq : == / ne : != -->
									<c:if test="${p eq currentPage}">
										<font color ="#da0f8e"><b>${p} &nbsp; </b></font>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="dailychk" value="/Attendance/dailylist.kosmo">
											<c:param name="page" value="${p}" />
										</c:url>
										<a href="${dailychk}">${p} &nbsp;</a>
									</c:if>
								</c:forEach> <c:if test="${currentPage >= maxPage}"> &gt;
							</c:if> <c:if test="${currentPage < maxPage}">
									<c:url var="dailynext" value="/Attendance/dailylist.kosmo">
										<c:param name="page" value="${currentPage+1}" />
									</c:url>
									<a href="${dailynext}">&gt;</a>
								</c:if></td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    $('#search').on('click', function(){
		if(fnMemberValidation() == false) {
            return;
            console.log("false로 들어옴");
      }else if(fnMemberValidation() == true){
         console.log("true로 들어옴");
			
 	   var frm = document.search_frm;
 	   frm.action = "${pageContext.request.contextPath}/Attendance/dailylist.kosmo";
 	   frm.method = "post";
 	   frm.submit();
	}else{
 	   return;
 	}
	});
		
	 
function fnMemberValidation(){
	 	 if($('#startdate').val() == '' || $('#startdate').val() == 0){
		   alert("시작 날짜를 선택해주세요");
	 	   return false;
	 	 }
	 	 if($('#enddate').val() == '' || $('#enddate').val() == 0){
	 	   alert("종료 날짜를 선택해주세요");
	  	   return false;
	  	 }
		 if($('input[name=att_state]:radio:checked').length < 1){
	 	   alert("상태를 선택해주세요");
	 	   $('#uname').focus();
	 	   return false;
		 }
 	   
 	  return true;
 	 };
 	
	</script>
</body>
</html>