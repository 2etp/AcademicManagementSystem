const newslist = document.getElementsByClassName("newslist");
const content = document.querySelector(".toggle");


newslist.addEventListener('click', () => {
        console.log("asdf");
});



for(let i = 0; i < newslist.length; i++){
    newslist[i].addEventListener('click', () => {
        console.log("asdf");
     content[i].classList.toggle("toggle");
    });
 };


