$(()=>{
    $.ajax({
        url:"php/kookje.php",
        dataType:"xml",
        success:function(data){
            var $items = $(data).find("item");

            if($items.length > 0){
                $items = $items.slice(0,20);
                var $ulTag = $("<ul/>");
                $.each($items, (idx, o)=>{
                    var $title = $(o).find("title").text();
                    var $link = $(o).find("link").text();
                    var $author = $(o).find("author").text();
                    var $data = $(o).find("pubDate").text();
                    var $content = $(o).find("description").text();


                    var $hnTag = $("<hn class='newstitle'/>").text($title);
                    // var $aTag = "<a href='" + $link + "'>" + $title + "</a>";
                    var $liTag = $("<li class='newslist'/>").append($hnTag);

                    var $p1Tag = $("<p class='content '/>").append($content);
                    var $p2Tag = $("<p class='author '/>").append($author);
                    var $p3Tag = $("<p class='data '/>").append($data);
                    var $newsLink = $("<a href='" + $link + "'>" + "<i class='fa-solid fa-arrow-right-long'>&nbsp기사로 가기</i>" + "</a>");
                    var $divTag = $("<div class='toggle'/>").append($p1Tag, $p2Tag, $p3Tag, $newsLink);

                    $liTag.append($divTag);
                    $ulTag.append($liTag);
                });
                $(".wrap3").append($ulTag);

                
            }
        }
    });
});
