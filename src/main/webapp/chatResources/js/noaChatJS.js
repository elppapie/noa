//Custom javascript file

var availWidth = window.screen.availWidth;
var availHeight = window.screen.availHeight;
var this_opener = window.opener;


function openNOAMain(path,m_id) {
    if(this_opener!==null){
    	window.close();
    }
    else{
    	window.open(path,"_blank");
    }
}