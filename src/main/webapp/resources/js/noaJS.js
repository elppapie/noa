//Custom javascript file

var availWidth = window.screen.availWidth;
var availHeight = window.screen.availHeight;
var availWidthPX = window.screen.availWidth+"px";
var availHeightPX = window.screen.availHeight+"px";

function openChatMain(path,m_id) {
    let width=440;
    let height=650;
    window.open(path
        ,"메신저"
        ,"left="+(availWidth-width)+",top="+(availHeight-height)+",width="+width+",height="+height 
        )
}

function openWebRTCMain(path,m_id){
	window.open(path
        ,"webRTC"
        ,"left="+(availWidth)+",top="+(availHeight)+",fullscreen='yes'"
        )
}


/////////////////구성원 검색창 띄우기
function openSearchOrg(path,m_id,isInit){
	const searchName = document.querySelector("#top-input-search-members").value.trim();
	
	let width=970;
    let height=680;
    //console.log(path+"m_id="+m_id+"&searchColumn=m_name&searchWord="+searchName);
    if(!isInit){
		window.open(
			path+"m_id="+m_id+"&searchColumn=m_name&searchWord="+searchName,
			"조직도",
			"left="+(availWidth/2-width/2)+",top="+(availHeight/2-height/2)+",width="+width+",height="+height
		);
	}
	else{
		window.open(
			path+"m_id="+m_id,
			"조직도",
			"left="+(availWidth/2-width/2)+",top="+(availHeight/2-height/2)+",width="+width+",height="+height
		);
	}
};

// 검색창 검색어 입력 후 엔터 클릭 시 submit 되게 하기
const memberSearchInput = document.querySelectorAll('.navbar-member-search-input0914')
if(memberSearchInput!==null && memberSearchInput.length > 0){
	memberSearchInput.forEach(element => {
		element.addEventListener('keydown',checkForEnterPressedThenSubmit);
	})
}
function checkForEnterPressedThenSubmit(event){
	
}

/////////////////sidebar sticky로 만들기
const sidebar = document.querySelector("nav#sidebar");

if(sidebar!=null){
	var sticky = sidebar.offsetTop;
}
function makeSidebarSticky() {
  if (window.pageYOffset >= sticky && navbar!=null) {
    navbar.classList.add("sticky")
  } else {
  	if(navbar!=null){
    	navbar.classList.remove("sticky");
    }
  }
}

window.onscroll = ()=>{makeSidebarSticky()};

/////////////// .main-panel 수정하기 - 페이지 가로폭 991px 이하로 내려가면 padding-left-220px 클래스 없애기
const mainPanel = document.querySelector('.main-panel');

window.addEventListener('DOMContentLoaded',()=>{deletePaddingLeft220PX()});
window.onresize = ()=>{deletePaddingLeft220PX()};

function deletePaddingLeft220PX(){
	if(window.innerWidth <= 991 && mainPanel!=null){
		mainPanel.classList.remove("padding-left-220px");
		document.querySelector('.navbar-menu-wrapper').style.borderBottom='none';
	}
	else{
		if(mainPanel!=null){
			mainPanel.classList.add("padding-left-220px");
		}
	}
}

const top3BarIcon = document.querySelector("#top-nav-3bar-menu-ic");
if(top3BarIcon != null){
top3BarIcon.onclick = ()=>{
	if(document.querySelector('body').classList.contains('sidebar-icon-only')){
		mainPanel.classList.add("padding-left-220px");
		mainPanel.classList.remove("padding-left-70px");
	}
	else{
		mainPanel.classList.remove("padding-left-220px");
		mainPanel.classList.add("padding-left-70px");
	}
}};


///////////////sidebar 오류 수정 시작///////////////
/*
	const sessionStorage = window.sessionStorage;
    
    const nav_items_a = sidebar.querySelectorAll("#collapse > li > a"); //???
if(sidebar != null){
    sidebar.onclick = (e) => {
	  console.log("sidebar is clicked")
      if(!(e.target.nodeName==="A" && e.target.children.length==0 )) return true;
      console.log("sidebar's a tag is clicked")
      let a = e.target;
      //세션스토리지에 클릭한 사이드 메뉴와 서브 사이드메뉴를 저장.
      sessionStorage.setItem("sub-nav-item",a.textContent);
      sessionStorage.setItem("nav-item",a.parentElement.parentElement.parentElement.previousElementSibling.querySelector('span').textContent);
	  //a.parentElement.parentElement.parentElement.previousElementSibling.querySelector('span').textContent
    };
}
    //세선스토리지에 클릭한 사이드 메뉴가 저장되어 있다면 다른 메뉴의 active를 없애준다.
    console.log(sessionStorage.getItem("nav-item").toString()) //해결
    console.log(sessionStorage.getItem("sub-nav-item")) //해결
    
    if(sessionStorage.getItem("sub-nav-item")){
      //일단 모든 사이드메뉴 active 클래스 없애기
      let lis =sidebar.querySelectorAll('li');
      lis.forEach((item,index)=>{
      console.log(item);
      console.log(item.firstElementChild);
        if(item.classList.contains('active')) {
        	console.log('li tag contains "active" class');
        	item.classList.remove('active');
        }
        if(item.firstElementChild.classList.contains('active')) {
        	console.log("li's a tag contains 'active' class");
        	item.firstElementChild.classList.remove('active');
        }
      });


	}


*/

///////////////sidebar 오류 수정 끝///////////////


////////////////project/project.jsp 시작 ////////////////
	//+버튼 클릭 시 체크리스트 추가. (모달창 먼저 띄워서 입력받은 후에 입력받은 값을 htmlString에 넣어서 추가할 것.)
/*
if(document.querySelector("#project-todo-list-add-btn")!=null){
	document.querySelector("#project-todo-list-add-btn").onclick=function(e){
	 //lastLiElement.classList.remove('border-bottom-0','d-block');
	 //lastLiElement.classList.add('d-block');
	 var htmlString = '<li class="border-bottom-0"> '+
                         '<div class="form-check w-100"> '+
                           '<label class="form-check-label"> '+
                             '<input class="checkbox proj-todo-list-chbox" type="checkbox"> Lorem Ipsum is simply dummy text of the printing '+
                             '<i class="input-helper rounded"></i> '+
                           '</label> '+
                           '<div class="d-flex mt-2"> '+
                             '<div class="ps-4 text-small me-3">24 June 2020</div> '+
                             '<div class="badge badge-opacity-danger me-3">Expired</div> '+
                           '</div> '+
                         '</div> '+
                       '</li>'; 
     lastLiElement.insertAdjacentHTML('afterend',htmlString);
   }
}
*/
 
   //-버튼 클릭 시 체크리스트 제거. 
if(document.querySelector("#project-todo-list-remove-btn")!=null){   
   document.querySelector("#project-todo-list-remove-btn").onclick=function(e){
     var items = document.querySelectorAll("todo-list-chbox");
     //체크된 li 아이템들은 삭제 처리
     items.forEach(element => {
       if(element.checked==true) {
         element.parentElement.parentElement.parentElement.remove();
       }  
     });
     
   } 
}
////////////////project/project.jsp 끝 ////////////////

