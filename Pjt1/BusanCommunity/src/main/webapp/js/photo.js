var arr = ["haeundae","junggu", "youngdogu", "sahagu", "seogu", "busanjingu", "donggu",
		   "dongraegu", "namgu", "bukgu", "geumjeonggu", "gangseogu", "yeonjegu",
		   "suyeonggu", "sasanggu", "gijanggun"];

document.querySelectorAll(".photo .title ul li").forEach(function(currentValue, currentIndex, listObj){
    currentValue.addEventListener("click",function(){
		var string1 = arr[currentIndex];
		jungGu(string1);
        var imagesrc;
        var imagetext;
        var contentDiv = document.querySelector("main .content");
        var tempEl;

        //현재 클릭한 요소를 제외한 모든 요소의 enable 클래스명을 제거
        for(var i=0; i<listObj.length; i++){
            if(i!=currentIndex){
                listObj[i].classList.remove("enable");
            }
        }

        //현재 요소가 활성화된 상태인 경우
        if(currentValue.classList.contains("enable")){
            return;
        }else{
            // 모든 요소 제거
            while(tempEl = contentDiv.firstChild){
                contentDiv.removeChild(tempEl);
            }
            //현재 클릭한 요소에 enable 클래스 추가
            
            currentValue.classList.add("enable");
            
            for(var i=0; i<12; i++){
                
                var imgEl = document.createElement("img");
                var imgTitle = document.createElement("div");
                
                imgEl.src = imagesrc[i];
                imgTitle.classList.add("image-title");
                imgTitle.innerText = imagetext[i];

                contentDiv.appendChild(imgEl);
                contentDiv.appendChild(imgTitle);
            }
        }
    })
})

