<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <header class="screen-header">
      <h1 class="screen-header__title">회사이름</h1>
      <div class="screen-header__icons">
        <span><i class="fas fa-user-plus fa-lg"></i></span>
        <span><i class="fas fa-cog fa-lg"></i></span>
      </div>
    </header>
    <main class="mycrew-screen">
      <label for="crew-search-bar-form">
        <form id="crew-search-bar-form">
          <div class="position-relative">
            <input id="crew-search-bar" placeholder="Search" />
            <i class="fab fa-sistrix fa-lg position-absolute"></i>
          </div>
        </form>
      </label>
      <div class="user-component">
        <div class="user-component__column">
          <img
            src="https://avatars1.githubusercontent.com/u/61550839?s=460&u=1ae729b9a5cd1807bcfa3b371b387b0f90b6d452&v=4"
            class="user-component__avatar user-component__avatar--xl"
          />
          <div class="user-component__text">
            <div class="user-component__title">사용자이름, 상태</div> 
            <div class="user-component__subtitle">상태메세지</div>
          </div>
        </div>
        <div class="user-component"></div>
      </div>
      <div class="crew-screen__channel">
        <div class="crew-screen__channel__header">
          <span>그룹이름</span>
          <i class="fas fa-chevron-up fa-xs"></i>
        </div>

        <div class="user-component">
          <div class="user-component__column">
            <img
              src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
              class="user-component__avatar user-component__avatar--sm"
            />
            
            <div class="user-component__text">
              <div class="user-component__title user-component__title--not-bold">
                그룹내 사원이름, 상태
              </div>
              <div class="user-component__subtitle">상태메세지</div>
            </div>
          </div>
          <div class="user-component">
            <span>2</span>
            <i class="fas fa-chevron-right fa-xs"></i>
          </div>
        </div>
 
      </div>
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
  </body>
</html>
