var formEl = document.querySelector("#loginForm");
var submitEl = document.querySelector("#action");
var idEl = document.querySelector("#idInput");
var passwordEl = document.querySelector("#passwordInput");


function check_recaptcha(){
	var v = grecaptcha.getResponse();
	if (v.length == 0) {
		alert ("'로봇이 아닙니다.'를 체크해주세요.");
		return false;
	} else {
		location.reload();
		return true;
	}
}

submitEl.addEventListener("click", function(event){

	event.preventDefault();
	
    if(idEl.value == "")
    {
        alert("ID를 작성하지 않았습니다.");
        return 0;
    }

    if(passwordEl.value == "")
    {
        alert("비밀번호를 작성하지 않았습니다.");
        return 0;
    }

	if(!(check_recaptcha())){
		return 0;
	}

    formEl.submit();
})

loginForm.addEventListener("submit", loginSubmit)
