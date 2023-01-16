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
        <a href="#"> <!-- friendList.kosmo 링크 걸기 -->
          <i class="fa fa-color-chatGreen fa-comment " style="padding-right:8px;"> messanger</i>
        </a>
      </div>
    </div>
    
    <main class="mycrew-screen">
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
<!-- 내 정보 불러오기 시작 -->
      <div class="user-component">
        <div class="user-component__column">
          <img
            src="https://avatars1.githubusercontent.com/u/61550839?s=460&u=1ae729b9a5cd1807bcfa3b371b387b0f90b6d452&v=4"
            class="user-component__avatar user-component__avatar--xl"
          />
          <div class="user-component__text">
            <div class="user-component__title">여기에 구성원 이름 m_name</div>
            <div class="user-component__subtitle check-str-length">여기에 상태메세지를 작성하는데 글자수가 너무 길면 뒤에가 ...으로 바뀌도록 css를 추가했어요</div>
          </div>
        </div>
      </div>
<!-- 내 정보 불러오기 끝 -->      

<!-- 채팅그룹 불러오기 시작 -->      
      <div class="crew-screen__channel">
        <div class="crew-screen__channel__header">
          <span>Messanger Group</span>
          <i class="fas fa-chevron-up fa-xs"></i>
        </div>

        <!-- 구성원 1명 시작 -->
        <div class="user-component">
          <div class="user-component__column">
            <img
              src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
              class="user-component__avatar user-component__avatar--sm"
            />
            <div class="user-component__text">
              <div class="user-component__title user-component__title--not-bold">
                m_name
              </div>
              <div class="user-component__subtitle check-str-length">여기에 상태메세지를 작성하는데 글자수가 너무 길면 뒤에가 ...으로 바뀌도록 css를 추가했어요</div>
            </div>
          </div>
          <div class="user-component">
            <span>2?</span>
            <i class="fas fa-chevron-right fa-xs"></i>
          </div>
        </div>
        <!-- 구성원 1명 끝 -->

      </div>
<!-- 채팅그룹 불러오기 끝 -->            
    </main>

    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="mycrew.html"
            ><i class="fas fa-user fa-lg"></i
          ></a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="chats.html">
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
</html>
