var postFormEl = document.querySelector("form[name='postFrm']");
var boardTitleInputEl = document.querySelector(".boardTitle");
var boardContentTextareaEl = document.querySelector(".boardContent");
var postFormSubmitEl = document.querySelector(".sendBnt");

postFormSubmitEl.addEventListener("click", function(event){
	event.preventDefault();
	
	if(boardTitleInputEl.value == ""){
		alert("게시판 제목을 작성해주세요");
		return 0;
	}
	
	if(boardContentTextareaEl.value == ""){
		alert("게시판 내용을 작성해주세요");
		return 0;
	}
	
	postFormEl.submit();
})