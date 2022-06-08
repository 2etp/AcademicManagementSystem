const loginForm = document.querySelector("#loginForm");
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




loginForm.addEventListener("submit", loginSubmit)