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