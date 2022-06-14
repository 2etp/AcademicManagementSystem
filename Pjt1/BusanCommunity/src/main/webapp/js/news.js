$(()=>{
    $.ajax({
        url:"busan.jsp", 
        dataType:"xml",
        error: function(request,status,error) {
			alert("code:"+request.status+"\n" + 
				  "message:"+request.responseText+"\n" +
				  "error:"+error);
		},
		success:(data)=>{
            var $items = $(data).find("item");

            if($items.length > 0){
                $items = $items.slice(0,20);
                var $ulTag = $("<ul/>");
                $.each($items, (idx, o)=>{
                    var $title = $(o).find("title").text();
                    var $link = $(o).find("link").text();
                    var $author = $(o).find("author").text();
                    var $data = $(o).find("pubDate").text();
                    var $content = $(o).find("content\\:encoded").text();


                    var $hnTag = $("<hn class='newstitle'/>").text($title);
                    var $liTag = $("<li id='newslist' class='newslist'/>").append($hnTag);

                    var $p1Tag = $("<p class='content '/>").append($content);
                    var $p2Tag = $("<p class='author '/>").append($author);
                    var $p3Tag = $("<p class='data '/>").append($data);
                    var $newsLink = $("<a href='" + $link + "'>" + "<i class='fa-solid fa-arrow-right-long'>&nbsp기사로 가기</i>" + "</a>");
                    var $divTag = $("<div class='toggle'/>").append($p1Tag, $p2Tag, $p3Tag, $newsLink);


                    $liTag.append($divTag);
                    $ulTag.append($liTag);



                });
                $(".wrap1").append($ulTag);
                $(".author").prepend(`<p>작성자 :&nbsp</p>`);
                $(".data").prepend(`<p>작성일자 :&nbsp</p>`);

                
                $(".newstitle").on('click',()=>{ //해당 클래스 클릭 시 
                    $('.toggle').slideToggle();  // 'p' 태그 모두 슬라이드 업, 다운
                    });
                

            }
        }
    });
});






