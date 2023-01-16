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
  <style>
    .user-component{
      justify-content: none;
    }
  </style>
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
 
    <header class="screen-header" style="margin-bottom: 10px; padding-bottom: 5px;">
      <h1 class="screen-header__title">Chats</h1>
      <div class="fg-1">
        <label for="crew-search-bar-form">
          <form id="crew-search-bar-form">
            <div class="position-relative">
              <input id="crew-search-bar" placeholder="검색" />
              <a href="#"> <!-- 검색 기능으로 이동. ~~~.kosmo -->
                <i class="fab fa-sistrix fa-lg position-absolute"></i>
              </a>
            </div>
          </form>
        </label> 
      </div>
    </header>
    
    <main class="chats-screen">
      <!-- 칸 맞추기용 코드(기능없음) 시작 -->
      <label for="crew-search-bar-form">
        <form id="crew-search-bar-form">
          <div class="position-relative">
            <input id="crew-search-bar" placeholder="검색" />
            <a href="#"> 
              <i class="fab fa-sistrix fa-lg position-absolute"></i>
            </a>
          </div>
        </form>
      </label>      
      <!-- 칸 맞추기용 코드(기능없음) 끝 -->
      
<!-- 채팅그룹 불러오기 시작 -->      
      <div class="crew-screen__channel" >
        
        <!-- 채팅방 시작 -->
        <div class="user-component">
          <a href="#" class="fg-1">  <!-- 누르면 해당 채팅방으로 이동 -->
            <div class="user-component__column"> 
              <img
                src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
                class="user-component__avatar user-component__avatar--sm"
              />
              <div class="user-component__text">
                <div class="user-component__title user-component__title--not-bold">
                  채팅방 이름 chat_name
                </div>
                <div class="user-component__subtitle check-str-length">여기에 마지막 채팅 내용이 써질 겁니다...</div>
              </div>
            </div>
          </a>
          <div class="user-component">
            <a href="#"> <!-- 설정 모달 띄우기 -->
              <i class="fa fa-light fa-gear"></i>
            </a>
          </div>
        </div>
        <!-- 채팅방 끝 -->

        <!-- 채팅방 시작 -->
        <div class="user-component">
          <a href="#" class="fg-1">  <!-- 누르면 해당 채팅방으로 이동 -->
            <div class="user-component__column"> 
              <img
                src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
                class="user-component__avatar user-component__avatar--sm"
              />
              <div class="user-component__text">
                <div class="user-component__title user-component__title--not-bold">
                  채팅방 이름 chat_name
                </div>
                <div class="user-component__subtitle check-str-length">여기에 마지막 채팅 내용이 써질 겁니다...</div>
              </div>
            </div>
          </a>
          <div class="user-component">
            <a href="#"> <!-- 설정 모달 띄우기 -->
              <i class="fa fa-light fa-gear"></i>
            </a>
          </div>
        </div>
        <!-- 채팅방 끝 -->


      </div>
<!-- 채팅그룹 불러오기 끝 -->            
    </main>

    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="mycrew.html"
            ><i class="far fa-user fa-lg"></i
          ></a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="chats.html">
            <span class="nav__notification">1</span>
            <i class="fas fa-comments fa-lg"></i
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

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="${path}/chatResources/js/noaChatJS.js"></script>
  </body>
</html>
