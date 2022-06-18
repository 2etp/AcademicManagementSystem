const dropdown = document.querySelector(".dropdown");
const open = document.querySelector(".login");
const close = document.querySelector(".close");

function dropdowntext(event){
  event.preventDefault();
  dropdown.classList.toggle("inactive");
};

open.addEventListener("click", dropdowntext);
close.addEventListener("click", dropdowntext);