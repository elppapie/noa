<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 차트 그리기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" 
	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" 
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/chart.js/Chart.min.js"></script>	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
*{
     margin : 0;
}
body{
    width : 100%;
    height: 100%;
    position: relative;
    font-size: 14px;
    font-family: Noto Sans KR;
    line-height: 1.15;
    color: rgb(17,17,17);
    background-color : #f2f2f2;
}
a {
	text-decoration: none;
	color: #111111;
}
.headersection {
	position: relative;
	width: 100%;
	height: 60px;
}

.headersection div {
	width: 1200px;
	height: 60px;
	margin: 0 auto;
}
/* 본문 */
.main{
    position: relative;
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}
/* 콘텐츠
.contents {
	position: absolute;
	width: 1000px;
	height: 1060px;
	left: 210px;
	padding: 40px 0 40px 35px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
	background-color : white;
} */
.conTitle{
    width: 930px;
    height: 40px;
    line-height: 40px;
    padding-bottom: 20px;
    font-size: 32px;
    border-bottom: 1px solid #e7e7e7;
}
.option{
    width: 930px;
    height: 50px;
    padding: 20px 0;
    border-bottom: 1px solid #e7e7e7;
}
.option table{
    width: 700px;
    height: 50px;
}
.option table td{
    height: 50px;
    line-height: 50px;
}
.option table td:nth-child(1){
    width: 100px;
    font-weight : 700;
}
.option table td:nth-child(2){
    width: 440px;
    font-weight : 700;
}
.option table input{
    height : 32px;
    border: 1px solid #c0c0c0;
    box-sizing: border-box;
}
.searchgraph{
    width: 930px;
    height: 380px;
    padding: 30px 0;
}
.option table button{
    width: 100px;
    height: 32px;
    background-color: #5A3673;
    color:#F2F2F2;
    border : none;
    border-radius: 3px;
}
.list{
    width: 930px;
    max-height: 390px;
}
.list table{
    width: 930px;
    min-height : 90px;
    max-height : 403px;
    font-size: 14px;
    text-align: center;
}
.list table tr{
    height: 30px;
    line-height: 30px;
    border-bottom: 1px solid #e7e7e7;
}
.list table thead{
    font-weight: 700;
}
.list table tr:nth-child(3){
   text-align:center;
}

    </style>

    <script>
        $(document).ready(function() {
        	
        
        $('#search').on('click', function(){
    		if(fnMemberValidation() == false) {
                return;
          	}
    		else if(nMemberValidation() == true){
	     	   var frm = document.search_frm;
	     	   frm.action = "${pageContext.request.contextPath}/Attendance/monthlylist.kosmo";
	     	   frm.method = "post";
	     	   frm.submit();
    		}
    		else{
     	   return;
     		}
    	});
        
        function fnMemberValidation(){
   	 	 if($('#startDate').val() == '' || $('#startdate').val() == 0){
   		   alert("시작 날짜를 선택해주세요");
   	 	   return false;
   	 	 }
   	 	 if($('#endDate').val() == '' || $('#enddate').val() == 0){
   	 	   alert("종료 날짜를 선택해주세요");
   	  	   return false;
   	  	 }
    	  return true;
    	 };
    	 
    });
    </script>
</head>
<body>
    
    <div class="main">
        
    <div class="contents">
        <div class="article">
            <div class="conTitle">월 근무내역</div>
            <div class="option">
            <form name="search_frm">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="Date" id="startDate" name="startdate" placeholder="시작일을 선택하세요" autocomplete="off"
                        		   value="${startdate}" 
                        			style="width:170px; height:30px; padding : 0 10px; color : #787878;"> 
                        &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
                        <input type="Date" id="endDate" name="enddate" placeholder="종료일을 선택하세요" autocomplete="off" 
                        		value="${enddate}"
                        		style="width:170px; height:30px; padding : 0 10px;color : #787878;"></td>
                        <td><button id="search">조회</button></td>
                    </tr>
                </table>
                </form>
            </div>
            <div class="searchgraph">
                <canvas id="canvas" height="230" width="600"></canvas>
            </div>
            <div class="list">
                <table>
                    <thead>
                    <tr>
                        <td colspan="4" style="text-align: left;">조회결과 ${listCount }건</td>
                    </tr>
                     <tr>
                        <th>날짜</th>
						<th>근무상태</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>근무시간</th>
                    </tr>
                    </thead>
                    <c:if test="${not empty list}">
						<c:forEach var="ml" items="${list}" varStatus="status">
		                    <tr>
		                        <td> 
		                        	<fmt:formatDate var="att_date" pattern="yyyy-MM-dd" value="${ml.att_date}" />
									<c:out value="${att_date}" />
		                        </td>
		                        <td>
									<input type="hidden" value="${ml.att_state}" class="app${status.count}">  
                       				<span class="owappval${status.count}"></span> 
								
								</td>
								<td>${ml.att_startdate}</td>
								<td>${ml.att_enddate}</td>
		                        <td>${ml.att_worktime}</td>
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
					<tr >
						<td colspan="7">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="monthlistprev" value="/Attendance/monthlylist.kosmo">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${monthlistprev}">&lt; &nbsp;</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color ="#da0f8e"><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="monthlistchk" value="/Attendance/monthlylist.kosmo">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${monthlistchk}">${p} &nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">  &gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="monthlistnext" value="/Attendance/monthlylist.kosmo">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${monthlistnext}"> &gt;</a>
							</c:if>
						</td>
					</tr>
                </table>
            </div>
        </div>

    </div>
</div>

<script>
        //그래프 그리기
        //createChart()함수를 안에다 선언해야지 차트값을 받더라...
        
        var startdate = "${startdate}"
        var enddate = "${enddate}"
        
        var dateList = [] // getDateRangeData( startdate, enddate )	// 근무날짜
        var workTimeList = []  // getDataList( startdate, enddate )		// 근무시간
        getDataList( startdate, enddate )
        
        $(document).ready(function() {
        	var ctx = $('#canvas')
        	
        	// 날짜와 근무시간 조회
        	
        	var data = {
        		labels: dateList,			// 날짜
        		datasets: [{
        			label: '출근',
//         	        barPercentage: 0.5,
        	        barThickness: 80,
        	        maxBarThickness: 80,
        	        minBarLength: 10,
        	        backgroundColor: [
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)",
        	            "rgba(255, 10, 10, 0.2)"
        	        ],
        	        borderColor : [
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)",
        	        	"rgba(255,99,132,1)"
        	        ],
        	        borderWidth: 2,
        	        data: workTimeList			// 근무시간
        	    }]
            }
			
			
			var options = {
        		//
        		legend: {
		            display: true,
		            labels: {
		                fontColor: 'rgb(255, 99, 132)'
		            }
		        },
			    scales: {
			        xAxes: [{
			            gridLines: {
			                offsetGridLines: true
			            }
			        }],
			        yAxes: [{
						ticks: {
							beginAtZero: true,
							fontSize : 14,
						}
					}],
			    },
			    showValue:{
		                fontStyle: 'Helvetica', //Default Arial
		                fontSize: 20
			     },
			     tooltips: {
						enabled: false
				 },
				 animation: {
						duration: 1,
						onComplete: function () {
							var chartInstance = this.chart,
							ctx = chartInstance.ctx;
							var fontSize = 18
							// 폰트 기본값 : Chart.defaults.global.defaultFontSize
							ctx.font = Chart.helpers.fontString(fontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = 'red';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';

							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = dataset.data[index];							
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
			    
			};
        	
        	var myBarChart = new Chart(ctx, {
        	    'type': 'bar',
        	    'data': data,
        	    'options': options
        	});
        	
        	
        })
        
        // 시작일부터 종료일까지의 날짜들을 배열로 반환하는 함수
        function getDateRangeData(param1, param2){  //param1은 시작일, param2는 종료일이다.
			var res_day = [];
		 	var ss_day = new Date(param1);
		   	var ee_day = new Date(param2);    	
		  		while(ss_day.getTime() <= ee_day.getTime()){
		  			var _mon_ = (ss_day.getMonth()+1);
		  			_mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
		  			var _day_ = ss_day.getDate();
		  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;
		   			res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
		   			ss_day.setDate(ss_day.getDate() + 1);
		   	}
		   	return res_day;
		}
        
        
       function  getDataList( startdate, enddate ) {
    	   
    	   let url = "${pageContext.request.contextPath}/Attendance/getDailyAtt.kosmo"
    	   let data = {
    	 		'startdate' : startdate,
    	 		'enddate' : enddate,
    	   }
    	   $.getJSON( url, data, function(list) {
    		   console.log(list)
    		   $.each(list, function(key, value) {
    			   let day = new Date(value.att_date)
    			   dateList.push( dateFormat(day) )
    			   workTimeList.push( value.att_worktime )
    			   
//     			   console.log(day)
//     			   console.log(dateFormat(day))
//     			   console.log(value.att_worktime)
               });
    	   })
    	   
       }
       
       function dateFormat(date) {
    	   let year = '' + date.getFullYear()
    	   let month = date.getMonth()
    	   month = (month < 9) ? "0" + (month+1) : month+1
    	   let day = date.getDate()
    	   day = (day <= 9) ? ("0" + day) : day
    	   
    	   let format = year + "-" + month + "-" + day
    			   
    	   return format
       }
</script>
</body>
</html>























