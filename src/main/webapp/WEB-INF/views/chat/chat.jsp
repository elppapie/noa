<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="css/style.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Memo - Working Crew</title>
  </head>
  <body>
    <div class="status-bar status-bar__color">
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

    <header class="alt-header alt-header__color">
      <div class="alt-header__column">
        <a href="chats.html">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">Keep Memo</h1>
      </div>
      <div class="alt-header__column">
        <span><i class="fas fa-search fa-lg"></i></span>
        <span><i class="fas fa-bars fa-lg"></i></span>
      </div>
    </header>

    <main class="chat-screen">
      <div class="chat_timestamp">Tuseday, Jun 20, 2020</div>
      <div class="message-row-margin">
        <div class="message-row">
          <img
            src="https://media.glassdoor.com/sqll/599602/naver-squarelogo-1429700032474.png"
          />
          <div class="message-row__content">
            <span class="message__author">Keep memo</span>
            <div class="message__info">
              <span class="message__bubble">Hi! I'm your memo</span>
              <span class="message__time">12:00</span>
            </div>
          </div>
        </div>
      </div>
      <div class="message-row-margin">
        <div class="message-row message-row--own">
          <div class="message-row__content">
            <div class="message__info">
              <span class="message__time">12:02</span>
              <span class="message__bubble">My youtube channel</span>
            </div>
          </div>
        </div>
      </div>
      <div class="message-row-margin">
        <div class="message-row message-row--own">
          <div class="message-row__content">
            <div class="message__info">
              <span class="message__time">12:02</span>
              <span class="message__bubble"
                >https://www.youtube.com/<br />channel/UC8B8z9BHiwmEmNEqDpDNd8Q</span
              >
            </div>
          </div>
        </div>
      </div>
      <form class="reply">
        <div class="reply__column">
          <i class="far fa-plus-square fa-lg"></i>
        </div>
        <div class="reply__column">
          <input type="text" placeholder="Write a message" />
          <i class="far fa-smile-wink fa-lg"></i>
          <button>
            <i class="fas fa-arrow-up"></i>
          </button>
        </div>
      </form>
    </main>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
