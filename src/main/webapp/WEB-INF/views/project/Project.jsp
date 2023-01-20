<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

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
                               
                                    

<!-- 중간발표를 위한 임시 텍스트 박스 추가 : 중간 발표 후 삭제 -->
<%Map map = new HashMap<>(); %>
<h3>프로젝트 추가</h3>
<form class="form-inline" method="POST" action="<c:url value='/Project/create.kosmo'/>"> 
	사용자 정보 : <input type="text" name="loginId" class="form-control mx-2"/> 
	프로젝트명 : <input type="text" name="project_name" class="form-control mx-2"/>
	프로젝트 시작일자 : <input type="text" name="set_startdate" class="form-control mx-2"/>
	프로젝트 마감일자 : <input type="text" name="set_enddate" class="form-control mx-2"/>
	<div class="form-group">
		멤버 선택
		<div class="d-flex">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="member" value="kim1234@samsung.com" id="member1"> 
				<label class="custom-control-label">kim1234@samsung.com</label>
			</div>
			<div class="custom-control custom-checkbox mx-2">
				<input type="checkbox" class="custom-control-input" name="member" value="park1234@samsung.com" id="member2">
				<label class="custom-control-label">park1234@samsung.com</label>
			</div>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="member" value="song1234@samsung.com" id="member3"> 
				<label class="custom-control-label">song1234@samsung.com</label>
			</div>
			<div class="custom-control custom-checkbox ml-2">
				<input type="checkbox" class="custom-control-input" name="member" value="hong1234@samsung.com" id="member4"> 
				<label class="custom-control-label">hong1234@samsung.com</label>
			</div>
		</div>
	</div>	
	<input type="submit" class="btn btn-info mx-2" value="프로젝트 추가" />
</form>

<h3>업무 추가</h3>
<form class="form-inline" method="POST" action="<c:url value='/Task/create.kosmo'/>"> 
	사용자 정보 : <input type="text" name="m_id" class="form-control mx-2"/> 
	프로젝트 번호 : <input type="text" name="project_no" class="form-control mx-2"/>
	업무명 : <input type="text" name="task_name" class="form-control mx-2"/>
	업무내용 : <input type="text" name="task_content" class="form-control mx-2"/>
	업무 시작일자 : <input type="text" name="set_startdate" class="form-control mx-2"/>
	업무 마감일자 : <input type="text" name="set_enddate" class="form-control mx-2"/>
	업무 카테고리 : <input type="text" name="task_category" class="form-control mx-2"/>
	
	<input type="submit" class="btn btn-info mx-2" value="업무 추가" />
</form>
<!-- 중간발표를 위한 임시 텍스트 박스 추가 끝-->

								<div class="d-sm-flex justify-content-between align-items-start mb-3">
                                  <ul class="list-unstyled project-list-ul-custom fg-1">
									<li>
                                      프로젝트 목록
                                    </li>
                                    <li>
                                      <a href="#" class="project-list-a-icon9">
                                        <i class="fa fa-solid fa-gear"></i> 
                                      </a>
                                    </li>
                                  </ul>
                                </div>
                                <div id="project-list-accordion">
                                  <!-- 프로젝트 하나 시작 , href=#프로젝트일련번호 -->
                                  <div class="card project-list-accordion-bgCustom">
                                    <div class="btn-group" role="group" style="height: 50px;">
                                      <!-- href=#프로젝트일련번호 -->
                                      <div class="card-header card-link hover project-list-accordion-card-header btn fg-10 project-list-btn-dropdownbtn" data-toggle="collapse" href="#project1" style="border:none; flex-grow:15;">
                                        <span class="project-list-ul-custom" style="line-height:25px">${projectList.lists[0].PROJECT_NAME}</span>
                                      </div>
                                      <!-- 드롭다운 쓰리닷 메뉴 시작, id=프로젝트일련번호-dropdown-menu-button -->
                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly" type="button" id="project1-dropdown-menu-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-light fa-bars"></i>
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="project1-dropdown-menu-button">
                                        <a class="dropdown-item" href="#">공유</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">업무추가</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">수정</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="/schedule/month.noa">캘린더</a>
                                      </div>
                                      <!-- 드롭다운 쓰리닷 메뉴 끝 -->
                                    </div>
                                    <!-- 프로젝트 업무 목록 시작 , id=프로젝트일련번호 -->
                                    <div id="project1" class="collapse">
                                      <div class="card-body project-list-accordion-card-body">
                                        <div class="table-reponsive overflow-x-scroll">
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
                                              <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
                                              <tr>
                                                <td class="py-1"> <img src="../projectResources/profile1.jsp" alt="프로필사진"/> </td>
                                                <td> 김길동 </td>
                                                <td> 업무1 </td>
                                                <td> 
                                                  <div class="progress">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                  </div>
                                                </td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- 프로젝트 업무 목록 끝 -->
                                  </div>
                                  <!-- 프로젝트 하나 끝 -->
                                  
<!--    여기서부터 목록 테스트 시작    -->                               
                                  <c:if test="${!(empty projectList.lists)}" var="isNotEmpty">
                                  	 <!-- 프로젝트 하나 시작 , href=#프로젝트일련번호 -->
                                  	 
	                                  <div class="card project-list-accordion-bgCustom">
	                                    <div class="btn-group" role="group" style="height: 50px;">
	                                      <!-- href=#프로젝트일련번호 -->
	                                      <div class="card-header card-link hover project-list-accordion-card-header btn fg-10 project-list-btn-dropdownbtn" data-toggle="collapse" href="#project2" style="border:none; flex-grow:15;">
	                                        <span id="projectTitle" class="project-list-ul-custom" style="line-height:25px" name="${projectList.lists[1].PROJECT_NO}">${projectList.lists[1].PROJECT_NAME}</span>
	                                      </div>
	                                      <!-- 드롭다운 쓰리닷 메뉴 시작, id=프로젝트일련번호-dropdown-menu-button -->
	                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly" type="button" id="project2-dropdown-menu-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                        <i class="fa fa-light fa-bars"></i>
	                                      </button>
	                                      <div class="dropdown-menu" aria-labelledby="project2-dropdown-menu-button">
	                                        <a class="dropdown-item" href="#">공유</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="#">업무추가</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="#">수정</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="/schedule/Month.noa">캘린더</a>
	                                      </div>
	                                      <!-- 드롭다운 쓰리닷 메뉴 끝 -->
	                                    </div>
	                                    <!-- 프로젝트 업무 목록 시작 , id=프로젝트일련번호 -->
	                                    <div id="project2" class="collapse">
	                                      <div class="card-body project-list-accordion-card-body">
	                                        <div class="table-reponsive overflow-x-scroll">
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
	                                              <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
	                                              <tr>
	                                                <td class="py-1"> <img src="/webapp/projectResources/profile1.jpg" alt="프로필사진"/> </td>
	                                                <td>${selectTaskListByProj.lists[0].M_ID}</td>
	                                                <td>업무1</td>
	                                                <td> 
	                                                  <div class="progress">
	                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	                                                  </div>
	                                                </td>
	                                              </tr>
	                                            </tbody>
	                                          </table>
	                                        </div>
	                                      </div>
	                                    </div>
	                                    <!-- 프로젝트 업무 목록 끝 -->
	                                  </div>
	                               </c:if>
	                                  <!-- 프로젝트 하나 끝 -->
<!--     여기가 목록 테스트 끝     -->                                
                                 
                                </div>

                              </div>
                              <!-- 카드 바디 끝 -->
                            </div>
                          </div>
                        </div>
                        
                      </div>

                      <div class="col-sm-4">

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
                                    <div>
                                      <div class="wrapper d-flex align-items-center py-2 border-bottom">
                                        <!-- 구성원의 정보 하나 시작 -->
                                        <div class="d-flex align-items-center py-2">
                                          <img class="img-sm rounded-10" alt="profile-img" src="#">
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>m_name</span>
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>hello</span>
                                        </div>
                                        <!-- 구성원의 정보 하나 끝 -->
                                      </div>
                                    </div>
                                    <!-- 프로젝트 참여자 목록 영역 끝 -->

                                    <!-- 프로젝트 참여자 목록 영역 시작 -->
                                    <div>
                                      <div class="wrapper d-flex align-items-center py-2 border-bottom">
                                        <!-- 구성원의 정보 하나 시작 -->
                                        <div class="d-flex align-items-center py-2">
                                          <img class="img-sm rounded-10" alt="profile-img" src="#">
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>m_name</span>
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>hello</span>
                                        </div>
                                        <!-- 구성원의 정보 하나 끝 -->
                                      </div>
                                    </div>
                                    <!-- 프로젝트 참여자 목록 영역 끝 -->

                                    <!-- 프로젝트 참여자 목록 영역 시작 -->
                                    <div>
                                      <div class="wrapper d-flex align-items-center py-2">
                                        <!-- 구성원의 정보 하나 시작 -->
                                        <div class="d-flex align-items-center py-2">
                                          <img class="img-sm rounded-10" alt="profile-img" src="#">
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>m_name</span>
                                        </div>
                                        <div class="d-flex align-items-center py-2">
                                          <span>hello</span>
                                        </div>
                                        <!-- 구성원의 정보 하나 끝 -->
                                      </div>
                                    </div>
                                    <!-- 프로젝트 참여자 목록 영역 끝 -->
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 체크리스트 카드 바디 끝 -->

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
                                        <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-add-btn"><i class="mdi mdi-plus"></i></button>
                                        <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p" id="project-todo-list-remove-btn"><i class="mdi mdi-minus"></i></button>
                                      </div>
                                    </div>
                                    <!-- 체크리스트 다이브 영역 시작 -->
                                    <div class="list-wrapper overflow-y-scroll" >
                                      <!-- 체크리스트 목록 ul 태그 시작 -->
                                      <ul class="todo-list todo-list-rounded project-todo-list-ulelement-custom">
                                        <li class="d-block">
                                          <div class="form-check w-100">
                                            <label class="form-check-label">
                                              <input class="checkbox proj-todo-list-chbox" type="checkbox"> Lorem Ipsum is simply dummy text of the printing <i class="input-helper rounded"></i>
                                            </label>
                                            <div class="d-flex mt-2">
                                              <div class="ps-4 text-small me-3">24 June 2020</div>
                                              <div class="badge badge-opacity-warning me-3">Due tomorrow</div>
                                              <i class="mdi mdi-flag ms-2 flag-color"></i>
                                            </div>
                                          </div>
                                        </li>
                                        <li class="d-block">
                                          <div class="form-check w-100">
                                            <label class="form-check-label">
                                              <input class="checkbox proj-todo-list-chbox" type="checkbox"> Lorem Ipsum is simply dummy text of the printing <i class="input-helper rounded"></i>
                                            </label>
                                            <div class="d-flex mt-2">
                                              <div class="ps-4 text-small me-3">23 June 2020</div>
                                              <div class="badge badge-opacity-success me-3">Done</div>
                                            </div>
                                          </div>
                                        </li>
                                        <li class="d-block">
                                          <div class="form-check w-100">
                                            <label class="form-check-label">
                                              <input class="checkbox proj-todo-list-chbox" type="checkbox"> Lorem Ipsum is simply dummy text of the printing <i class="input-helper rounded"></i>
                                            </label>
                                            <div class="d-flex mt-2">
                                              <div class="ps-4 text-small me-3">23 June 2020</div>
                                              <div class="badge badge-opacity-success me-3">Done</div>
                                            </div>
                                          </div>
                                        </li>
                                        <li class="border-bottom-0">
                                          <div class="form-check w-100">
                                            <label class="form-check-label">
                                              <input class="checkbox proj-todo-list-chbox" type="checkbox"> Lorem Ipsum is simply dummy text of the printing <i class="input-helper rounded"></i>
                                            </label>
                                            <div class="d-flex mt-2">
                                              <div class="ps-4 text-small me-3">24 June 2020</div>
                                              <div class="badge badge-opacity-danger me-3">Expired</div>
                                            </div>
                                          </div>
                                        </li>
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

<script>
//※댓글 목록의 제목 클릭시-click이벤트걸때 반드시  $(document).on('이벤트명','셀렉터',콜백함수)으로
//그래야 동적으로 추가된 요소에도 이벤트가 발생한다
$(document).on('click','#projectTitle',function(){
	//먼저 각 프로젝트의 업무리스트를 Ajax로가져온다.
	console.log('프로젝트 번호attr:',$(this).attr('name'));
	var this_ = $(this);//클릭한 제이쿼리객체
	
	$.ajax({
		url:"<c:url value="/Task/listbyporj.kosmo"/>",
		data:"project_no="+this_.attr('name')
		
	}).done(function(data){
	
		console.log('프로젝트 번호:',data);
		
		//if('${sessionScope.id}'===data){//본인 댓글만 수정
		//if(data!= null){//본인 댓글만 수정(씨큐리티 적용시)
			//입력상자값을 클릭한 제목으로 변경
			//$('#projNo').val(data);
			//버튼의 텍스트를 수정으로 변경
			//$('#submit').val('수정');
			//폼의 hidden인 lno의 value를 클릭한 제목의 lno값으로 설정
			//$('input[name=lno]').val(this_.attr('title'));
			//console.log('히든값 설정 확인(lno):',$('input[name=lno]').val());/
		}
	
	}).fail(function(error){
		console.log('프로젝트 업무 찾기 오류:',error);
	});
	
	
	
	
});

</script>
