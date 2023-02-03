<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>


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
                             <h4 class="card-title card-title-dash">Pending Requests</h4>
                            <p class="card-subtitle card-subtitle-dash">You have 50+ new requests</p>
                           </div>
                           <div>
                             <button class="btn btn-primary btn-lg text-white mb-0 me-0" type="button"><i class="mdi mdi-account-plus"></i>Add new member</button>
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
                                 <th>Customer</th>
                                 <th>Company</th>
                                 <th>Progress</th>
                                 <th>Status</th>
                               </tr>
                             </thead>
                             <tbody>
                               <tr>
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex ">
                                     <img src="images/faces/face1.jpg" alt="">
                                     <div>
                                       <h6>Brandon Washington</h6>
                                       <p>Head admin</p>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                   <h6>Company name 1</h6>
                                   <p>company type</p>
                                 </td>
                                 <!-- 프로그래스바 테스트 시작 -->
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success progress-range">79%</p>
                                       <p>85/162</p>
                                     </div>
                                     <div class="progress progress-md task-progress">
                                       <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                       <div class="progress-state"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td><div class="badge badge-opacity-warning">In progress</div></td>
                                 <!-- 프로그래스바 테스트 끝 -->
                               </tr>
                               <tr>
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                     <img src="images/faces/face2.jpg" alt="">
                                     <div>
                                       <h6>Laura Brooks</h6>
                                       <p>Head admin</p>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                   <h6>Company name 1</h6>
                                   <p>company type</p>
                                 </td>
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success">65%</p>
                                       <p>85/162</p>
                                     </div>
                                     <div class="progress progress-md">
                                       <div class="progress-bar bg-success" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td><div class="badge badge-opacity-warning">In progress</div></td>
                               </tr>
                               <tr>
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                     <img src="images/faces/face3.jpg" alt="">
                                     <div>
                                       <h6>Wayne Murphy</h6>
                                       <p>Head admin</p>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                   <h6>Company name 1</h6>
                                   <p>company type</p>
                                 </td>
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success">65%</p>
                                       <p>85/162</p>
                                     </div>
                                     <div class="progress progress-md">
                                       <div class="progress-bar bg-warning" role="progressbar" style="width: 38%" aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td><div class="badge badge-opacity-warning">In progress</div></td>
                               </tr>
                               <tr>
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                     <img src="images/faces/face4.jpg" alt="">
                                     <div>
                                       <h6>Matthew Bailey</h6>
                                       <p>Head admin</p>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                   <h6>Company name 1</h6>
                                   <p>company type</p>
                                 </td>
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success">65%</p>
                                       <p>85/162</p>
                                     </div>
                                     <div class="progress progress-md">
                                       <div class="progress-bar bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td><div class="badge badge-opacity-danger">Pending</div></td>
                               </tr>
                               <tr>
                                 <td>
                                   <div class="form-check form-check-flat mt-0">
                                     <label class="form-check-label">
                                     <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i></label>
                                   </div>
                                 </td>
                                 <td>
                                   <div class="d-flex">
                                     <img src="images/faces/face5.jpg" alt="">
                                     <div>
                                       <h6>Katherine Butler</h6>
                                       <p>Head admin</p>
                                     </div>
                                   </div>
                                 </td>
                                 <td>
                                   <h6>Company name 1</h6>
                                   <p>company type</p>
                                 </td>
                                 <td>
                                   <div>
                                     <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                       <p class="text-success">65%</p>
                                       <p>85/162</p>
                                     </div>
                                     <div class="progress progress-md">
                                       <div class="progress-bar bg-success" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                     </div>
                                   </div>
                                 </td>
                                 <td><div class="badge badge-opacity-success">Completed</div></td>
                               </tr>
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
      $('.progress-state').width($('.task-progress').width() * clickPercentage);
      var percentage = clickPercentage * 100;
      //Math.floor() 소수점 버림, 정수를 반환하는 함수
      $('.progress-range').text(Math.floor(percentage));
  })
})
/////

</script>

