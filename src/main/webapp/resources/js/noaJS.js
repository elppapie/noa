//Custom javascript file

var availWidth = window.screen.availWidth;
var availHeight = window.screen.availHeight;
var availWidthPX = window.screen.availWidth+"px";
var availHeightPX = window.screen.availHeight+"px";

function openChatMain(path,m_id) {
    var width=440;
    var height=650;
    window.open(path
        ,"메신저"
        ,"left="+(availWidth-width)+",top="+(availHeight-height)+",width="+width+",height="+height 
        )
}






