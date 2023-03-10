<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Top.jsp -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="view" value="${pageContext.request.contextPath}/WEB-INF/views"/>
<c:set var="m_id" ><sec:authentication property="principal.username"/></c:set>

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
  <link rel="stylesheet" href="${path}/resources/vendors/select2/select2.min.css"> 
  <link rel="stylesheet" href="${path}/resources/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
      	    <img src="${path}/resources/images/text-NodeArchive_express.svg" alt="logo" style="width:115% !important; height:auto; max-width:none"/>
    	  </a>
	      <a class="navbar-brand brand-logo-mini" href="${path}/home.kosmo">
	        <img src="${path}/resources/images/logo-removebg-preview.png" alt="logo" />
	      </a>
        </div>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-top"> 
        <ul class="navbar-nav fg-1">
          <li class="nav-item font-weight-semibold d-none d-lg-block mra">
            <h1 class="welcome-text">?????? ???????????? <span class="text-black fw-bold">${m_id}</span></h1>
          </li>
          <!-- ????????? ?????? -->
          <li class="nav-item d-flex align-items-center mla">
          	<div class="form-group " style="margin:0px;">
          		<div class="input-group">
          			<input type="text" class="form-control navbar-member-search-input0914" placeholder="????????? ??????" id="top-input-search-members"/>
          			<div class="input-group-append d-flex justify-content-center align-items-center top-btn-search-members-append" onclick="openSearchOrg('${path}/Address/allListNoPaging.kosmo?','${m_id}')">
          				<button type="button" class="btn btn-rounded top-btn-search-members">
          					<i class="ti-search"></i>
         				</button>
          			</div>
          		</div>
          	</div>
          </li> 
          
          
          
          <li class="nav-item dropdown"> 
            <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="icon-bell"></i>
              <span class="count"></span>
            </a>
          
          	<!-- ?????? ?????? ??? ?????????????????? ???????????? -->
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
              <img class="img-xs rounded-circle" src="${path}/resources/images/faces/face8.jpg" alt="Profile image"> 
            </a>
            
            <!-- ????????? ?????? ??? ?????????????????? ???????????? -->
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
              <div class="dropdown-header text-center">
                <img class="img-md rounded-circle" src="${path}/resources/images/faces/face8.jpg" alt="Profile image">
                <p class="mb-1 mt-3 font-weight-semibold">\${m_name}</p>
                <p class="fw-light text-muted mb-0">${m_id}</p>
              </div>
              <a class="dropdown-item" href="${path}/Login/myPage.kosmo"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> My Page <span class="badge badge-pill badge-danger">1</span></a>
              <a class="dropdown-item" href="#"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i> Messages</a>
              <a class="dropdown-item" href="#"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i> Activity</a>
              <a class="dropdown-item" href="#"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
              <a class="dropdown-item" href="${path}/Login/logout.kosmo"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
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
	          <span class="menu-title">?????????</span>
	          <i class="menu-arrow"></i> 
	        </a>
	        <div class="collapse" id="main-addressBook">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"> <a class="nav-link" href="${path}/Address/allList.kosmo">?????? ?????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/resources/pages/ui-features/dropdowns.html">Dropdowns</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/resources/pages/ui-features/typography.html">Typography</a></li>
	          </ul>
	        </div>
	      </li>
	      -->
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-mail" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-envelope"></i>
	          <span class="menu-title">??????</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-mail">
	          <ul class="nav flex-column sub-menu">
	              <li class="nav-item"><a class="nav-link" href="${path}/Mail/writeToOthers.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square"> ????????????</i></a></li>
	              <li class="nav-item"><a class="nav-link" href="${path}/Mail/writeToMe.kosmo"><i class="fa fa-color-gray fa-light fa-pen-to-square"> ????????????</i></a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/Mail/mailList.kosmo">????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailView.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailSended.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailFavorite.kosmo">????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailTemp.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailMy.kosmo">??????????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailSpam.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Mail/mailRecycle.kosmo">?????????</a></li>
	            <!--  
	            ????????????, ????????????????????? ????????? ?????????
	                *?????? ?????? : /Mail/mailSel.kosmo
	                *?????? ??????/????????? ?????? : /Mail/mailRead.kosmo
	                *?????? ?????? ???????????? : /Mail/mailCheck.kosmo
	            ?????? ?????? ??????????????? ????????? ??????
	                *?????? ?????? ?????? : /Mail/sendSave
	                *?????? ?????? ?????? : /Mail/sendRefer
	            -->
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:openChatMain('${path}/Chat/main.kosmo')" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-comment"></i>
	          <span class="menu-title">?????????</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	          <!-- <i class="menu-arrow"></i>  
	           -->
	        </a>
	        <!-- 
	        <div class="collapse" id="main-message">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Chat/main.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????3</a></li>
	          </ul>
	        </div>
	        -->
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-attendance" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-user-clock"></i>
	          <span class="menu-title">????????????</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-attendance">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/">????????????1</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????3</a></li>
	             <li class="nav-item"><a class="nav-link" href="${path}/Attendance/dailylist.kosmo">????????? ??????</a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/Attendance/monthlylist.kosmo">??? ????????????</a></li>
	            <li class="nav-item"><a class="nav-link" href="${path}/">?????? ??????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">?????? ??????</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-approval" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-clipboard"></i>
	          <span class="menu-title">????????????</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-approval">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Approval/approvalmain.kosmo">????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/selectform.kosmo">??????????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/approvallist.kosmo">?????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Approval/templist.kosmo">???????????????</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${path}/Notice/List.kosmo" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-book"></i>
	          <span class="menu-title">????????????</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${path}/Schedule/month.kosmo" aria-expanded="false" aria-controls="form-elements">
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-calendar-check"></i>
	          <span class="menu-title">?????????</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-todo" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-list-check"></i>
	          <span class="menu-title">????????????</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-todo">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Project/list.kosmo">????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Task/list.kosmo">????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/Report/list.kosmo">???????????????</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-bs-toggle="collapse" href="#main-meeting" aria-expanded="false" aria-controls="form-elements">
	          <i class="menu-icon mifa fa fa-color-gray fa-light fa-handshake"></i>
	          <span class="menu-title">???????????????</span>
	          <i class="menu-arrow"></i>
	        </a>
	        <div class="collapse" id="main-meeting">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Meet/list.kosmo">????????????</a></li>
	            <!-- /Meet/calview.kosmo : ?????? ???????????? ?????? >> ?????????????????? ?????? ?????? ????????? ????????? ????????????. -->
	            <li class="nav-item"> <a class="nav-link" href="${path}/Meet/insertview.kosmo">????????????</a></li>
	          </ul>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link fullscreen" href="javascript:openWebRTCMain('http://192.168.0.33:3000/')" aria-expanded="false" aria-controls="form-elements" onclick='openWebRTCMain()'>
	        <!--  data-bs-toggle="collapse"  -->
	          <i class="menu-icon mifa fa fa-duotone fa-video"></i>
	          <span class="menu-title">????????????</span>
	          <i class="menu-chat-sidebar"></i>
	          <i class="fa fa-solid fa-up-right-from-square load-immediate-icon"></i>
	          <!-- <i class="menu-arrow"></i>  
	           -->
	        </a>
	        <!-- 
	        <div class="collapse" id="main-message">
	          <ul class="nav flex-column sub-menu">
	            <li class="nav-item"><a class="nav-link" href="${path}/Chat/main.kosmo">???????????????</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????2</a></li>
	            <li class="nav-item"> <a class="nav-link" href="${path}/">????????????3</a></li>
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
	            ----Main Page??? Nav ?????? ??????----
	            </div>            
	            -->
				
				<!--  
				<div class="tab-content tab-content-basic">
				----Main Page??? Content ??????----
	            </div>
				-->

				