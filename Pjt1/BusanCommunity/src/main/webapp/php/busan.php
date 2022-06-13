<?php

    $ch = curl_init(); // 세션 생성
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // ssl인증서 검사여부
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // 결과값 반을지 여부
    // curl_setopt($ch, CURLOPT_HERDER, 0);            헤더 정보 출력여부
    curl_setopt($ch, CURLOPT_URL,                   // 접속할 rss 주소
    "https://www.busan.go.kr/nbnews.rss");
    $url_source = curl_exec($ch);
    // curl_close($ch);

    echo $url_source;

?>