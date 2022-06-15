var pwChangeFormEl = document.querySelector("#change-pw-form");
var pwChangeEl = document.querySelector("#change-pw");
var pwChangeCheckEl = document.querySelector("#change-pw-check");
var pwChangeFormSubmitEl = document.querySelector(".modal-changePhone-send-bnt");

var phoneChangeFormEl = document.querySelector("#change-phone-form");
var phoneChangeEl = document.querySelector("#change-phone");
var phoneChangeFormSubmitEl = document.querySelector(".modal-changePhone-send-bnt");


var ponnumberRegexp = new RegExp("010-[0-9]{3,4}-[0-9]{4}");

pwChangeFormSubmitEl.addEventListener("click", function(){

    if(pwChangeEl.value == "")
    {
      alert("변경할 패스워드를 입력하지 않았습니다.");
      return 0;
    }

    if(pwChangeCheckEl.value == "")
    {
      alert("변경할 패스워드 확인을 입력하지 않았습니다.");
      return 0;
    }

    if(pwChangeEl.value != pwChangeCheckEl.value){
      alert("비밀번호와 비밀번호 확인값이 동일하지 않습니다.");
      return 0;
    }

    pwChangeFormSubmitEl.submit();
})

phoneChangeFormSubmitEl.addEventListener("click", function(){

  if(phoneChangeEl.value == "")
  {
    alert("변경할 전화번호를 입력하지 않았습니다.");
    return 0;
  }

  if(!(ponnumberRegexp.test(phoneChangeEl)))
  {
    return 0;
  }

  phoneChangeFormSubmitEl.submit();
    
})


