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
    <title>Settings - Working Crew</title>
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

    <header class="alt-header">
      <div class="alt-header__column">
        <a href="more.html">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">Settings</h1>
      </div>
      <div class="alt-header__column">
        <span><i class="fas fa-search fa-lg"></i></span>
      </div>
    </header>

    <main class="main-screen">
      <ul class="settings-list">
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-bullhorn"></i>
            <span>Notices</span>
          </div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-flask"></i>
            <span>Working Crew Lab</span>
          </div>
        </li>
        <li class="settings__setting-2">
          <div class="settings__setting-column">
            <i class="fas fa-info-circle"></i>
            <span>Version</span>
          </div>
          <div class="settings__setting-column">Lastest Version</div>
        </li>

        <div class="settings__border-line"></div>

        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-unlock-alt"></i>
            <span>Privacy</span>
          </div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-bell"></i>
            <span>Notifications</span>
          </div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-user-friends"></i>
            <span>Crews</span>
          </div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-comments"></i>
            <span>Chats</span>
          </div>
        </li>
        <li class="settings__setting">
          <div class="settings__setting-column">
            <i class="fas fa-sun"></i>
            <span>Display</span>
          </div>
        </li>
      </ul>
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
