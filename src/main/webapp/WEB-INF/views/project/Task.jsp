<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="loginId"><sec:authentication property="principal.username"/></c:set>

<style>
.btn-outline-info{
	width:70px;
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
			<div class="col-sm-8">
				<div class="row flex-grow">
                   <div class="col-12 grid-margin stretch-card">
                     <div class="card card-rounded">
                       <div class="card-body">
                        <div class="d-sm-flex justify-content-between align-items-start">
                           <div>
                             <h4 class="card-title card-title-dash">개인업무 리스트</h4>
                            <p class="card-subtitle card-subtitle-dash total-task-no" id="${selectTaskList.map['totalRecordCount']}">진행중인 업무 수 : ${selectTaskList.map['totalRecordCount']}</p>
                           </div>
                           <div>
                             <button class="btn btn-primary btn-lg text-white mb-0 me-0 dropdown-item" data-toggle="modal" data-target="#task-Create-Modal" data-whatever="@mdo" id="task_create" type="button">
	                             <i class="mdi mdi-account-plus"></i>
	                             개인업무 추가
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
                                       <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
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
                             <c:if test="${!(empty selectTaskList.lists)}" var="isNotEmpty">         
                               <c:forEach var="item" items="${selectTaskList.lists}" varStatus="vs">
                               <tr id="${selectTaskList.lists[vs.index].TASK_NO}">
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                   	 <c:if test="${selectTaskList.lists[vs.index].PROJECT_NO !=0}">
                                     	<button type="button" class="btn btn-outline-info btn-fw mt-2" disabled>Project</button>
                                     	<div>
	                                       <h6 class="mt-1">${selectTaskList.lists[vs.index].TASK_NAME}</h6>
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
	                                	<div class="badge badge-opacity-warning task-badge-progress" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">In progress</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '요청'}">
	                                	<div class="badge badge-opacity-danger task-badge-request" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">Request</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '피드백'}">
	                                	<div class="badge badge-opacity-info task-badge-feedback" id="${selectTaskList.lists[vs.index].TASK_PROGRESS}">Feedback</div>
	                                </c:if>
	                                <c:if test="${selectTaskList.lists[vs.index].TASK_CATEGORY eq '완료'}">
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
                 </div>
			</div>
			<div class="col-sm-4">
				<!-- 체크리스트 카드 바디 시작 -->
                <div class="row flex-grow">
                  <div class="col-12 grid-margin stretch-card">
                    <div class="card card-rounded">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-lg-12">
                            <div class="d-flex justify-content-between align-items-center">
                              <h4 class="card-title card-title-dash">체크리스트</h4>
                              <div class="add-items d-flex mb-0 pt-2">
                                <!-- <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?"> -->
                                <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-add-btn">
                                	<i class="mdi mdi-plus checklist-add-btn" data-toggle="modal" data-target="#check-Add-Modal" id="check_add"></i>
                                </button>
                                <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-remove-btn"><i class="mdi mdi-minus"></i></button>
                              </div>
                            </div>
                            <!-- 체크리스트 다이브 영역 시작 -->
                                    <div class="list-wrapper overflow-y-scroll" >
                                      <!-- 체크리스트 목록 ul 태그 시작 -->
                                      <ul class="todo-list todo-list-rounded project-todo-list-ulelement-custom">
                                         <c:if test="${!(empty selectListCheck)}" var="isNotEmpty">         
                                  			<c:forEach var="item" items="${selectListCheck}" varStatus="vs">
                                        		<li class="border-bottom-0 px-3">
									            <div class="form-check w-100">
									              <label class="form-check-label">
									                <input class="checkbox todo-list-chbox" type="checkbox" id="${selectListCheck[vs.index].CL_NO}">${selectListCheck[vs.index].CL_CONTENT}
									                <i class="input-helper rounded"></i>
									              </label>
									              <div class="d-flex mt-2">
									                <div class="ps-4 text-small me-3">${fn:substring(selectListCheck[vs.index].CL_DEADLINE,0,10)}</div>
								              		<c:if test="${selectListCheck[vs.index].CL_CATEGORY=='요청'}" var="isNotEmpty">								            
								              			<div class="badge badge-opacity-warning me-3">요청</div>
								              		</c:if>
								              		<c:if test="${selectListCheck[vs.index].CL_CATEGORY=='피드백'}" var="isNotEmpty">								            
								              			<div class="badge badge-opacity-info me-3">${selectListCheck[vs.index].CL_CATEGORY}</div>
								              		</c:if>
								              		<c:if test="${selectListCheck[vs.index].CL_CATEGORY=='진행'}" var="isNotEmpty">								            
								              			<div class="badge badge-opacity-success me-3">${selectListCheck[vs.index].CL_CATEGORY}</div>
								              		</c:if>
								              		<c:if test="${selectListCheck[vs.index].CL_CATEGORY=='완료'}" var="isNotEmpty">								            
								              			<div class="badge badge-opacity-secondary me-3">${selectListCheck[vs.index].CL_CATEGORY}</div>
								              		</c:if>
										            </div>
										        </div>
										      </li>
                                        	</c:forEach>
                                        </c:if>
                                        <p class="checklist-place"/>
                                      </ul>
                                      <!-- 체크리스트 목록 ul 태그 끝 -->
                                    </div>
                                    <!-- 체크리스트 다이브 영역 끝 -->
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 체크리스트 카드 바디 끝 -->
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
		</div>
	</div>
</div>
<!-- 업무 생성 모달 시작 - 부트스트랩 -->
<div class="modal fade" id="task-Create-Modal" aria-labelledby="task-Create-Modal-Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
    	<form action="/NodeArchive/Task/create.kosmo">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">업무 생성</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
          	<label for="task_m_id" class="col-form-label">업무 담당자:</label>
            <input type="text" class="form-control" id="task_m_id" name="m_id" value="${loginId}" disabled required>
          	<div class="form-check form-check-flat form-check-primary">
	           
	        </div>
	        <label for="project_name" class="col-form-label">프로젝트명:</label>
            <input type="text" class="form-control" id="t_create_project_name" name="project_name" disabled required>
            <input type="hidden" class="form-control" id="t_create_project_no" name="project_no" required >
            <label for="task_name" class="col-form-label">업무명:</label>
            <input type="text" class="form-control" id="task_name" name="task_name" required>
            <label for="task_content" class="col-form-label">업무 내용:</label>
            <input type="text" class="form-control" id="task_content" name="task_content" required>
            <label for="project-start-date" class="col-form-label">업무 시작일:</label>
           	<input type="text" class="form-control" name="set_startdate" placeholder="yyyy-mm-dd" required>
            <label for="project-end-date" class="col-form-label">업무 마감일:</label>
			<input type="text" class="form-control" name="set_enddate" placeholder="yyyy-mm-dd" required>
          	<div class="mt-3">
          		<label id="select-task-category" >업무 카테고리:</label>
		    	<select class="js-example-basic-single w-200" name="task_category" data-dropdown-parent="#select-task-category">
		      		<option value="">업무 카테고리를 선택하세요</option>
		       		<option value="요청">요청</option>
		       		<option value="진행">진행</option>
		       		<option value="피드백">피드백</option>
		       		<option value="완료">완료</option>
		     	</select>
            </div>  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	        <button type="submit" class="btn btn-primary" >Create</button>
	      </div>
    	</form>
    </div>
  </div>
</div>
<!-- 업무 생성 모달 끝 - 부트스트랩 -->
<!-- 체크리스트 추가 모달 시작 - 부트스트랩 -->
<div class="modal fade" id="check-Add-Modal" aria-labelledby="check-Add-Modal-Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <form class="checklist-add-form">
		  <div class="modal-header">
		    <h5 class="modal-title" id="exampleModalLabel">체크리스트 추가</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
		  </div>
	      <div class="modal-body">
			<label for="task_m_id" class="col-form-label">체크 내용</label>
			<input type="text" class="form-control" id="modal_checklist_content" name="cl_content" required>
	        <label for="cl_deadline" class="col-form-label">만료 기간</label>
	        <input type="text" class="form-control" id="modal_checklist_end_date" name="cl_deadline" placeholder="yyyy-mm-dd" required>
	       	<div class="mt-3">
	       		<label>카테고리:</label>
		    	<select class="js-example-basic-single w-200" name="cl_category" id="modal_checklist_category" data-dropdown-parent="#check-Add-Modal">
		      		<option value="">카테고리를 선택하세요</option>
		       		<option value="요청">요청</option>
		       		<option value="진행">진행</option>
		       		<option value="피드백">피드백</option>
		       		<option value="완료">완료</option>
		     	</select>
		    </div>  
	     </div>
	     <div class="modal-footer">
	       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	       <button type="button" class="btn btn-primary checklist-submit-btn" data-dismiss="modal">Create</button>
	     </div>
     	</form>
    </div>
  </div>
</div>
<!-- 체크리스트 추가 모달 끝 - 부트스트랩 -->
<script>
//[1] 프로그래스바 제어 
$(document).ready(function(){
  //프로그래스 바를 클릭
  $('.task-progress').click(function(e){
      // 변수 x는 .progress의 left값에서 클릭한 위치의 X값을 뺀다.
      // e.pageX는 화면에서 클릭한 X의 위치를 가져온다. 
      var x = e.pageX - $('.task-progress').offset().left;
      //변수 clickPercentage는 변수 x / .progress.너비
      clickPercentage = x / $('.task-progress').width();
      //.state의 너비는 (.progress의 너비에서 변수 clickPercentage를 곱한 값);
      var task_progress = Math.floor(clickPercentage * 100)+1;
      $(this).children('.task-progress-bar').css("width",task_progress+'%');
      //Math.floor() 소수점 버림, 정수를 반환하는 함수
      $(this).parent().children().children('.progress-range').text(task_progress+'%');
      $(this).parent().children().children().children('.task-percent').text(task_progress);
      /////프로그래스바 제어 끝
      //변경된 진행도 값 저장
      var task_no = $(this).parent().parent().parent().prop("id");
      $.ajax({
  	    url:'<c:url value="/Task/updateprog.kosmo"/>',
  	    method:'post',   
  	    data: {
  	    	task_no,task_progress
  	    },
  	    dataType:'json' // text, xml, json, script, html
  	  }).done(function(data){
  	    	console.log('서버로부터 받은 데이타:',data);
  	    	
  	 }).fail(function(error){
  	    	console.log('%O',error);
  	});
     
  })
})
/////
//[3]체크리스트 추가 / 삭제용 ajax
$(".checklist-submit-btn").click(function(e){
	var cl_content = $('#modal_checklist_content').val();
	var cl_deadline = $('#modal_checklist_end_date').val();
	var cl_category = $('#modal_checklist_category').val();  
	$.ajax({
	    url:'<c:url value="/Project/addchecklist.kosmo"/>',
	    method:'post',   
	    data: {            
	    	cl_content,cl_deadline,cl_category
	    },
	    dataType:'json' // text, xml, json, script, html
	 }).done(function(data){
	    	console.log('서버로부터 받은 데이타:',data);
	    	//$('#checklist_content:last-child').append(checkContent);
	    	var source = '<li class="border-bottom-0"> '+
	            '<div class="form-check w-100"> '+
	              '<label class="form-check-label"> '+
	                '<input class="checkbox todo-list-chbox" type="checkbox">'+ cl_content +
	                '<i class="input-helper rounded"></i> '+
	              '</label> '+
	              '<div class="d-flex mt-2"> '+
	                '<div class="ps-4 text-small me-3">'+ cl_deadline +'</div> ';
              if(cl_category=='요청'){
              source +='<div class="badge badge-opacity-warning me-3">'+ cl_category +'</div> '+
		               '</div> '+
		            '</div> '+
		          '</li>'
              };
              if(cl_category=='피드백'){
                  source +='<div class="badge badge-opacity-info me-3">'+ cl_category +'</div> '+
	               '</div> '+
	            '</div> '+
	          '</li>'
         	  };
         	  if(cl_category=='진행'){
                 source +='<div class="badge badge-opacity-success me-3">'+ cl_category +'</div> '+
	               '</div> '+
	            '</div> '+
	          '</li>'
        	  };
        	  if(cl_category=='완료'){
                  source +='<div class="badge badge-opacity-secondary me-3">'+ cl_category +'</div> '+
 	               '</div> '+
 	            '</div> '+
 	          '</li>'
         	  };
         	 $('.checklist-place').after(source);
         	 $('#check-Add-Modal').find('form')[0].reset();
	 }).fail(function(error){
		   	console.log('%O',error);
	});
});
//삭제 쿼리 - 확인 필요
var cl_no = new Array();
$('.todo-list-chbox').click(function(e){
	var cl_noId = $(this).prop("id");
	cl_no.push(cl_noId);
	console.log('cl_no:',cl_no);
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
/////[3]

//[4]도넛 파이데이터 스크립트 데이터
// 차트를 그럴 영역을 dom요소로 가져온다.
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
// 차트를 생성한다. 
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
////////[4]

</script>

