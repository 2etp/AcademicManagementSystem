const list = document.querySelectorAll(".noti-list");
const a = document.querySelectorAll("div .a");
const icon = document.querySelectorAll(".noti-list i");


for(let i = 0; i < list.length; i++){
  list[i].addEventListener('click', () => {
    icon[i].classList.toggle("rotate");
    a[i].classList.toggle("inactive");
  });
};

// list.forEach((li, idx) => {
//   console.log(idx)
//   list[idx].addEventListener('click', () => {
//     a[idx].classList.toggle("inactive");
//   }
// )
// }
// )


