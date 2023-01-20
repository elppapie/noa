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
  <link rel="shortcut icon" href="${path}/resources/images/logo-noa-messanger.png" />
  <!-- font-awesome Kit Code -->
  <script src="https://kit.fontawesome.com/672ea2e509.js" crossorigin="anonymous"></script>
</head>
<style>
  .signUpPage-logo-size-alter{
  	margin-top:-50px;
	margin-bottom:-15px;
  }
  .signUpPage-logo-size-alter-div{
  	padding-top: 0px;
  	padding-bottom: 0px;
  }
  .signUpPage-email-auth-button:hover{
    cursor: pointer;
  }
  .signUpPage-email-auth-button{
    background-color: #324a3b;
    border-color: #324a3b;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
  }
  .signUpPage-email-auth-no-style{
    background-color: transparent;
    border: none;
    color: rgba(255, 255, 255, 0.769) !important;
  }
  
</style>
<body> 
	<div class="container-scroller"> 
      <div class="main-panel mp-height">
        <div class="content-wrapper d-flex justify-content-center">
          <div class="d-flex py-5 fg-1">
          <div class="row flex-grow justify-content-center" >
            <div class="col-sm-8 d-flex align-items-stretch px-5">
              <div class="grid-margin stretch-card flex-grow">
                <div class="card card-rounded">
                  <div class="card-body d-flex flex-column align-items-center justify-content-center">
                    <div class="logo-img-div signUpPage-logo-size-alter-div">
                      <img src="${path}/resources/images/logo-removebg-preview.png" class="loginpage-logo-img mx-auto d-block signUpPage-logo-size-alter" alt="노아 이미지 로고"/>
                    </div>
                    <h2 class="card-title fsu-lg"> 기업 등록 </h2>
                    <p class="card-description">
                      기업 등록을 위해 우선 개인 이메일로 본인 인증을 진행하세요 <i class="fa fa-light fa-question-circle-o" 
                      title='이메일 인증버튼을 누르면 입력한 이메일 주소로 인증코드가 전송됩니다.'></i>
                    </p>
                    <form class="form-sample" action="#" method="post" style="width: 80%;">
                      <div class="form-group mb-2">
                        <div class="input-group">
                          <input id="signUpPage-email-auth" type="text" class="form-control" style="flex-grow: 9;" placeholder="이메일 주소"/>
                          <div class="input-group-prepend flex-grow-1 signUpPage-email-auth-button" style="padding-left: 3px;" >
                            <span class="input-group-text signUpPage-email-auth-no-style">
                              이메일 인증
                            </span>
                          </div>
                        </div>  
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <input id="auth-key-here-please" type="text" class="form-control" placeholder="인증 코드를 입력하세요" disabled title="이메일 인증 버튼을 클릭하세요"/>
                        </div>
                      </div>
                      <button id="signUp-first-btn-next" class="btn btn-secondary btn-submit-fitX fsu-sm" disabled>다음</button>
                      <div class="progress mt-1 mb-2">
                        <div class="progress-bar bg-success" role="progressbar" style="width:33.3%" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                    </form>
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
  </div>
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
    
    
    document.querySelector("span.signUpPage-email-auth-no-style").onclick = function(e){
    	const email = document.querySelector("#signUpPage-email-auth").value;
        $.ajax({
          url:"${path}/Login/emailAuth.kosmo",
          data:{"email":email},
          dataType:'json'
        }).done(function(data){
        	//data = {email:"입력한 이메일 주소",key:"생성된 인증코드",isSuccess:true}
        	if(data.isSuccess===true) console.log('인증 메일 보내기 성공')
        	//1. 인증코드 입력란 enabled 시켜주기
        	const input_auth = document.querySelector("#auth-key-here-please");
        	input_auth.disabled=false;
        	input_auth.onkeydown = function(e){
        		if(this.value.trim()===data.key) document.querySelector("#signUp-first-btn-next").disabled=false;
        		else document.querySelector("#signUp-first-btn-next").disabled=true;
        	};
        }).fail(function(e){console.log(e)});
        
      };
  </script>
</body>

</html>