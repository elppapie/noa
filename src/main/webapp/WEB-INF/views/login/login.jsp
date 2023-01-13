<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Top.jsp -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Node Archive </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${path}/resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="${path}/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${path}/resources/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="${path}/resources/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${path}/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${path}/resources/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path}/resources/css/vertical-layout-light/style.css">
  <!-- custom style -->
  <link rel="stylesheet" href="${path}/resources/css/noaCss.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path}/resources/images/logo-removebg-preview.png" />
  <!-- font-awesome Kit Code -->
  <script src="https://kit.fontawesome.com/672ea2e509.js" crossorigin="anonymous"></script>
</head>
<body> 
      <div class="main-panel mp-height">
        <div class="content-wrapper d-flex justify-content-center">
          <div class="d-flex py-5">
          <div class="row flex-grow" >
            <div class="col-sm-6 d-flex align-items-stretch px-5">
              <div class="grid-margin stretch-card flex-grow">
                <div class="card card-rounded">
                  <div class="card-body d-flex flex-column justify-content-center">
                    <div class="logo-img-div">
                      <img src="${path}/resources/images/logo-removebg-preview.png" class="loginpage-logo-img mx-auto d-block " alt="노아 이미지 로고"/>
                    </div>
                    <div class="logo-txt-div">
                      <img src="${path}/resources/images/textlogo-NodeArchive.svg" class="mx-auto d-block loginpage-logo-img" alt="노아 텍스트 로고"/>
                    </div>
                    <div class="d-flex justify-content-center">
                      <p class="emp-description mt-2 px-5 py-3">
                        우리 노드아카이브 그룹웨어는 재택근무에 특화된 그룹웨어 서비스를 제공합니다.
                      </p>
                    </div>
                  </div>
                </div>
              </div>    
            </div>
            <div class="col-sm-6 d-flex align-items-stretch px-5">
              <div class="grid-margin stretch-card flex-grow">
                <div class="card card-rounded">
                  <div class="card-body d-flex flex-column align-items-center justify-content-center">
                    <h2 class="card-title fsu-lg"> 로그인 </h2>
                    <p class="card-description">
                      ID와 비밀번호를 입력하세요 <i class="fa fa-light fa-question-circle-o" title='"아이디@기업도메인"형식의 ID를 입력하세요&nbsp;'></i>
                    </p>
                    <form class="form-sample" action="#" method="post">
                      <div class="form-group mb-2">
                        <div class="input-group">
                          <input type="text" class="form-control flex-grow-1" placeholder="로그인 ID"/>
                          <div class="input-group-prepend">
                            <span class="input-group-text">
                              @
                            </span>
                          </div>
                          <input type="text" class="form-control flex-grow-1" placeholder="도메인.com"/>
                        </div>  
                      </div>
                      <div class="form-group">  
                        <input type="text" class="form-control flex-grow-1" placeholder="비밀번호"/>
                        <button type="submit" class="btn btn-secondary mt-2 btn-submit-fitX fsu-sm">로그인</button>
                        <div class="d-flex align-items-baseline">
                          <div class="col-6">
                            <div class="form-check mx-sm-2">
                              <label class="form-check-label">
                                <input type="checkbox" class="form-check-input fsu-sm"/> 로그인 상태 유지
                              </label>
                            </div>
                          </div>
                          <div class="col-6">
                            <a class="find-id-pwd fsu-sm">ID, 비밀번호 찾기</a>
                            <a class="find-id-pwd fsu-sm">내 기업 등록하기</a>
                          </div>
                        </div>
                      </div>
                    </form>
                    <div class="text-info">아래에 소셜 로그인 추가 시 버튼 추가</div>
                  </div>
                </div>
              </div>    
            </div>
          </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->

  <!-- plugins:js -->
  <script src="${path}/resources/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${path}/resources/vendors/chart.js/Chart.min.js"></script>
  <script src="${path}/resources/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="${path}/resources/vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${path}/resources/js/off-canvas.js"></script>
  <script src="${path}/resources/js/hoverable-collapse.js"></script>
  <script src="${path}/resources/js/template.js"></script>
  <script src="${path}/resources/js/settings.js"></script>
  <script src="${path}/resources/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${path}/resources/js/dashboard.js"></script>
  <script src="${path}/resources/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
  <script>
    var availHeightPX = window.screen.availHeight + "px";
    $(".mp-height").css("height",availHeightPX);
    var logoWidthPX = $(".loginpage-logo-img").width() - 10 + "px";
    $('.emp-description').css("width",logoWidthPX);
  </script>
</body>

</html>