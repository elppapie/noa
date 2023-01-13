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
    <div class="status-bar">
      <div class="status-bar__column">
        <div>
          <a href="javascript:openNOAMain('${path}/home.kosmo')">
            <img src="${path}/resources/images/textlogo-NodeArchive.svg" alt="text-logo" style="width:100%;height:100%;"/>
        	</a>
        </div>
      </div>
  	  <div class="status-bar__column"></div>
      <div class="status-bar__column">
        <i class="fa fa-color-chatGreen fa-comment" style="padding-right:8px;"></i>
      </div>
    </div>

  <body>
    <header class="welcome-header">
      <h1 class="welcome-header__title">노드아카이브 메신저 로그인</h1>
      <p class="welcome-header__text">
        메신저를 이용을 위해 다시 로그인해주세요.
      </p>
    </header>
    <form action="${path}/Chat/login.kosmo" method="POST" id="login-form">
      <input name="username" type="text" required placeholder="로그인 ID" />
      <input name="password" type="password" required placeholder="비밀번호" />
      <input type="submit" value="log in" />
      <a href="#">ID/비밀번호 찾기</a>
    </form>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="${path}/chatResources/js/noaChatJS.js"></script>
  </body>
</html>
