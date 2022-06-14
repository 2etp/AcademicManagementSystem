// 회원탈퇴 변경 모달
const modal_easyLogin = document.querySelector(".modal-easyLogin-background");
const modalopen_easyLogin = document.querySelector(".easyLogin");
const modalclose_easyLogin = document.querySelector(".modal-easyLogin-close");

function modalPage_easyLogin(event){
  event.preventDefault();
  modal_easyLogin.classList.toggle(inactive);
};

modalopen_easyLogin.addEventListener("click", modalPage_easyLogin);
modalclose_easyLogin.addEventListener("click", modalPage_easyLogin);