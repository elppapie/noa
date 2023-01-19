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
        <a href="#"> <!--friendList.kosmo 링크 걸기 -->
          <i class="fa fa-color-chatGreen fa-comment " style="padding-right:8px;"> messanger</i>
        </a>
      </div>
    </div>

<!-- 채팅방 헤더 시작 -->
    <header class="alt-header alt-header__color" >
      <div class="alt-header__column" style="width: 30px;">
        <a href="${path}/Chat/chatList.kosmo">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column fg-1" style="padding-left: 10px; padding-right: 10px;">
        <h1 class="alt-header__title show-in-oneline fsu-m" >${chat['CHAT_NAME']}</h1>
      </div>
      <div class="alt-header__column" style="width: 70px;">
        <span><i class="fas fa-search fa-lg"></i></span>
        <span><i class="fas fa-bars fa-lg"></i></span>
      </div>
    </header>
<!-- 채팅방 헤더 끝 -->


    <main class="chat-screen" style="padding-top:95px">

      <!-- 하루가 지날 때마다 생기는 타임라인 -->
      <div class="chat_timestamp">2023년 1월 20일 금요일</div>

	  <c:forEach var="msg" items="${chat_msg}">
<!-- 상대방 챗 하나 시작 -->
      	<c:if test="${msg['M_ID'] != sessionScope.username}" var="notMine">
	      <div class="message-row-margin">
	        <div class="message-row">
	          <!-- 프로필사진 -->
	          <img
	            src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
	          />
	          <div class="message-row__content">
	            <!-- 이름 m_name -->
	            <span class="message__author">${msg['M_NAME']}</span>
	            <div class="message__info">
	              <span class="message__bubble">${msg['CM_CONTENT']}</span>
	              <span class="message__time">${msg['CM_REGIDATE']}</span>
	            </div>
	          </div>
	        </div>
	      </div>
	    </c:if>  
<!-- 상대방 챗 하나 끝 -->      
      
<!-- 내 챗 하나 시작 >> 내 챗에는 -own 이 붙음. -->
	    <c:if test="${! notMine}">
	      <div class="message-row-margin">
	        <div class="message-row message-row--own">
	          <div class="message-row__content">
	            <div class="message__info">
	              <span class="message__time">${msg['CM_REGIDATE']}</span>
	              <span class="message__bubble">${msg['CM_CONTENT']}</span>
	            </div>
	          </div>
	        </div>
	      </div>
	    </c:if>
<!-- 내 챗 하나 끝 -->
	  </c:forEach>
	        
      <form class="reply" name="myChatForm123">

        <!-- 하단 첨부파일 버튼 시작 -->
        <div class="reply__column" style="display: flex; justify-content: space-evenly;">
          <i class="far fa-plus-square fa-lg"></i>
          <i class="far fa-smile-wink fa-lg"></i>
        </div>
        <!-- 하단 첨부파일 버튼 끝 -->
        
        <!-- 하단 메세지 전송 버튼 시작 -->
        <div class="reply__column">
          <!-- <input type="textarea" placeholder="메세지를 작성하세요." id="myChatTextArea123" /> -->
          <textarea class="" id="myChatTextArea123" cols="46" rows="2" autofocus></textarea>
        </div>
        <button class="hover-style-pointer chat-button" id="myChatButton123">
          <i class="fas fa-arrow-up"></i>
        </button>
        <!-- 하단 메세지 전송 버튼 끝 -->

      </form>

    </main>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="${path}/chatResources/js/noaChatJS.js"></script>
    <script>
	    var myChatTextArea = document.querySelector("#myChatTextArea123");
	    var myChatButton = document.querySelector('#myChatButton123');
	    myChatTextArea.onkeydown = function(e) {
	        if (e.keyCode==13) {
	            if(!e.shiftKey){
	            e.preventDefault();
	            myChatForm123.submit();
	            }
	        }
	    };
    </script>
  </body>
</html>
