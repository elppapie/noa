<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jsQr.js"></script>

<style type="text/css">
*{
       margin : 0;
   }
   body{
       width : 100%;
       height: 100%;
       position: relative;
       font-size: 14px;
       font-family: Noto Sans KR;
       line-height: 1.15;
   }
.contents{
       position: relative;
       width: 510px;
       height: 700px;    
       box-sizing: border-box;
   }
.article {
	position: absolute;
	width:510px;
	height:700px;
	text-align: center;
}
.conTitle{
       width: px;
       height: 40px;
       line-height: 40px;
       padding: 20px 0;
	font-size: 32px;
	font-weight: 700
   }
.frame_wrap, .info {
	width:100%;
	margin-bottom: 20px;
}
#frame canvas{
	width: 510px;
	height: 400px;
}
div#output {
	background-color: #e7e7e7;
	height: 80px;
	line-height: 80px;
	font-size: 16px;
	padding:8px;
	margin : 0; 
	text-align: center;
}
</style>

</head>
<body>

        <div class="contents">
			<div class="article">
				<div class="conTitle">QR์ค์บ</div>
				<div class="frame_wrap">
					<div id="frame">
						<div id="loadingMessage">
							๐ฅ ๋น๋์ค ์คํธ๋ฆผ์ ์ก์ธ์ค ํ  ์ ์์ต๋๋ค<br/>์น์บ ์ด ํ์ฑํ๋์ด ์๋์ง ํ์ธํ์ญ์์ค
						</div>
						<canvas id="canvas"></canvas>
					</div>
				</div>
				<div class="info">
					<div id="output">
						<div id="outputMessage">
							QR์ฝ๋๋ฅผ ์นด๋ฉ๋ผ์ ๋ธ์ถ์์ผ ์ฃผ์ธ์
						</div>
						<form name="formEnter" id="frm">
						<div class="outputLayer" hidden>
							<textarea id="outputData" style="width: 490px;" name="enterInfo">
							</textarea>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<script type="text/javascript">	
	//qr์ค์บ๋ ๋ซ๊ธฐ
	${message}
	${alert}
	document.addEventListener("DOMContentLoaded", function() {
		var video = document.createElement("video");		
		var canvasElement = document.getElementById("canvas");
		var canvas = canvasElement.getContext("2d");
		var loadingMessage = document.getElementById("loadingMessage");
		var outputContainer = document.getElementById("output");
		var outputMessage = document.getElementById("outputMessage");
		var outputData = document.getElementById("outputData");
		
		function drawLine(begin, end, color) {
			canvas.beginPath();
			canvas.moveTo(begin.x, begin.y);
			canvas.lineTo(end.x, end.y);
			canvas.lineWidth = 4;
			canvas.strokeStyle = color;
			canvas.stroke()
    	}
		// ์นด๋ฉ๋ผ ์ฌ์ฉ์
		navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
      		video.srcObject = stream;
      		video.setAttribute("playsinline", true);// iOS ์ฌ์ฉ์ ์ ์ฒด ํ๋ฉด์ ์ฌ์ฉํ์ง ์์์ ์ ๋ฌ
         	video.play();
      		requestAnimationFrame(tick);
		});

		function tick() {
			loadingMessage.innerText = "โ ์ค์บ ๊ธฐ๋ฅ์ ํ์ฑํ ์ค์๋๋ค."
			if(video.readyState === video.HAVE_ENOUGH_DATA) {
        		      loadingMessage.hidden = true;
        		      canvasElement.hidden = false;
        		      outputContainer.hidden = false;
					  
					  // ์ฝ์ด๋ค์ด๋ ๋น๋์ค ํ๋ฉด์ ํฌ๊ธฐ
        		      canvasElement.height = video.videoHeight;
        	 	      canvasElement.width = video.videoWidth;
        		      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
        		      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
        		      var code = jsQR(imageData.data, imageData.width, imageData.height, {
                                    inversionAttempts : "dontInvert",
					  });
        		      
                    // QR์ฝ๋ ์ธ์์ ์ฑ๊ณตํ ๊ฒฝ์ฐ
                              if(code) {
                                     // ์ธ์ํ QR์ฝ๋์ ์์ญ์ ๊ฐ์ธ๋ ์ฌ์ฉ์์๊ฒ ๋ณด์ฌ์ง๋ ํ๋๋ฆฌ ์์ฑ
                                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
                                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
                                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
                                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000")
                                    outputMessage.hidden = true;
                                    outputData.parentElement.hidden = false;
                                    // QR์ฝ๋ ๋ฉ์์ง ์ถ๋ ฅ
									outputData.innerHTML = code.data;
									// return์ ์จ์ ํจ์๋ฅผ ๋น ์ ธ๋๊ฐ๋ฉด QR์ฝ๋ ํ๋ก๊ทธ๋จ์ด ์ข๋ฃ๋๋ค.
									if(confirm('ํด๊ทผํ์๊ฒ ์ต๋๊น?') == true){ //ํ์ธ
										/* var frm = $("#frm").serialie();
										$.ajax({
											url : "${pageContext.request.contextPath}/enter",
											type : "get",
											data : frm, 
											dataType : "json", 
											success : function(data){
												self.close();
											}	
										}); */
		                            	document.formEnter.action="leave";
		                            	document.formEnter.methood="get";
										document.formEnter.submit();
										/* window.opener.location.reload(); */
		                             } else{
		                            	  return false;
		                             }
									return;
                              }
                              // QR์ฝ๋ ์ธ์์ ์คํจํ ๊ฒฝ์ฐ 
                    		/* else {
                                    outputMessage.hidden = false;
                                    outputData.parentElement.hidden = true;
                              } */
                      }
      		      requestAnimationFrame(tick);
		}
	});
</script>