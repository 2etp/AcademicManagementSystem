// 문의 모달
const modal = document.querySelector(".modal-background");
const modalopen = document.querySelector(".inquiry");
const modalclose = document.querySelector(".modal-close");
const inactive = "inactive";


function modalPage(event){
  event.preventDefault();
  modal.classList.toggle(inactive);
};

modalopen.addEventListener("click", modalPage);
modalclose.addEventListener("click", modalPage);


// 비밀번호 변경 모달
const modal_changeNum = document.querySelector(".modal-changeNum-background");
const modalopen_changeNum = document.querySelector(".changeNum");
const modalclose_changeNum = document.querySelector(".modal-changeNum-close");

function modalPage_changeNum(event){
  event.preventDefault();
  modal_changeNum.classList.toggle(inactive);
};

modalopen_changeNum.addEventListener("click", modalPage_changeNum);
modalclose_changeNum.addEventListener("click", modalPage_changeNum);




// 휴대폰 번호 변경 모달
const modal_changePhone = document.querySelector(".modal-changePhone-background");
const modalopen_changePhone = document.querySelector(".changePhone");
const modalclose_changePhone = document.querySelector(".modal-changePhone-close");

function modalPage_changePhone(event){
  event.preventDefault();
  modal_changePhone.classList.toggle(inactive);
};

modalopen_changePhone.addEventListener("click", modalPage_changePhone);
modalclose_changePhone.addEventListener("click", modalPage_changePhone);




// 회원탈퇴 변경 모달
const modal_signOut = document.querySelector(".modal-signOut-background");
const modalopen_signOut = document.querySelector(".signOut");
const modalclose_signOut = document.querySelector(".modal-signOut-close");

function modalPage_signOut(event){
  event.preventDefault();
  modal_signOut.classList.toggle(inactive);
};

modalopen_signOut.addEventListener("click", modalPage_signOut);
modalclose_signOut.addEventListener("click", modalPage_signOut);