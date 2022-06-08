$(()=>{
    $.ajax({
        url:"php/busan.php", 
        dataType:"xml",
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


                    var $aTag = $("<a class='newstitle'/>").attr({"herf":$link, "target":"_blank"}).text($title);
                    var $liTag = $("<li class='newslist'/>").append($aTag);

                    var $p1Tag = $("<p class='content'/>").append($content);
                    var $p2Tag = $("<p class='author'/>").append($author);
                    var $p3Tag = $("<p class='data'/>").append($data);


                    $liTag.append($p1Tag, $p2Tag, $p3Tag);
                    $ulTag.append($liTag);
                });
                $(".wrap1").append($ulTag);
                $(".author").prepend(`<p>작성자 :&nbsp</p>`);
                $(".data").prepend(`<p>작성일자 :&nbsp</p>`);
            }
        }
    });
});


$(()=>{
    $.ajax({
        url:"php/employment.php",
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
                    var $content = $(o).find("content\\:encoded").text();


                    var $aTag = $("<a/>").attr({"herf":$link, "target":"_blank"}).text($title);
                    var $liTag = $("<li class='newslist'/>").append($aTag);

                    var $p1Tag = $("<p class='content'/>").append($content);
                    var $p2Tag = $("<p class='author'/>").append($author);
                    var $p3Tag = $("<p class='data'/>").append($data);


                    $liTag.append($p1Tag, $p2Tag, $p3Tag);
                    $ulTag.append($liTag);
                });
                $(".wrap2").append($ulTag);
            }
        }
    });
});

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


                    var $aTag = $("<a/>").attr({"herf":$link, "target":"_blank"}).text($title);
                    var $liTag = $("<li class='newslist'/>").append($aTag);

                    var $p1Tag = $(`<p class='content'/>`).append($content);
                    var $p2Tag = $(`<p class='author'/>`).append($author);
                    var $p3Tag = $(`<p class='data'/>`).append($data);


                    $liTag.append($p1Tag, $p2Tag, $p3Tag);
                    $ulTag.append($liTag);
                });
                $(".wrap3").append($ulTag);
            }
        }
    });
});