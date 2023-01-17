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

////////////////project/project.jsp 시작 ////////////////
	//+버튼 클릭 시 체크리스트 추가. (모달창 먼저 띄워서 입력받은 후에 입력받은 값을 htmlString에 넣어서 추가할 것.)
if(document.querySelector("#project-todo-list-add-btn")!=null){
	document.querySelector("#project-todo-list-add-btn").onclick=function(e){
 	var lastLiElement = document.querySelector('ul.project-todo-list-ulelement-custom li:last-child');
	 lastLiElement.classList.remove('border-bottom-0','d-block');
	 lastLiElement.classList.add('d-block');
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
 
   //-버튼 클릭 시 체크리스트 제거. 
if(document.querySelector("#project-todo-list-remove-btn")!=null){   
   document.querySelector("#project-todo-list-remove-btn").onclick=function(e){
     var items = document.querySelectorAll(".proj-todo-list-chbox");
     //체크된 li 아이템들은 삭제 처리
     items.forEach(element => {
       if(element.checked==true) {
         element.parentElement.parentElement.parentElement.remove();
       }  
     });
     //ul의 마지막 li의 클래스를 d-block에서 border-bottom-0로 바꿔주기
     var lastLiElement = document.querySelector('ul.project-todo-list-ulelement-custom li:last-child');
     var isBorderBottom=Array.from(lastLiElement.classList).some(function(item){
       if(item==='border-bottom-0') return true;
       else return false;
     })
     if(!isBorderBottom){
       lastLiElement.classList.remove('d-block');
       lastLiElement.classList.add('border-bottom-0');
     }
   } 
}
////////////////project/project.jsp 끝 ////////////////


