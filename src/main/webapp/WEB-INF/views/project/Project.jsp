<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="loginId"><sec:authentication property="principal.username"/></c:set>
<style>
/* project.jsp start */
.project-list-accordion-bgCustom{
  border-radius: 20px;
  background-color: rgba(229, 223, 214, 70%);
  margin-bottom: 5px;
}
.project-list-accordion-card-header{
  background-color: #ffffff00;
  border-bottom: none;
}
.project-list-accordion-card-body{
  background-color: rgba(255, 255, 255, 0.644);
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
}
.project-list-ul-custom{
  margin-top: 3px;
  margin-bottom: 3px;
  font-size: .95rem;
  display: flex;
  justify-content: space-between;
}
.project-list-a-icon9{
  color: gray;
  font-style: normal;
}
.project-list-a-icon9:hover{
  color: #D1CCC5 ;
}
.project-list-btn-dropdownbtn{
  margin: 0px !important;
  border-color: #D1CCC5 !important;
}
.project-dropdown-btngroup-border-leftonly{
  border: none !important;
  border-left: 1px solid #D1CCC5 !important;
}
.select2-results__option {
  white-space: nowrap;
}
.select2.select2-container {
  width: 100% !important;
}
.badge-opacity-info {
    background: #97d7f2;
    color: #08597b;
}
.badge-opacity-secondary {
    background: #d8d8d8;
    color: #8d8a8a;
}
/* project.jsp end */
</style>



<div class="d-sm-flex align-items-center justify-content-between border-bottom">
<!----Main Page의 Nav 메뉴 작성---->
</div>  

<div class="tab-content tab-content-basic">
	<div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
		<div class="row">
			<div class="col-sm-8">
                        <div class="row flex-grow">
                          <div class="col-12 col-lg-4 col-lg-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <!-- 카드 바디 시작 -->
                              <div class="card-body" style="padding-bottom:35px;">
								<div class="d-sm-flex justify-content-between align-items-start mb-3">
                                  <ul class="list-unstyled project-list-ul-custom fg-1">
									<li>
                                      프로젝트 목록 
                                    </li>
                                    <li>
                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly" type="button" id="project-dropdown-setting-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-solid fa-gear"></i> 
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="project-dropdown-setting-button">
                                        <a class="dropdown-item" data-toggle="modal" data-target="#project-Create-Modal" data-whatever="@mdo" id="project_create">프로젝트 추가</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href='<c:url value="/Project/list.kosmo?order=enddate"/>'>마감빠른순 정렬</a>
                                        <div class="dropdown-divider"></div>
										<a class="dropdown-item" href='<c:url value="/Project/list.kosmo"/>'>프로젝트순 정렬</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">내 업무만 표시</a>
                                        <div class="dropdown-divider"></div>
                                      </div>
                                    </li>
                                  </ul>
                                </div>
                              <div id="project-list-accordion">                      
                                  <c:if test="${!(empty projectList.lists)}" var="isNotEmpty">         
                                  	<c:forEach var="item" items="${projectList.lists}" varStatus="vs">
                                  	 <!-- 프로젝트 하나 시작 , href=#프로젝트일련번호 -->	                                  
	                                  <div class="card project-list-accordion-bgCustom">
	                                    <div class="btn-group" role="group" style="height: 50px;">
	                                      <!-- href=#프로젝트일련번호 -->
	                                      <div class="card-header card-link hover project-list-accordion-card-header btn fg-10 project-list-btn-dropdownbtn" data-toggle="collapse" href="#project${projectList.lists[vs.index].PROJECT_NO}" style="border:none; flex-grow:15;">
	                                        <span id="${projectList.lists[vs.index].PROJECT_NO}" class="project-list-ul-custom project-span" style="line-height:25px">${projectList.lists[vs.index].PROJECT_NAME}</span>	                                        	                                     
	                                      </div>
	                                      <!-- 드롭다운 쓰리닷 메뉴 시작, id=프로젝트일련번호-dropdown-menu-button -->
	                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly project-foreach-setting" type="button" name="${projectList.lists[vs.index].PROJECT_NAME}" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                        <i class="fa fa-light fa-bars" name="${projectList.lists[vs.index].PROJECT_NAME}"></i>
	                                      </button>
	                                      <div class="dropdown-menu" aria-labelledby="${projectList.lists[vs.index].PROJECT_NO}-dropdown-menu-button">
	                                        <a class="dropdown-item" href="#">공유</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" data-toggle="modal" data-target="#task-Create-Modal" data-whatever="@mdo" id="task_create">업무추가</a>	                                     
	                                        <span class="project-manager-span"></span>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="/schedule/Month.noa">캘린더</a>
	                                      </div>
	                                      <!-- 드롭다운 쓰리닷 메뉴 끝 -->
	                                    </div>
	                                    <!-- 프로젝트 업무 목록 시작 , id=프로젝트일련번호 -->
	                                    <div id="project${projectList.lists[vs.index].PROJECT_NO}" class="collapse" data-parent="#project-list-accordion">	                                    
	                                      <div class="card-body project-list-accordion-card-body">	                                        
	                                        <div class="table-reponsive overflow-x-scroll">
	                                        <p>프로젝트 담당자:<label class=" project-manager-label" style="line-height:25px; text-size:20px;">${projectList.lists[vs.index].M_ID}</label></p>
	                                          <table class="table table-stripped table-hover">	                                        
	                                            <thead>
	                                              <tr>
	                                                <th> 프로필 </th>
	                                                <th> 이름 </th>
	                                                <th> 업무명 </th>
	                                                <th> 진행도 </th>
	                                              </tr>
	                                            </thead>
	                                            <tbody>         
	                                              <c:if test="${!(empty projectList.lists[vs.index].tlists)}" var="isTNotEmpty">
	                                              <c:forEach var="titem" items="${projectList.lists[vs.index].tlists}" varStatus="ts">
		                                              <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
		                                              <tr>
		                                                <td class="py-1"> <img src="/webapp/projectResources/profile1.jpg" alt="프로필사진"/> </td>
		                                                <td>${projectList.lists[vs.index].tlists[ts.index].M_NAME}</td>
		                                                <td>${projectList.lists[vs.index].tlists[ts.index].TASK_NAME}</td>
		                                                <td> 
		                                                  <div class="progress">
		                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
		                                                  </div>
		                                                </td>
		                                              </tr>
	                                              </c:forEach>
	                                              </c:if>
	                                            </tbody>
	                                          </table>
	                                        </div>
	                                      </div>
	                                    </div>
	                                    <!-- 프로젝트 업무 목록 끝 -->
	                                  </div>
	                                  </c:forEach>
	                               </c:if>
	                               <!-- 프로젝트 하나 끝 -->        
                                </div>
                              </div>
                              <!-- 카드 바디 끝 -->
                            </div>
                          </div>
                        </div>                        
                     </div>
                      
                      <div class="col-sm-4">
                      	<!-- 프로젝트 구성원 카드 바디 시작 -->
                        <div class="row flex-grow">
                          <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="row">
                                  <div class="col-lg-12">
                                    <div class="d-flex justify-content-between align-items-center">
                                      <h4 class="card-title card-title-dash">프로젝트 참여자</h4>
                                      <div class="add-items d-flex mb-0 pt-2">
                                        <!-- <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?"> -->
                                        <!-- <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-add-btn"><i class="mdi mdi-plus"></i></button> -->
                                        <!-- <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-remove-btn"><i class="mdi mdi-minus"></i></button> -->
                                      </div>
                                    </div>
                                    <!-- 프로젝트 참여자 목록 영역 시작 -->
                                    <span id="insert-project-members"></span>
                                    <!-- 프로젝트 참여자 목록 영역 끝 -->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 프로젝트 구성원 카드 바디 끝 -->

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
                                        <span class="checklist-place"/>
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
                      </div>
                    </div>
	</div>
</div>
<!-- 프로젝트 생성 모달 시작 - 부트스트랩 -->
<div class="modal fade" id="project-Create-Modal" aria-labelledby="project-Create-Modal-Label" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="/NodeArchive/Project/create.kosmo">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">프로젝트 생성</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<label for="project-manager" class="col-form-label">프로젝트 담당자:</label>
	        <input type="text" class="form-control" id="project_manager" name="project_manager" value="${loginId}"disabled>
	      	<label for="project-name" class="col-form-label">프로젝트명:</label>
	        <input type="text" class="form-control" id="project_name" name="project_name" required>
	        <label for="project-start-date" class="col-form-label">프로젝트 시작일:</label>
	        <input type="text" class="form-control" id="set_startdate" name="set_startdate" required>
	        <label for="project-end-date" class="col-form-label">프로젝트 마감일:</label>
			<input type="text" class="form-control" id="set_enddate" name="set_enddate" required>
			<label id="select-project-members">프로젝트 멤버 선택:</label><br/>
			<select class="js-example-basic-multiple" multiple="multiple" name="member" data-dropdown-parent="#select-project-members">				      
			   <option value="kim1234@samsung.com" >kim1234@samsung.com</option>
			   <option value="park1234@samsung.com">park1234@samsung.com</option>
			   <option value="song1234@samsung.com">song1234@samsung.com</option>
			   <option value="hong1234@samsung.com">hong1234@samsung.com</option>
			</select>
	      </div>
		  <div class="modal-footer">
		    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		    <button type="submit" class="btn btn-primary">Create</button>
		  </div>
		</form>
    </div>
  </div>
</div>
<!-- 프로젝트 생성 모달 끝 - 부트스트랩 -->
<!-- 프로젝트 수정/삭제 모달 시작 - 부트스트랩 -->
<div class="modal fade" id="project-Edit-Modal" aria-labelledby="project-Edit-Modal-Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <form action="/NodeArchive/Project/update.kosmo">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">프로젝트 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<label for="project-manager" class="col-form-label">프로젝트 담당자:</label>
	        <input type="text" class="form-control" id="edit_project_manager" name="m_id" placeholder="${loginId}">
	      	<label for="project-name" class="col-form-label">프로젝트명:</label>
	        <input type="text" class="form-control" id="edit_project_name" name="project_name" required>
	        <label for="project-start-date" class="col-form-label">프로젝트 시작일:</label>
	        <input type="text" class="form-control" id="edit_set_startdate" name="set_startdate" required>
	        <label for="project-end-date" class="col-form-label">프로젝트 마감일:</label>
			<input type="text" class="form-control" id="edit_set_enddate" name="set_enddate" required>
			<label id="edit-project-members">프로젝트 멤버 선택:</label><br/>
			<select class="js-example-basic-multiple project-edit-select" multiple="multiple" name="member" data-dropdown-parent="#edit-project-members">				      
			   <option value="kim1234@samsung.com" >kim1234@samsung.com</option>
			   <option value="park1234@samsung.com">park1234@samsung.com</option>
			   <option value="song1234@samsung.com">song1234@samsung.com</option>
			   <option value="hong1234@samsung.com">hong1234@samsung.com</option>
			</select>
	      </div>
		  <div class="modal-footer">
		    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		    <button type="submit" class="btn btn-primary">Update</button>
		  </div>
		</form>
    </div>
  </div>
</div>
<!-- 프로젝트 수정/삭제 모달 끝 - 부트스트랩 -->
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
            <input type="text" class="form-control" id="task_m_id" name="m_id" value="${loginId}" required>
          	<div class="form-check form-check-flat form-check-primary">
	           <label class="form-check-label">
	             <input type="checkbox" class="form-check-input">
	             다른 멤버 선택
	           </label>
	        </div>
	        <label for="project_name" class="col-form-label">프로젝트명:</label>
            <input type="text" class="form-control" id="t_create_project_name" name="project_name" disabled required>
            <input type="hidden" class="form-control" id="t_create_project_no" name="project_no" required >
            <label for="task_name" class="col-form-label">업무명:</label>
            <input type="text" class="form-control" id="task_name" name="task_name" required>
            <label for="task_content" class="col-form-label">업무 내용:</label>
            <input type="text" class="form-control" id="task_content" name="task_content" required>
            <label for="project-start-date" class="col-form-label">업무 시작일:</label>
           	<input type="text" class="form-control" name="set_startdate" required>
            <label for="project-end-date" class="col-form-label">업무 마감일:</label>
			<input type="text" class="form-control" name="set_enddate" required>
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
			<input type="text" class="form-control" id="modal_checklist_content" name="modal_checklist_content" required>
	        <label for="project_name" class="col-form-label">만료 기간</label>
	        <input type="text" class="form-control" id="modal_checklist_end_date" name="modal_checklist_end_date" required>
	       	<div class="mt-3">
	       		<label>카테고리:</label>
		    	<select class="js-example-basic-single w-200" name="modal_checklist_category" id="modal_checklist_category" data-dropdown-parent="#check-Add-Modal">
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

//[1] 프로젝트 3dot 클릭시 이벤트
//1-1 : 업무 추가 목록에 프로젝트 정보 자동 로드하는 스크립트
//1-2 : 프로젝트 생성자와 사용자 정보 비교하여 프로젝트 수정/삭제 버튼 추가하기
//1-3 : 프로젝트 수정 버튼 클릭시 모달에 띄울 데이터 불러오는 ajax
$(".project-foreach-setting").click(function(e){
	e.stopPropagation();
	$('.project-edit-delete').remove();
	var projectNo = $(this).parent().children().children('.project-span').prop("id");
	console.log('projectNo:',projectNo)
	//1-1.
	var params=e.target.name;
	console.log(params);
	$('#t_create_project_name').val(params);
	//e.target.children('li')
	//var projectNo = $('.project-span').prop("id");
	console.log('projectNo:',projectNo);
	$('#t_create_project_no').val(projectNo);
	
	//1-2.
	var projManager = $('.project-manager-label').html()
	console.log('projManager:',projManager)
	var loginId = $('#project_manager').val();
	console.log('loginId:',loginId)
	if(projManager == loginId){
		$('.project-manager-span').after(
			'<div class="dropdown-divider project-edit-delete"></div>'+
            '<a class="dropdown-item project-edit-delete" data-toggle="modal" data-target="#project-Edit-Modal" data-whatever="@mdo" id="project_edit">수정</a>'+
            '<div class="dropdown-divider project-edit-delete"></div>'+
            '<a class="dropdown-item project-edit-delete" href="/NodeArchive/Project/delete.kosmo?project_no='+projectNo+'">삭제</a>'
		);
	}
	 
	//1-3.
	$("#project_edit").click(function(e){
		//projectNo = $(this).children('.project-span').prop("id");
		console.log('projectNoE:',projectNo);
		
		$.ajax({
		    url:'<c:url value="/Project/edit.kosmo"/>',
		    method:'post',   
		    data: {            
		        project_no:projectNo
		    },
		    dataType:'json' // text, xml, json, script, html
		 }).done(function(data){
		    	console.log('서버로부터 받은 데이타:',data);
		    	$('#edit_project_name').val(data.PROJECT_NAME);
		    	$('#edit_set_startdate').val(data.SCHE_STARTDATE);
		    	$('#edit_set_enddate').val(data.SCHE_ENDDATE);
		    	//$('#edit-project-members').val(data.MEMBER);
		    	
		 }).fail(function(error){
		    	console.log('%O',error);
		});
		
	
	/*휴전
		$('div.modal-body > span').remove();
		$('.project-edit-select').after(
				'<span class="select2 select2-container select2-container--default select2-container--above select2-container--focus" dir="ltr" data-select2-id="9" style="width: auto;">'+
				'<span class="selection">'+
				'<span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1" aria-disabled="false">'+
				'<ul class="select2-selection__rendered">'+
				'<li class="select2-selection__choice" title="kim1234@samsung.com" data-select2-id="32">'+
				'<span class="select2-selection__choice__remove" role="presentation">×</span>kim1234@samsung.com'+
				'</li>'+
				'<li class="select2-search select2-search--inline">'+
				'<input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="none" spellcheck="false" role="searchbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;">'+
				'</li>'+
				'</ul>'+
				'</span>'+
				'</span>'+
				'</span>'
				);*/
		/*
		var source = '<span class="select2-container select2-container--default select2-container--open" style="position: absolute; top: 226.3px; left: 26px;"><span class="select2-dropdown select2-dropdown--above" dir="ltr" style="width: 446.4px;"><span class="select2-results"><ul class="select2-results__options" role="listbox" aria-multiselectable="true" id="select2-member-p7-results" aria-expanded="true" aria-hidden="false"><li class="select2-results__option select2-results__option--highlighted" id="select2-member-p7-result-yulr-kim1234@samsung.com" role="option" aria-selected="false" data-select2-id="select2-member-p7-result-yulr-kim1234@samsung.com">kim1234@samsung.com</li><li class="select2-results__option" id="select2-member-p7-result-gfip-park1234@samsung.com" role="option" aria-selected="false" data-select2-id="select2-member-p7-result-gfip-park1234@samsung.com">park1234@samsung.com</li><li class="select2-results__option" id="select2-member-p7-result-j6pm-song1234@samsung.com" role="option" aria-selected="false" data-select2-id="select2-member-p7-result-j6pm-song1234@samsung.com">song1234@samsung.com</li><li class="select2-results__option" id="select2-member-p7-result-om21-hong1234@samsung.com" role="option" aria-selected="false" data-select2-id="select2-member-p7-result-om21-hong1234@samsung.com">hong1234@samsung.com</li></ul></span></span></span>';
		$('#edit-project-members').append(source);
		*/		
	})
});
/*
$(".fa").click(function(e){
	e.stopPropagation();
	var param=e.target.name;
	console.log(param);
	$('#t_create_project_name').val(param);
	
	projectNo = $('.project-span').prop("id");
	console.log('projectNo:',projectNo);
	$('#t_create_project_no').val(projectNo);
});
*/
////////////////[1]

//[2] 프로젝트 아코디언 클릭시 이벤트
//2-1. 해당 프로젝트 구성원 자동 로드하는 ajax
$(".project-list-accordion-card-header").click(function(e){
	$(".project_member_lists").remove();
	projectNo = $(this).children('.project-span').prop("id");
	console.log('projectNo:',projectNo);
	//2-1.
	$.ajax({
	    url:'<c:url value="/Project/viewmlist.kosmo"/>',
	    method:'post',   
	    data: {            
	        project_no:projectNo
	    },
	    dataType:'json' // text, xml, json, script, html
	 }).done(function(data){
	    	console.log('서버로부터 받은 데이타:',data);
	    	$.each(data , function(i){
	    		var project_member=data[i].M_NAME;
	    		console.log(project_member);
	    		$('#insert-project-members').after(
	    				  "<div class='project_member_lists'>"+
	    				  	"<div class='wrapper d-flex align-items-center py-2 border-bottom'>"+
			                  "<div class='d-flex align-items-center py-2'>"+
			                    "<img class='img-sm rounded-10' alt='profile-img' src='#'>"+
			                  "</div>"+
			                  "<div class='d-flex align-items-center py-2'>"+
			                    "<span>"+ project_member + "</span>"+
			                  "</div>"+
			                  "<div class='d-flex align-items-center py-2'>"+
			                    "<span>부서명</span>"+
			                  "</div>"+
			                "</div>"+
			              "</div>"		
	    		);
	    	});
	    	
	 }).fail(function(error){
	    	console.log('%O',error);
	});
})
////////////////[2]

//[3]체크리스트 추가용 ajax
$(".checklist-submit-btn").click(function(e){
	var checkContent = $('#modal_checklist_content').val();
	var checkEndDate = $('#modal_checklist_end_date').val();
	var checkCategory = $('#modal_checklist_category').val();  
	$.ajax({
	    url:'<c:url value="/Project/checklist.kosmo"/>',
	    method:'post',   
	    data: {            
	    	checkContent,checkEndDate,checkCategory
	    },
	    dataType:'json' // text, xml, json, script, html
	 }).done(function(data){
	    	console.log('서버로부터 받은 데이타:',data);
	    	//$('#checklist_content:last-child').append(checkContent);
	    	var source = '<li class="border-bottom-0"> '+
	            '<div class="form-check w-100"> '+
	              '<label class="form-check-label"> '+
	                '<input class="checkbox proj-todo-list-chbox" type="checkbox">'+ checkContent +
	                '<i class="input-helper rounded"></i> '+
	              '</label> '+
	              '<div class="d-flex mt-2"> '+
	                '<div class="ps-4 text-small me-3">'+ checkEndDate +'</div> ';
              if(checkCategory=='요청'){
              source +='<div class="badge badge-opacity-warning me-3">'+ checkCategory +'</div> '+
		               '</div> '+
		            '</div> '+
		          '</li>'
              };
              if(checkCategory=='피드백'){
                  source +='<div class="badge badge-opacity-info me-3">'+ checkCategory +'</div> '+
	               '</div> '+
	            '</div> '+
	          '</li>'
         	  };
         	  if(checkCategory=='진행'){
                 source +='<div class="badge badge-opacity-success me-3">'+ checkCategory +'</div> '+
	               '</div> '+
	            '</div> '+
	          '</li>'
        	  };
        	  if(checkCategory=='완료'){
                  source +='<div class="badge badge-opacity-secondary me-3">'+ checkCategory +'</div> '+
 	               '</div> '+
 	            '</div> '+
 	          '</li>'
         	  };
         	 $('.checklist-place').before(source);
         	 $('#check-Add-Modal').find('form')[0].reset();
	 }).fail(function(error){
		   	console.log('%O',error);
	});
});
/////////////////////[3]

//[4] 프로젝트 생성시 로그인 정보 파악하여 유저를 멤버로 우선 포함 시키기
//  미완성
$('#project_create').click(function(e){
	
	/*var loginId = $('#project_manager').val();
	console.log(loginId);
	var selectId = $('.select2-results__option');
	console.log('li 저장 성공');
	if(loginId == selectId.val()){
		console.log('조건문 통과');
		selectId.trigger("click");
	}*/
	
	var loginId = $('#project_manager').val();
	var tags = $('.select2-results__option'); 
    var tags_len = tags.lengh; //선택된 태그의 개수를 구함
    console.log('tags_len:',tags);
    for(var i=0;i<tags_len;i++){ //for문을 이용한 순차접근
    	var selectId = tags.eq(i).val();
    	console.log('selectId:',selectId);
    	if(loginId == selectId){
    		console.log('조건문 통과');
    		tags.eq(i).trigger("click");
    	}
    }
  });
////[4]

//[5]



////////[5]
/*
function sendPost(url,params){
	var form = document.createElement('form');
	form.setAttribute('method','post');
	form.setAttribute('action','http://localhost:8080/NodeArchive/Task/listbyporj.kosmo');
	document.charset = "utf-8";
	for(var key in params){
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name','project_no');
		hiddenField.setAttribute('value',params);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}

$(".project-list-accordion-bgCustom").click(function(e){
	console.log(e.target.id);
	var url='http://localhost:8080/NodeArchive/Task/listbyporj.kosmo';
	var params=e.target.id;
	console.log('파라미터 전송');
	sendPost(url,params);
})
//https://queserasera.tistory.com/8
*/
/*
function getTaskData(data){
	console.log(data);
	console.log($(data));
	$(data).find(",").each(function(){
		//var task_name=$(this).find("TASK_NAME").text();
		//$('#task_name').append(task_name);
		console.log($(this));
	})
	
};
*/
/*
$.ajax({
    url:'<c:url value="/Task/listbyporj.kosmo"/>',
    method:'post',   
    data: {            
        project_no:params
    },
    dataType:'json' // text, xml, json, script, html
 }).done(function(data){
    	console.log('서버로부터 받은 데이타:',data);
    	console.log(data.length);
    	successAjaxArray(data,"task_name");
    	//var tasks=data.length;
    	//#('#task-list').html(tasks);
    	$('#resDisplay').html(data);
    	$.each(data , function(i){
    		var task_name=data[i].TASK_NAME;
    		var task_member=data[i].M_ID;
    		//console.log(task_name);
    		$('#task_name').html(task_name);
    		$('#task_member').html(task_member);
    	})
 }).fail(function(error){
    	console.log('%O',error);
});

function successAjaxArray(data,elementId){
	//JSON배열을 출력할때는 $.each(data,function(index,index에 따른 요소값){}); 
	//사용]
	//data:서버로부터 전송받은 데이타(JSON배열타입)
	//index:JSON배열의 인덱스(0부터 시작)	
	//index에 따른 요소값:JSON배열에서 하나씩 꺼내온거를 담은 인자
    console.log(data);
	var list="";
	$.each(data,function(index,item){
		var date = new Date(item['sche_startdate']);
		var startDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		//list+='번호:'+item.task_no+',제목:'+item.task_name+',이름:'+item['task_content']+',시작일:'+postDate+"<br/>";
	});
	$('#'+elementId).html(list);
}
*/

</script>
