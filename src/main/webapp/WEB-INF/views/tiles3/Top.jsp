<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Top.jsp -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="view" value="${pageContext.request.contextPath}/WEB-INF/views"/>
<c:set var="m_name" ><sec:authentication property="principal.username"/></c:set>

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
  <!-- bootstrap 4 cdn -->
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">   -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--  Custom CSS   -->
  <style>
	.navbar .navbar-menu-wrapper{
		border-bottom:1.5px solid #c1c1c1;
	}
	.sidebar{
		/*width:273px !important;*/
	}
	.sidebar-icon-only .sidebar{
		/*width:75px !important;*/
		background: #232227 !important;
	}
	.sidebar-icon-only .navbar-brand-wrapper{
		background: #232227 !important;
	}
	.sidebar-icon-only .navbar-brand-wrapper .icon-menu::before{
		color: #ffffff;
	}
	.sidebar-icon-only .menu-icon::before{
		color: #ffffff;
	}
	.sidebar-icon-only .load-immediate-icon{
		display:none;
	}
	.sticky {
		position: fixed;
		width: 220px;
	}
	#sidebar.active {
		background-color: rgba(0,0,0,45%);
	}
</style>
</head>
<body class="sidebar-dark">
  <div class="container-scroller"> 
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
        <div class="me-3">
          <button class="navbar-toggler navbar-toggler align-self-center" id="top-nav-3bar-menu-ic" type="button" data-bs-toggle="minimize">
            <span class="icon-menu"></span>
          </button>
        </div>
        <div>
          <a class="navbar-brand brand-logo" href="${path}/home.kosmo">
      	    <img src="${path}/resources/images/textlogo-NodeArchive.svg" alt="logo" />
    	  </a>
	      <a class="navbar-brand brand-logo-mini" href="${path}/home.kosmo">
	        <img src="${path}/resources/images/logo-removebg-preview.png" alt="logo" />
	      </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top"> 
        <ul class="navbar-nav">
          <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
            <h1 class="welcome-text">Good Morning, <span class="text-black fw-bold">${m_name}</span></h1>
          </li>
        </ul>
        <ul class="navbar-nav ms-auto">
          <!-- 
          <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false"> Select Category </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
              <a class="dropdown-item py-3" >
                <p class="mb-0 font-weight-medium float-left">Select category</p>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Bootstrap Bundle </p>
                  <p class="fw-light small-text mb-0">This is a Bundle featuring 16 unique dashboards</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Angular Bundle</p>
                  <p class="fw-light small-text mb-0">Everything you’ll ever need for your Angular projects</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">VUE Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 6 Premium Vue Admin Dashboard</p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">React Bundle</p>
                  <p class="fw-light small-text mb-0">Bundle of 8 Premium React Admin Dashboard</p>
                </div>
              </a>
            </div>
          </li>
          
          <li class="nav-item d-none d-lg-block">
            <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
              <span class="input-group-addon input-group-prepend border-right">
                <span class="icon-calendar input-group-text calendar-icon"></span>
              </span>
              <input type="text" class="form-control">
            </div>
          </li>
           -->
           
          <!-- 구성원 검색 -->
          <li class="nav-item d-flex align-items-center">
          	<div class="form-group" style="margin:0px;">
          		<div class="input-group">
          			<input type="text" class="form-control" placeholder="구성원 검색" id="top-input-search-members"/>
          			<div class="input-group-append d-flex justify-content-center align-items-center top-btn-search-members-append" onclick="openSearchOrg('${path}/Address/allList.kosmo')">
          				<button type="button" class="btn btn-rounded top-btn-search-members">
          					<i class="ti-search"></i>
         				</button>
          			</div>
          		</div>
          	</div>
          </li> 
          
          
          <!-- 
          <li class="nav-item">
            <form class="search-form" action="#">
              <i class="icon-search"></i>
              <input type="search" class="form-control" placeholder="Search Here" title="Search here">
            </form>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
              <i class="fa fa-light fa-square-xmark"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="notificationDropdown">
              <a class="dropdown-item py-3 border-bottom">
                <p class="mb-0 font-weight-medium float-left">You have 4 new notifications </p>
                <span class="badge badge-pill badge-primary float-right">View all</span>
              </a>
              <a class="dropdown-item preview-item py-3">
                <div class="preview-thumbnail">
                  <i class="mdi mdi-alert m-auto text-primary"></i>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject fw-normal text-dark mb-1">Application Error</h6>
                  <p class="fw-light small-text mb-0"> Just now </p>
                </div>
              </a>
              <a class="dropdown-item preview-item py-3">
                <div class="preview-thumbnail">
                  <i class="mdi mdi-settings m-auto text-primary"></i>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject fw-normal text-dark mb-1">Settings</h6>
                  <p class="fw-light small-text mb-0"> Private message </p>
                </div>
              </a>
              <a class="dropdown-item preview-item py-3">
                <div class="preview-thumbnail">
                  <i class="mdi mdi-airballoon m-auto text-primary"></i>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject fw-normal text-dark mb-1">New user registration</h6>
                  <p class="fw-light small-text mb-0"> 2 days ago </p>
                </div>
              </a>
            </div>
          </li>
          -->
          
          
          <li class="nav-item dropdown"> 
            <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="icon-bell"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="countDropdown">
              <a class="dropdown-item py-3">
                <p class="mb-0 font-weight-medium float-left">You have 7 unread mails </p>
                <span class="badge badge-pill badge-primary float-right">View all</span>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="${path}/resources/images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="${path}/resources/images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">David Grey </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <img src="${path}/resources/images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
                </div>
                <div class="preview-item-content flex-grow py-2">
                  <p class="preview-subject ellipsis font-weight-medium text-dark">Travis Jenkins </p>
                  <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown d-none d-lg-block user-dropdown">
            <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <img class="img-xs rounded-circle" src="${path}/resources/images/faces/face8.jpg" alt="Profile image"> </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md rounded-circle" src="${path}/resources/images/faces/face8.jpg" alt="Profile image">
                <p class="mb-1 mt-3 font-weight-semibold">Allen Moreno</p>
                <p class="fw-light text-muted mb-0">allenmoreno@gmail.com</p>
              </div>
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> My Profile <span class="badge badge-pill badge-danger">1</span></a>
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i> Messages</a>
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i> Activity</a>
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
              <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    
    
      <!-- partial:partials/_settings-panel.html -->
      <!--   
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border me-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border me-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      -->
      
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-bs-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-bs-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
            <div class="list-wrapper px-3">
              <ul class="d-flex flex-column-reverse todo-list">
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Team review meeting at 3.00 PM
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Prepare for presentation
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Resolve all the low priority tickets due today
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Schedule meeting for next week
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Project review
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
              </ul>
            </div>
            <h4 class="px-3 text-muted mt-5 fw-light mb-0">Events</h4>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary me-2"></i>
                <span>Feb 11 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
              <p class="text-gray mb-0">The total number of sessions</p>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary me-2"></i>
                <span>Feb 7 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
              <p class="text-gray mb-0 ">Call Sarah Graves</p>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 fw-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="${path}/resources/images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${path}/resources/images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${path}/resources/images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${path}/resources/images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${path}/resources/images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="${path}/resources/images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
	  <nav class="sidebar sidebar-offcanvas sticky" id="sidebar">
	    <ul class="nav">
	      <li class="nav-item">
	        <a class="nav-link" href="${path}/WEB-INF/views/main.kosmo">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-border-all"></i>
	          <span class="menu-title">Dashboard</span>
	        </a>
	      </li>
	      <!-- 
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-addressBook" aria-expanded="false" aria-controls="ui-basic">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-address-book"></i>
	          <span class="menu-title">주소록</span>
	          <i class="menu-arrow"></i> 
	        </a>
	        <div class="collapse" id="main-addressBook">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"> <a class="nav-link" href="${path}/Address/allList.kosmo">전체 구성원</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/resources/pages/ui-features/dropdowns.html">Dropdowns</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/resources/pages/ui-features/typography.html">Typography</a></li>
	          </ul>
	        </div>
	      </li>
	      -->
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-mail" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-envelope"></i>
	          <span class="menu-title">메일</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-mail">
	          <ul class="nav flex-column sub-menu">
	              <li class="nav-item"><a class="nav-link" href="${path}/Mail/writeToOthers.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square"> 메일쓰기</i></a></li>
	              <li class="nav-item"><a class="nav-link" href="${path}/Mail/writeToMe.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square"> 내게쓰기</i></a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/Mail/mailList.kosmo">전체메일</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailView.kosmo">받은메일함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailSended.kosmo">보낸메일함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailFavorite.kosmo">즐겨찾기</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailTemp.kosmo">임시메일함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailMy.kosmo">내게쓴메일함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailSpam.kosmo">스팸메일함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailRecycle.kosmo">휴지통</a></li>
	            <!--  
	            전체메일, 받은메일함에서 표시할 항목들
	                *메일 검색 : /Mail/mailSel.kosmo
	                *메일 읽음/안읽음 표시 : /Mail/mailRead.kosmo
	                *메일 즐찾 체크여부 : /Mail/mailCheck.kosmo
	            메일 작성 페이지에서 표시할 항목
	                *메일 임시 저장 : /Mail/sendSave
	                *메일 참조 설정 : /Mail/sendRefer
	            -->
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:openChatMain('${path}/Chat/main.kosmo')" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-comment"></i>
	          <span class="menu-title">메신저</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	          <!-- <i class="menu-arrow"></i>  
	           -->
	        </a>
	        <!-- 
	        <div class="collapse" id="main-message">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Chat/main.kosmo">메신저열기</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능3</a></li>
	          </ul>
	        </div>
	        -->
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-attendance" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-user-clock"></i>
	          <span class="menu-title">근태관리</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-attendance">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/">세부기능1</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능3</a></li>
	             <li class="nav-item"><a class="nav-link" href="${path}/Attendance/dailylist.kosmo">출퇴근 관리</a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/Attendance/monthlylist.kosmo">월 근무내역</a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/">휴가 신청</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">휴가 현황</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-approval" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-clipboard"></i>
	          <span class="menu-title">전자결재</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-approval">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Approval/approvalmain.kosmo">결재목록</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/selectform.kosmo">결재문서작성</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/approvallist.kosmo">문서함</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/templist.kosmo">임시문서함</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${path}/Notice/List.kosmo" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-book"></i>
	          <span class="menu-title">공지사항</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${path}/Schedule/month.kosmo" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-calendar-check"></i>
	          <span class="menu-title">캘린더</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-todo" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-list-check"></i>
	          <span class="menu-title">업무관리</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-todo">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Project/list.kosmo">프로젝트</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Task/list.kosmo">개인업무</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Report/list.kosmo">리포트관리</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-meeting" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-handshake"></i>
	          <span class="menu-title">회의실예약</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-meeting">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Meet/list.kosmo">예약목록</a></li>
	            <!-- /Meet/calview.kosmo : 예약 캘린더로 보기 >> 예약목록에서 달력 버튼 누르면 모달로 보여주기. -->
	            <li class="nav-item"> <a class="nav-link" href="${path}/Meet/insertview.kosmo">예약신청</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link fullscreen" href="javascript:openWebRTCMain('http://192.168.0.33:3000/')" aria-expanded="false" aria-controls="form-elements" onclick='openWebRTCMain()'>
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-duotone fa-video"></i>
	          <span class="menu-title">화상회의</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	          <!-- <i class="menu-arrow"></i>  
	           -->
	        </a>
	        <!-- 
	        <div class="collapse" id="main-message">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Chat/main.kosmo">메신저열기</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">세부기능3</a></li>
	          </ul>
	        </div>
	        -->
	      </li>
	    </ul>
	  </nav>
      <!-- partial -->
      
      <div class="main-panel padding-left-220px">
	    <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
<!-- ------------------TOP.JSP END------------------ -->              
<!-- ------------------BODY START------------------ -->      
	            <!-- 
	            <div class="d-sm-flex align-items-center justify-content-between border-bottom">
	            ----Main Page의 Nav 메뉴 작성----
	            </div>            
	            -->
				
				<!--  
				<div class="tab-content tab-content-basic">
				----Main Page의 Content 작성----
	            </div>
				-->

				