<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/chatResources"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="${res}/css/style.css" />
    <link rel="stylesheet" href="${path}/resources/css/noaCss.css" />
    <link rel="shortcut icon" href="${path}/resources/images/logo-removebg-preview.png" />
    
    <!-- 제이쿼리 관련-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>노드아카이브 메신저</title>
  </head>
  <body>
    <div class="status-bar">
      <div class="status-bar__column">
        <div>
          <a href="#">
            <img src="${path}/resources/images/textlogo-NodeArchive.svg" alt="text-logo" class="chat-pages-txt-logo"/>
          </a>
        </div>
      </div>
      <div class="status-bar__column"></div>
      <div class="status-bar__column">
        <a href="#"> <!-- friendList.kosmo 링크 걸기 -->
          <i class="fa fa-color-chatGreen fa-comment " style="padding-right:8px;"> messanger</i>
        </a>
      </div>
    </div>
    
    <main class="mycrew-screen">
      <label for="crew-search-bar-form">
        <form id="crew-search-bar-form">
          <div class="position-relative">
            <input type="text" id="crew-search-bar" placeholder="검색" />
            <a href="#"> <!-- 검색 기능으로 이동. ~~~.kosmo -->
              <i class="fab fa-sistrix fa-lg position-absolute"></i>
            </a>
          </div>
        </form>
      </label>
<!-- 내 정보 불러오기 시작 -->
      <div class="user-component">
        <div class="user-component__column">
          <img
            src="https://avatars1.githubusercontent.com/u/61550839?s=460&u=1ae729b9a5cd1807bcfa3b371b387b0f90b6d452&v=4"
            class="user-component__avatar user-component__avatar--xl"
          />
          <div class="user-component__text">
            <div class="user-component__title">${info['M_NAME']}, ${info['M_STATUS']}</div>
            <div class="user-component__subtitle check-str-length">${info['M_PROFILE_MSG']}</div>
          </div>
        </div>
      </div>
<!-- 내 정보 불러오기 끝 -->      

<!-- 채팅그룹 불러오기 시작 -->      
      <!-- 그룹 foreach-->
      <h3>즐겨찾기 그룹</h3>
      <!-- 그룹명 -->
      <c:forEach var="group" items="${groupName}">
        <div class="crew-screen__channel">        
          <div class="crew-screen__channel__header">
            <span>${group['GROUP_NAME']}</span>
            <i class="fas fa-chevron-up fa-xs"></i>
          </div>
          <!-- 그룹에 해당하는 멤버들 -->        
		  <c:forEach var="item" items="${record}">
			<c:if test="${group['GROUP_NAME']==item['GROUP_NAME']}">
	          <div class="user-component">
	            <div class="user-component__column">
	              <img
	                src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
	                class="user-component__avatar user-component__avatar--sm"/><!-- 프로필사진: ${item['M_PROFILE_IMG']} -->
	            
	              <div class="user-component__text">
	                <div class="user-component__title user-component__title--not-bold">
	                  ${item['M_NAME']}, ${item['M_STATUS']}
	                </div>
	                <div class="user-component__subtitle">${item['M_PROFILE_MSG']}</div>
	              </div>
	            </div>
	            <div class="user-component">
	              <span>2</span>
	              <i class="fas fa-chevron-right fa-xs"></i>
	            </div>
	          </div>
	        </c:if>
          </c:forEach> 		
        </div>
      </c:forEach>
      
      <!-- 구성원 전체목록 foreach-->
      <h3>구성원 목록</h3>
      <!-- 부서명 -->
      <c:forEach var="group" items="${deptName}">
        <div class="crew-screen__channel">        
          <div class="crew-screen__channel__header">
            <span>${group['DEPT_NAME']}</span>
            <i class="fas fa-chevron-up fa-xs"></i>
          </div>
          <!-- 팀명 -->        
		  <c:forEach var="team" items="${teamName}">
			<c:if test="${group['DEPT_CODE']==team['DEPT_CODE']}">
				<div class="crew-screen__channel__header">
	              <span>${team['TEAM_NAME']}</span>
	              <i class="fas fa-chevron-up fa-xs"></i>
	            </div>
	            <c:forEach var="item" items="${record2}">
			    	<c:if test="${team['TEAM_NO']==item['TEAM_NO']}">  
			          <div class="user-component">
			            <div class="user-component__column">			            
			              <div class="user-component__text">
			                <div class="user-component__title user-component__title--not-bold">
			                  ${item['M_NAME']}, ${item['M_STATUS']}
			                </div>
			                <div class="user-component__subtitle">${item['M_PROFILE_MSG']}</div>
			              </div>
			            </div>			            
			          </div>
					</c:if> 
	            </c:forEach>
	        </c:if>
          </c:forEach> 		
        </div>
      </c:forEach>
<!-- 채팅그룹 불러오기 끝 -->            
    </main>

    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="${path}/Chat/friendList.kosmo"
            ><i class="fas fa-user fa-lg"></i
          ></a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="${path}/Chat/chatList.kosmo">
            <span class="nav__notification">1</span>
            <i class="far fa-comments fa-lg"></i
          ></a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="find.html"
            ><i class="fab fa-sistrix fa-lg"></i
          ></a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="more.html">
            <span class="nav__notification-ver2"></span>
            <i class="fas fa-ellipsis-h fa-lg"></i
          ></a>
        </li>
      </ul>
    </nav>
    <div id="splash-screen">
      <i class="fab fa-phoenix-framework"></i>
    </div>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="${path}/chatResources/js/noaChatJS.js"></script>
  </body>
  
  <script>
  
	  //자동완성기능 ajax
	  $('#crew-search-bar').autocomplete({
			source : function(request, response) { //source: 입력시 보일 목록
			     $.ajax({
			           url : 'searchMembers.kosmo'   
			         , type : "POST"
			         , dataType: "JSON"
			         , data : {value: request.term}	// 검색 키워드
			         , success : function(data){ 	// 성공
			             response(
			                 $.map(data.resultList, function(item) {
			                	 var m_name=item.M_NAME+" |"+item.TEAM_NAME+"("+item.POSITION_NAME+")";
			                	 
			                     return {
			                    	     label : m_name   	// 목록에 표시되는 값
			                           , value : item.M_NAME 	// 선택 시 input창에 표시되는 값
			                     };
			                 })
			             );    //response
			         }
			         ,error : function(request,status,error){ //실패
			             alert("오류가 발생했습니다.");
			        	 console.log("message: " + request.responseText);
			         }
			     });
			}
			,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
			}
			,minLength: 1// 최소 글자수
			,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
			,delay: 100	//autocomplete 딜레이 시간(ms)
			,select : function(evt, ui) { 
		      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
					console.log(ui.item.label);
					console.log(ui.item.idx);
			 }
		});
  
  </script>
  
</html>
