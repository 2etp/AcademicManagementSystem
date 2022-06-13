/*const loginForm = document.querySelector("#loginForm");
const loginIDInput = document.querySelector("#idInput").value;
const loginPasswordInput = document.querySelector("#password").value;


function loginSubmit(event){
  event.preventDefault();

  if(loginIDInput <= 5 && loginPasswordInput <= 8){
    console.log(loginIDInput);
  }else if(){
    console.log(loginPasswordInput);
  }else{
    
  }
};




loginForm.addEventListener("submit", loginSubmit)*/

function check_recaptcha(){
	var v = grecaptcha.getResponse();
	if (v.length ==0) {
		alert ("'로봇이 아닙니다.'를 체크해주세요.");
		return false;
	} else {
		location.reload();
		return true;
	}
}