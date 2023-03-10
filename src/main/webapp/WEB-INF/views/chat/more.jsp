<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰 페이지 -->    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="css/style.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>More - Working Crew</title>
  </head>
  <body>
    <div class="status-bar">
      <div class="status-bar__column">
        <span>No service</span>
        <i class="fas fa-wifi"></i>
      </div>
      <div class="status-bar__column">
        <span>15:52</span>
      </div>
      <div class="status-bar__column">
        <span>1000%</span>
        <i class="fas fa-battery-full"></i>
        <i class="fas fa-bolt"></i>
      </div>
    </div>

    <header class="screen-header">
      <h1 class="screen-header__title">More</h1>
      <div class="screen-header__icons">
        <span><i class="fab fa-sistrix fa-lg"></i></span>
        <span><i class="fas fa-qrcode fa-lg"></i></span>
        <span
          ><a href="settings.html"><i class="fas fa-cog fa-lg"></i></a
        ></span>
      </div>
    </header>

    <main class="more-screen">
      <div class="user-component">
        <div class="user-component__column">
          <img
            src="https://avatars1.githubusercontent.com/u/61550839?s=460&u=1ae729b9a5cd1807bcfa3b371b387b0f90b6d452&v=4"
            class="user-component__avatar user-component__avatar--xl"
          />
          <div class="user-component__text">
            <div class="user-component__title">Lorraine</div>
            <div class="user-component__subtitle">
              +82 10-1234-5678<i class="fas fa-exclamation-circle"></i>
            </div>
          </div>
        </div>
        <div class="user-component">
          <i class="fas fa-donate fa-lg"></i>
        </div>
      </div>
      <div class="find-icons-row">
        <div class="find-icons">
          <div class="find-icons__icon">
            <i class="fas fa-file-invoice-dollar"></i><span>Account</span>
          </div>
          <div class="find-icons__icon">
            <i class="far fa-calendar-check"></i><span>Calendar</span>
          </div>
          <div class="find-icons__icon">
            <i class="fas fa-dice"></i><span>Game</span>
          </div>
          <div class="find-icons__icon">
            <i class="fab fa-google-drive"></i><span>Drive</span>
          </div>
        </div>
      </div>
      <div class="find-icons-row">
        <div class="find-icons">
          <div class="find-icons__icon">
            <i class="fas fa-utensils"></i><span>Order</span>
          </div>
          <div class="find-icons__icon">
            <i class="fas fa-shopping-bag"></i><span>Shopping</span>
          </div>
          <div class="find-icons__icon">
            <i class="far fa-smile-beam"></i><span>Emoticon</span>
          </div>
          <div class="find-icons__icon">
            <i class="fas fa-gift"></i><span>Gifts</span>
          </div>
        </div>
      </div>
      <div class="more-suggestions">
        <span class="more-suggestions__title">Suggestions</span>
        <div class="more-suggestions__icons">
          <div class="more-suggestions__icon">
            <div class="more-suggestions__icon-image">
              <img
                src="https://t1.daumcdn.net/cfile/tistory/99D61B345B35DB5D19"
              />
            </div>
            <div class="more-suggestions__icon-text">Cafe</div>
          </div>
          <div class="more-suggestions__icon">
            <div class="more-suggestions__icon-image">
              <img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTW4Qzni0Fvtj_xOnDnJyDPhnGBC81Jad7yCA&usqp=CAU"
              />
            </div>
            <div class="more-suggestions__icon-text">Blog</div>
          </div>
          <div class="more-suggestions__icon">
            <div class="more-suggestions__icon-image">
              <img
                src="https://www.koreapost.co.kr/news/photo/202005/47937_47758_4130.png"
              />
            </div>
            <div class="more-suggestions__icon-text">N pay</div>
          </div>
          <div class="more-suggestions__icon">
            <div class="more-suggestions__icon-image">
              <img
                src="https://img.utdstc.com/icons/naver-map-android.png:225"
              />
            </div>
            <div class="more-suggestions__icon-text">Map</div>
          </div>
        </div>
      </div>
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

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
