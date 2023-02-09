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


/////////////////구성원 검색창 시작/////////////////////
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

/////////////////구성원 검색창 끝/////////////////////

/////////////////[공용] 전체선택/전체해제 체크박스용 함수 정의 시작/////////////////////

function count_tbody_checked_checkbox(event){
  if(event.target.type!=='checkbox') return; //이벤트 버블링 활용
  //tr을 돌며 count세기. event.target은 tbody이다.
  let table = get_table_element_from_children(event.target);
  let count=0;
  let tbody_trs = table.querySelectorAll('tbody tr');
  let total_tr_count = tbody_trs.length; // tbody내의 체크박수 수
  let all = table.querySelector('thead input.btn-check-all-onoff'); //전체선택/해제 체크박스 구하기
  tbody_trs.forEach(function(tr,index) {
      if(tr.querySelector('td > input[type="checkbox"]').checked) count++;
  })
  if(count===total_tr_count){ 
      all.checked=true; // 다 체크되면 전체선/해 체크박스 체크시키기
  }
  else {
      all.checked=false;
  }
}////////////count_tbody_checked_checkbox()

function get_table_element_from_children(child){//내가 클릭한 요소의 부모 중 table태그를 가져오는 함수
  count=0;
  while (true) {
      child = child.parentElement; //부모요소를 얻어온다.
      if(child.nodeName !== "TABLE" && count<100) {
          count++;
          continue; //얻어온 부모요소가 table이 아니면 다시 while문을 반복한다.
      }
      break; //얻어온 부모요소가 table태그이면 해당 table요소를 반환하기 위해 break한다.
  }
  if(child.nodeName !== 'TABLE') throw new Error('테이블 요소가 없습니다...')
  return child;
}////////////get_table_element_from_children()

function toggle_btn_check_all_onoff(event){ //전체선/해 checkbox클릭 시 토글효과로 전체선택/전체해제 구현
  let btn_check_all_onoff = event.target
  let table = get_table_element_from_children(btn_check_all_onoff);
  let tbody_trs = table.querySelector('tbody').querySelectorAll('tr');
  if(btn_check_all_onoff.checked) {
      tbody_trs.forEach(function(tr,index) {
          tr.querySelector('td > input[type="checkbox"]').checked=true;
      })
  }
  else{
      tbody_trs.forEach(function(tr,index) {
          tr.querySelector('td > input[type="checkbox"]').checked=false;
      })
  }
}///////////////////toggle_btn_check_all_onoff()

/////////////////[공용] 전체선택/전체해제 체크박스용 함수 정의 끝/////////////////////

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

