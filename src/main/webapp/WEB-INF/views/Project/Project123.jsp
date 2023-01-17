<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                        <span class="project-list-ul-custom" style="line-height:25px">프로젝트 1</span>
                                      </div>
                                      <!-- 드롭다운 쓰리닷 메뉴 시작, id=프로젝트일련번호-dropdown-menu-button -->
                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly" type="button" id="project1-dropdown-menu-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-light fa-bars"></i>
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="project1-dropdown-menu-button">
                                        <a class="dropdown-item" href="#">공유</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">수정</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">캘린더</a>
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
                                                <th> 진행도 </th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
                                              <tr>
                                                <td class="py-1"> <img src="#" alt="프로필사진"/> </td>
                                                <td> 김길동 </td>
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
                                  
                                  <!-- 프로젝트 하나 시작 , href=#프로젝트일련번호 -->
                                  <div class="card project-list-accordion-bgCustom">
                                    <div class="btn-group" role="group" style="height: 50px;">
                                      <!-- href=#프로젝트일련번호 -->
                                      <div class="card-header card-link hover project-list-accordion-card-header btn fg-10 project-list-btn-dropdownbtn" data-toggle="collapse" href="#project2" style="border:none; flex-grow:15;">
                                        <span class="project-list-ul-custom" style="line-height:25px">프로젝트 2</span>
                                      </div>
                                      <!-- 드롭다운 쓰리닷 메뉴 시작, id=프로젝트일련번호-dropdown-menu-button -->
                                      <button class="btn dropdown-toggle project-list-btn-dropdownbtn fg-1 project-dropdown-btngroup-border-leftonly" type="button" id="project2-dropdown-menu-button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-light fa-bars"></i>
                                      </button>
                                      <div class="dropdown-menu" aria-labelledby="project2-dropdown-menu-button">
                                        <a class="dropdown-item" href="#">공유</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">수정</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">캘린더</a>
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
                                                <th> 진행도 </th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <!-- tr : 행 , td : 열 (여기 td 개수는 <thead>의 th개수랑 맞춰야 함.)-->
                                              <tr>
                                                <td class="py-1"> <img src="#" alt="프로필사진"/> </td>
                                                <td> 김길동 </td>
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


