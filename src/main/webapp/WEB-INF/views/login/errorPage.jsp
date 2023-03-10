<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- Top.jsp -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<style>
	#logo-image{
	/*
		width:70%;
		height:70%;
	*/
	}
</style>
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
<body> 
	<div class="container-scroller"> 
      <div class="main-panel mp-height">
        <div class="content-wrapper d-flex justify-content-center">
          <div class="d-flex py-5">
          <div class="row flex-grow" >
          
            <div class="col-sm-9 d-flex align-items-stretch px-5">
              <div class="grid-margin stretch-card flex-grow">
                <div class="card card-rounded">
                  <div class="card-body d-flex flex-column justify-content-center">
                    <div class="logo-img-div">
                      <img src="${path}/resources/images/logo-removebg-preview.png" id="logo-image" class="loginpage-logo-img mx-auto d-block " alt="?????? ????????? ??????"/>
                    </div>
                    <div class="logo-txt-div">
                      <img src="${path}/resources/images/textlogo-NodeArchive.svg" id="logo-text" class="mx-auto d-block loginpage-logo-img" alt="?????? ????????? ??????"/>
                    </div>
                    <div class="d-flex justify-content-center">
                      <p class="emp-description mt-2 px-5 py-3">
                        ${requestScope['access-failure']}
                      </p>
                    </div>
                  </div>
                </div>
              </div>    
            </div>
            <%-- 
            <div class="col-sm-6 d-flex align-items-stretch px-5">
              <div class="grid-margin stretch-card flex-grow">
                <div class="card card-rounded">
                  <div class="card-body d-flex flex-column align-items-center justify-content-center">
                    <h2 class="card-title fsu-lg"> ????????? </h2>
                    <c:if test="${! empty requestScope.NotMember}" var="loginFailed">
	                    <p class="card-description" style="color:red;">
    	                  ID??? ??????????????? ???????????? ???????????? <i class="fa-light fa-circle-exclamation" title='"?????????@???????????????"????????? ID??? ???????????????&nbsp;'></i>
        	            </p>
					</c:if>
					<c:if test="${not loginFailed}">
	                    <p class="card-description">
	                      ID??? ??????????????? ??????????????? <i class="fa fa-light fa-question-circle-o" title='"?????????@???????????????"????????? ID??? ???????????????&nbsp;'></i>
	                    </p>
                    </c:if>
                    <form class="form-sample" action='<c:url value="/Login/login.kosmo"/>' method="post">
                      <input type="hidden" id="login-3" name="m_id"/>
                      <div class="form-group mb-2">
                        <div class="input-group">
                          <input type="text" class="form-control flex-grow-1" placeholder="????????? ID"/>
                          <div class="input-group-prepend">
                            <span class="input-group-text">
                              @
                            </span>
                          </div>
                          <input type="text" class="form-control flex-grow-1" placeholder="?????????.com"/>
                        </div>  
                      </div>
                      <div class="form-group">  
                        <input type="password" class="form-control flex-grow-1" name="m_password" placeholder="????????????"/>
                        <button type="submit" class="btn btn-secondary mt-2 btn-submit-fitX fsu-sm">?????????</button>
                        <div class="d-flex align-items-baseline">
                          <div class="col-6">
                            <div class="form-check mx-sm-2">
                              <label class="form-check-label">
                                <input type="checkbox" class="form-check-input fsu-sm"/> ????????? ?????? ??????
                              </label>
                            </div>
                          </div>
                          <div class="col-6">
                            <a class="find-id-pwd fsu-sm" href="#">ID, ???????????? ??????</a>
                            <a class="find-id-pwd fsu-sm" href="${path}/Login/signUp.kosmo">??? ?????? ????????????</a>
                          </div>
                        </div>
                      </div>
                    </form>
                    <div class="text-info">????????? ?????? ????????? ?????? ??? ?????? ??????</div>
                  </div>
                </div>
              </div>    
            </div>
            --%>
          </div>
          </div>
        </div>
        <!-- content-wrapper ends -->

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
    $(function(){
	    var availHeightPX = window.screen.availHeight + "px";
	    $(".mp-height").css("height",availHeightPX);
	    var logoWidthPX = $(".loginpage-logo-img").width() - 10 + "px";
	    $('.emp-description').css("width",logoWidthPX);
    	
	    //????????? ????????? input ????????????
    	$('.form-group > button[type="submit"]').on('click', function(){
    		var arr = [];
    		$('input:text').each(function(){
    			arr.push($(this).val());
    		})
    		$('#login-3').val(arr.join('@'));
    		$('form').submit();
    	});
    });
    
  </script>
</body>

</html>