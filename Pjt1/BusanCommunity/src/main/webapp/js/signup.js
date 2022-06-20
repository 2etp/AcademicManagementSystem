var idEl = document.querySelector("#idInput");
var passwordEl = document.querySelector("#passwordInput");
var passwordCheckEl = document.querySelector("#passwordInputcheck");
var phonenumberEl = document.querySelector("#phonenumberInput");

var formEl = document.querySelector("#loginForm");
var submitEl = document.querySelector("#action");
var ponnumberRegexp = new RegExp("010[0-9]{3,4}[0-9]{4}");

submitEl.addEventListener("click", function(){

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

    if(passwordCheckEl.value == "")
    {
        alert("비밀번호 확인을 작성하지 않았습니다.");
        return 0;
    }

    if(passwordEl.value != passwordCheckEl.value)
    {
	    alert("비밀번호와 비밀번호 확인값이 동일하지 않습니다.");
	    passwordCheckEl.value="";
	    passwordCheckEl.focus();
	    return 0;
    }

    if(phonenumberEl.value == "")
    {
        alert("휴대폰번호를 작성하지 않았습니다.");
        return 0;

    }else if(!ponnumberRegexp.test(phonenumberEl.value)){
        alert("휴대폰 번호가 올바르지 않습니다.");
        console.log(ponnumberRegexp.source);
        phonenumberEl.focus();
        return;
    }
    document.regFrm.submit();
})


