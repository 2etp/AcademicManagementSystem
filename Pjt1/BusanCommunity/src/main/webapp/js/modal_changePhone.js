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
