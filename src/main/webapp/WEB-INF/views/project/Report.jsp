<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="loginId"><sec:authentication property="principal.username"/></c:set>

<style>
.form-control{
	width:500px;
	height:40px;
}
.form-textarea {
    width: 100%;
    height: 8.25em;
    resize: none;
}
.badge-opacity-info {
    background: #72a3f76b;
    color: #0c5573;
}
.badge-opacity-danger {
    background: #e35d2b5c;
    color: #693a0ede;
}


</style>
<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
		<div class="row">
			<!-- 좌측 페이지 시작 -->
			<div class="col-sm-5">
				<div class="card">
	                <div class="card-body">
	                  <h4 class="card-title">리포트 목록</h4>
	                  <p class="card-description">
	                    Add class <code>.table</code>
	                  </p>
	                  <div class="table-responsive">
	                    <table class="table">
	                      <thead>
	                        <tr>
	                          <th>생성자</th>
	                          <th>리포트 제목</th>
	                          <th>생성일</th>
	                          <th>카테고리</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <tr>
	                          <td>Jacob</td>
	                          <td>53275531</td>
	                          <td>12 May 2017</td>
	                          <td><label class="badge badge-danger">Pending</label></td>
	                        </tr>
	                        <tr>
	                          <td>Messsy</td>
	                          <td>53275532</td>
	                          <td>15 May 2017</td>
	                          <td><label class="badge badge-warning">프로젝트</label></td>
	                        </tr>
	                        <tr>
	                          <td>John</td>
	                          <td>53275533</td>
	                          <td>14 May 2017</td>
	                          <td><label class="badge badge-info">Fixed</label></td>
	                        </tr>
	                        <tr>
	                          <td>Peter</td>
	                          <td>53275534</td>
	                          <td>16 May 2017</td>
	                          <td><label class="badge badge-success">개인업무</label></td>
	                        </tr>
	                        <tr>
	                          <td>Dave</td>
	                          <td>53275535</td>
	                          <td>20 May 2017</td>
	                          <td><label class="badge badge-warning">In progress</label></td>
	                        </tr>
	                      </tbody>
	                    </table>
		              </div>
		          </div>
		       </div>
			</div>
			<!-- 좌측 페이지 끝 -->
			<!-- 우측 페이지 시작 -->
			
			<div class="col-sm-7">
				<!-- 업무 테이블 카드 영역 시작 -->
				<div class="row flex-grow">
                   <div class="col-12 grid-margin stretch-card">
                     <div class="card card-rounded">
                       <div class="card-body">
                        <div class="d-sm-flex justify-content-between align-items-start">
                           <div>
                             <h4 class="card-title card-title-dash">업무 목록</h4>
                            <p class="card-subtitle card-subtitle-dash total-task-no" id="${selectTaskList.map['totalRecordCount']}">진행중인 업무 수 : ${selectTaskList.map['totalRecordCount']}</p>
                           </div>
                           <div>
                             <button class="btn btn-primary btn-lg text-white mb-0 me-0 dropdown-item report-create-btn" data-toggle="modal" data-target="#report-Create-Modal" data-whatever="@mdo" id="report_create" type="button">
	                             <i class="mdi mdi-account-plus"></i>
	                             새 리포트 생성
                             </button>
                           </div>
                         </div>
                         <div class="table-responsive  mt-1">
                           <table class="table select-table">
                             <thead>
                               <tr>
                                 <th>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                       <input type="checkbox" class="form-check-input task-all-check" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </th>
                                 <th>Task</th>
                                 <th>DeadLine</th>
                                 <th>Progress</th>
                                 <th>Status</th>
                               </tr>
                             </thead>
                             <tbody>
                             <!-- 업무 리스트 시작 : 아이디 정보로 조회-->
                             <c:set var="progress" value="0"/>   
                             <c:set var="request" value="0"/> 
                             <c:set var="feedback" value="0"/> 
                             <c:set var="complete" value="0"/> 
                             <c:if test="${!(empty selectTaskList.lists)}" var="isNotEmpty">         
                               <c:forEach var="item" items="${selectTaskList.lists}" varStatus="vs">
                                                         
                               <tr id="${selectTaskList.lists[vs.index].TASK_NO}">
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input task-check" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                   	 <c:if test="${selectTaskList.lists[vs.index].PROJECT_NO !=0}">
                                     	<button type="button" class="btn btn-outline-info btn-fw mt-2" disabled>Project</button>
                                     	<div>
	                                       <h6 class="mt-1 task-name-tag">${selectTaskList.lists[vs.index].TASK_NAME}</h6>
	                                       <p class="mt-1">${selectTaskList.lists[vs.index].PROJECT_NAME}</p>
	                                     </div>                     
                                     </c:if>
                                     <c:if test="${selectTaskList.lists[vs.index].PROJECT_NO ==0}">
                                     	<button type="button" class="btn btn-outline-info btn-fw mt-2" disabled>Personal</button>
                                     	<div>
	                                       <h6 class="mt-1">${selectTaskList.lists[vs.index].TASK_NAME}</h6>
	                                       <p class="mt-1">-</p>
	                                     </div>                         
                                     </c:if>                                
                                   </div>
                                 </td>
                                 <td>
                                   <h6>${fn:substring(selectTaskList.lists[vs.index].SCHE_ENDDATE,0,10)}</h6>
                                   <p class="task-d-day">D${selectTaskList.lists[vs.index].Ddays}</p>
                                 </td>
                                 <!-- 프로그래스바 테스트 시작 -->
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success progress-range">${fn:substring(selectTaskList.lists[vs.index].TASK_PROGRESS,0,3)}%</p>
                                       <p><b class="task-percent">${fn:substring(selectTaskList.lists[vs.index].TASK_PROGRESS,0,3)}</b>/100</p>
                                     </div>
                                     <div class="progress progress-md task-progress">
                                       <c:if test="${(selectTaskList.lists[vs.index].TASK_PROGRESS gt 0) and (selectTaskList.lists[vs.index].TASK_PROGRESS lt 30)}">
	                                	 <div class="progress-bar bg-danger task-progress-bar" role="progressbar" style="width:${selectTaskList.lists[vs.index].TASK_PROGRESS}%"></div>
		                               </c:if>
		                               <c:if test="${(selectTaskList.lists[vs.index].TASK_PROGRESS gt 30) and (selectTaskList.lists[vs.index].TASK_PROGRESS lt 60)}">
		                                 <div class="progress-bar bg-warning task-progress-bar" role="progressbar" style="width:${selectTaskList.lists[vs.index].TASK_PROGRESS}%"></div>
		                               </c:if>
		                               <c:if test="${(selectTaskList.lists[vs.index].TASK_PROGRESS gt 60) and (selectTaskList.lists[vs.index].TASK_PROGRESS le 100)}">
		                                 <div class="progress-bar bg-success task-progress-bar" role="progressbar" style="width:${selectTaskList.lists[vs.index].TASK_PROGRESS}%"></div>
		                               </c:if>  
                                       <div class="progress-state"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                 	<c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '진행'}">
	                                	<c:set var="progress" value="${progress+1}"/>
	                                	<div class="badge badge-opacity-warning task-badge-progress" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">In progress</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '요청'}">
	                                	<c:set var="request" value="${request+1}"/>
	                                	<div class="badge badge-opacity-danger task-badge-request" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">Request</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '피드백'}">
	                                	<c:set var="feedback" value="${feedback+1}"/>
	                                	<div class="badge badge-opacity-info task-badge-feedback" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">Feedback</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '완료'}">
	                                	<c:set var="complete" value="${complete+1}"/>
	                                	<div class="badge badge-opacity-success task-badge-complete" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">Completed</div>
	                                </c:if>
	                             </td>
                                 <!-- 프로그래스바 테스트 끝 -->
                                 </c:forEach>
                               </c:if>
                               <!-- 업무 리스트 끝 -->
                             </tbody>
                           </table>
                         </div>
                       </div>
                     </div>
                   </div>
                   <!-- 업무 테이블 카드 영역 끝 -->
                   <div class="row">
                   	<div class="col-sm-6">
	                   	<!-- 차트 시작 -->
		                <div class="card">
		                	<div class="card-body">
		                		<div class="chartjs-size-monitor">
		                			<div class="chartjs-size-monitor-expand">
		                				<div class="">
		                				</div>
		                			</div>
			                		<div class="chartjs-size-monitor-shrink">
			          					<div class="">
			                			</div>
			                		</div>
			                	</div>
			                  	<h4 class="card-title">총 업무 진행도</h4>
			                  	<canvas id="doughnutChart" width="336" height="167" style="display: block; height: 134px; width: 269px;" class="chartjs-render-monitor"></canvas>
		                	</div>
		                </div>
		                <!-- 차트 끝 -->
                   </div>
                   <div class="col-sm-6">
                   	 <div class="card">
		                <div class="card-body">
		                  <h4 class="card-title text-primary">금주의 업무 카테고리</h4>
		                  <p class="card-description">
		                    금주간 진행된 업무 리스트를 분석한 결과
		                  </p>
		                  <p class="text-lowercase">
		                    금주의 업무는 "요청" ${request}개, "피드백" ${feedback}개, "진행" ${progress}개, "완료" ${complete}개 입니다.
		                  </p>
		                </div>
		                <div class="card-body">
		                  <h4 class="card-title text-danger">1주전과 비교</h4>
		                  <p class="card-description">
		                    지난 주 업무 완료도와 비교한 결과 
		                  </p>
		                  <p class="text-lowercase">
		                    직전 주에 비교하여 약 ${feedback}% 완료되었습니다. (지난주 ${feedback}%, 이번주 ${feedback})
		                  </p>
		                </div>
		              </div>
                   </div>
                 </div>
				</div>
			</div>
			
			<!-- 우측 페이지 끝 -->
		 </div>
	</div>
</div>
<!-- 리포트 생성 모달 시작 - 부트스트랩 -->
<div class="modal fade" id="report-Create-Modal" aria-labelledby="report-Create-Modal-Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
	    <div class="modal-header">
	       <h5 class="modal-title" id="exampleModalLabel">리포트 생성</h5>
	       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         <span aria-hidden="true">&times;</span>
	       </button>
	     </div>
    	 <div class="tab-content tab-content-basic">
			<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
				<div class="row">
					<!-- 좌측 페이지 시작 -->
					<div class="col-sm-5">
						<form action="/NodeArchive/Task/create.kosmo">
					      <div class="modal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
				          	<label for="report_m_id" class="col-form-label">작성자:</label>
				            <input type="text" class="form-control" id="report_m_id" name="m_id" value="${loginId}" required>
					        <label for="report_name" class="col-form-label">리포트 제목:</label>
				            <input type="text" class="form-control" id="create_report_name" name="report_name" required>
				            <input type="hidden" class="form-control" id="create_report_no" name="report_no" required >
				            <div class="mt-3">
					       		<label>카테고리:</label>
						    	<select class="js-example-basic-single w-200" name="report_category" id="report-category" data-dropdown-parent="#report-Create-Modal">
						      		<option value="">카테고리를 선택하세요</option>
						       		<option value="프로젝트">프로젝트</option>
						       		<option value="개인업무">개인업무</option>						      
						     	</select>
						    </div>  
				            <label for="report_startdate" class="col-form-label">시작일:</label>
				           	<input type="text" class="form-control" name="report_startdate" placeholder="yyyy-mm-dd" required>
				            <label for="report_endtdate" class="col-form-label">마감일:</label>
							<input type="text" class="form-control" name="report_endtdate" placeholder="yyyy-mm-dd" required>
				          	<label for="report-comment" class="col-form-label">코멘트:</label>
				            <textarea class="form-control form-textarea" id="report-comment" wrap="hard" name="report-comment" placeholder="내용을 입력해 주세요." required ></textarea>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					        <button type="submit" class="btn btn-primary" >Create</button>
					      </div>
				    	</form>
					</div>
					<div class="col-sm-7" style="padding-right:30px;">
						<!-- 우측 페이지 시작  -->
						<!-- 선택된 업무 리스트 -->
						<div class="col-md grid-margin grid-margin-md-0 stretch-card">
			              <div class="card">
			                <div class="card-body">
			                  <div class="row">
			                	<div class="col-sm-6">
				                  <h4 class="card-title">보고 업무 리스트</h4>
				                  <p class="card-description">Add class <code>.list-ticked</code> to <code>&lt;ul&gt;</code></p>
				                  <ul class="list-ticked">
				                  	<span class="task-lists"></span>			                    
				                  </ul>
				                </div>
				                <div class="col-sm-6">
				                  <h4 class="card-title">총 업무 진행도</h4>
		                  		  <canvas id="report-doughnutChart" width="336" height="167" style="display:block; height:134px; width:269px;" class="chartjs-render-monitor"></canvas>
				                </div>
				              </div>
				              <div class="row">
				              	<h4 class="card-title">Headings with secondary text</h4>
					                <p class="card-description">
					                  Add faded secondary text to headings
					                </p>
					                <div class="template-demo">
					                  <h3>
					                    코멘트 타이틀
					                    <small class="text-muted">
					                      상세 코멘트
					                    </small>
					                  </h3>			                
					                </div>
				              </div>
				            </div>
				          </div>
		                </div>
		                <!-- 우측 페이지 끝  -->
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
</div>
<!-- 리포트 생성 모달 끝 - 부트스트랩 -->
<script>
//[1]도넛 파이데이터 스크립트 데이터
//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('doughnutChart').getContext('2d');
var totalTask = $('.total-task-no').prop('id');
var progresslen = $('.task-badge-progress').length;
var progressPer=0;
$('.task-badge-progress').each(function(index, item){
 progressPer = Number(progressPer)+Number($(item).prop('id'));
});
console.log("progressPer:",progressPer);
var requestlen = $('.task-badge-request').length;
var requestPer=0;
$('.task-badge-request').each(function(index, item){
	requestPer = Number(requestPer)+Number($(item).prop('id'));
});
var feedbacklen = $('.task-badge-feedback').length;
var feedbackPer=0;
$('.task-badge-feedback').each(function(index, item){
	feedbackPer = Number(feedbackPer)+Number($(item).prop('id'));
});
var completelen = $('.task-badge-complete').length;
var completePer=0;
$('.task-badge-complete').each(function(index, item){
	completePer = Number(completePer)+Number($(item).prop('id'));
});
//차트를 생성한다. 
var myChart = new Chart(chartArea, {
 // ①차트의 종류(String)
 type: 'doughnut',
 // ②차트의 데이터(Object)
 data: {
     // ③x축에 들어갈 이름들(Array)
     labels: ['Progress', 'Request', 'Feedback', 'Complete'],
     // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
     datasets: [{
         // ⑤dataset의 이름(String)
         label: '#업무카테고리',
         // ⑥dataset값(Array)
         data: [(progressPer/totalTask), (requestPer/totalTask), (feedbackPer/totalTask), (completePer/totalTask)],
         // ⑦dataset의 배경색(rgba값을 String으로 표현)
         backgroundColor:[
             'rgba(255, 99, 132, 0.5)',
             'rgba(54, 162, 235, 0.5)',
             'rgba(255, 206, 86, 0.5)',
             'rgba(75, 192, 192, 0.5)'            
           ],
         // ⑧dataset의 선 색(rgba값을 String으로 표현)
         borderColor: [
             'rgba(255,99,132,1)',
             'rgba(54, 162, 235, 1)',
             'rgba(255, 206, 86, 1)',
             'rgba(75, 192, 192, 1)',                
           ],
         // ⑨dataset의 선 두께(Number)
         borderWidth: 1
     }]
 },
 // ⑩차트의 설정(Object)
 options: {
     // ⑪축에 관한 설정(Object)
     scales: {
         // ⑫y축에 대한 설정(Object)
         y: {
             // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
             beginAtZero: true
         }
     }
 }
});
////////[1]

//[2] 업무 선택 체크박스 - 전체선택 체크박스 설정
$('.task-all-check').click(function(){
	var checked = $('.task-all-check').is(':checked');
	if(checked)
		$('.task-check').prop('checked',true);
	if(!checked)
		$('.task-check').prop('checked',false);
	
});
/////////[2]
//[3] 체크된 업무 정보 모달로 전달하기
$('.report-create-btn').click(function(){
	$('.task-check:checked').each(function(index, item){
		var tr = $(item).parent().parent().parent().parent();
		var tid = tr.prop('id');
		console.log(tid);
		var tname = tr.find('.task-name-tag').html();
		console.log(tname);
		
		
		
		var source = '<li>'+ tname +'</li>'
		$('.task-lists').after(source);
	})
});

/*
$('.todo-list-del-btn').click(function(e){
	console.log('cl_no:',cl_no);
	$.ajax({
	    url:'<c:url value="/Project/delchecklist.kosmo"/>',
	    method:'post',   
	    data: {            
	    	cl_no:JSON.stringify(cl_no)
	    },
	    dataType:'json' // text, xml, json, script, html
	 }).done(function(data){
	    	console.log('서버로부터 받은 데이타:',data);
	        //체크된 li 아이템들은 삭제 처리
	        var checkedList = $(".todo-list-chbox");
	        checkedList.each(function(index, item){
	    		var checked = $(this).is(':checked');
	        	if(checked){
	    			$(this).parent().parent().parent().remove();
		        }
	    	});
	 }).fail(function(error){
		   	console.log('%O',error);
	 });
});
});
*/

///////[3]

</script>
