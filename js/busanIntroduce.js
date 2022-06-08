var moveUp = document.getElementById("moveup");
moveUp.addEventListener("click", function(){
  gsap.to(window, .6,{
    scrollTo:0
  });
})
