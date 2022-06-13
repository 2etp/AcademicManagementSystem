<?php

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // curl_setopt($ch, CURLOPT_HERDER, 0);
    curl_setopt($ch, CURLOPT_URL,
    "http://www.kookje.co.kr/news2011/rss/newslist05.xml");
    $url_source = curl_exec($ch);
    // curl_close($ch);

    echo $url_source;

?>