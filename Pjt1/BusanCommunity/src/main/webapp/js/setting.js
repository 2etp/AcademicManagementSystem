var pwChangeFormEl = document.querySelector("#change-pw-form");
var pwChangeEl = document.querySelector("#change-pw");
var pwChangeCheckEl = document.querySelector("#change-pw-check");
var pwChangeFormSubmitEl = document.querySelector(".modal-changeNum-send-bnt");

var phoneChangeFormEl = document.querySelector("#change-phone-form");
var phoneChangeEl = document.querySelector("#change-phone");
var phoneChangeFormSubmitEl = document.querySelector(".modal-changePhone-send-bnt");

var signOutFormEl = document.querySelector("#signOut-form");
var signOutPasswordEl = document.querySelector("#signOut-password");
var signOutFormSubmitEl = document.querySelector(".modal-signOut-send-bnt");

var ponnumberRegexp = new RegExp("010[0-9]{8}");

pwChangeFormSubmitEl.addEventListener("click", function(event){

	event.preventDefault();
	
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

    pwChangeFormEl.submit();
})


phoneChangeFormSubmitEl.addEventListener("click", function(event){
	
  event.preventDefault();
  
  if(phoneChangeEl.value == "")
  {
    alert("변경할 휴대폰 번호를 입력해주세요");
    return 0;
  }

  if(!(ponnumberRegexp.test(phoneChangeEl.value)))
  {
	alert("휴대폰 번호를 -를 제외한 11자리 숫자로 작성해주세요.");
    return 0;
  }
  
  phoneChangeFormEl.submit();
  
})

signOutFormSubmitEl.addEventListener("click", function(event){
	
  event.preventDefault();
  
  if(signOutPasswordEl.value == "")
  {
    alert("패스워드를 입력해주세요");
    return 0;
  }
  
  signOutFormEl.submit();
  
})
