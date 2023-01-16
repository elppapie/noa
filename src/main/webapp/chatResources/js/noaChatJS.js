//Custom javascript file

//this function for header in every pages ------start------
var availWidth = window.screen.availWidth;
var availHeight = window.screen.availHeight;

function openNOAMain(path,m_id) {
	window.open(path,"_black",
		"left=0,top=0,width=availWidth,height=availHeight"
        )    	
}
//------end------

//this function for chat.jsp pages ------start------
var myChatTextArea = document.querySelector("#myChatTextArea123");
var myChatButton = document.querySelector('#myChatButton123');
myChatTextArea.onkeydown = function(e) {
    if (e.keyCode==13) {
        if(!e.shiftKey){
        e.preventDefault();
        myChatForm123.submit();
        }
    }
};
//------end------