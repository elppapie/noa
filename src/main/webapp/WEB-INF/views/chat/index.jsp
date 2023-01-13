<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Top.jsp -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="res" value="${pageContext.request.contextPath}/resources"/>
<c:set var="view" value="${pageContext.request.contextPath}/WEB-INF/views"/>


<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="css/style.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome to Working Crew</title>
  </head>
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

  <body>
    <header class="welcome-header">
      <h1 class="welcome-header__title">Welcome to Working Crew</h1>
      <p class="welcome-header__text">
        If you have Working Crew Account,log in with your email or phone number.
      </p>
    </header>
    <form action="${path}/Chat/login.kosmo" method="POST" id="login-form">
      <input name="username" type="text" required placeholder="ID" /> <!-- 아이디입력 -->
      <input name="password" type="password" required placeholder="password" /> <!-- 비밀번호입력 -->
      <input type="submit" value="log in" />
      <!--  회원가입이 굳이 필요할까...
      <input type="submit" value="sign up" />
      -->
      <a href="#">Find Working Crew Account or password</a>
    </form>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
