<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <link rel="stylesheet" href="./css/signup.css">
  <link rel="stylesheet" href="./css/destyle.css">
  <link rel="stylesheet" href="./css/common.css">
  <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
  

</head>

<body>

  <!-- 헤더 영역 -->
  <header>
    <div class="header">
      <a href="./main.jsp" class="header-logo">
        <img src="./images/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
    </div>
  </header>


<!-- 로그인 폼 -->
  <div class="container">
    <form id="loginForm" name="regFrm" method="post" action="signupProc.jsp">
      <h4>회원가입</h4>
      
      <div class="id">
        <input id="idInput" type="text" placeholder="ID를 입력하세요" maxlength="15" required name="id">
        <i class="fa-solid fa-user"></i>
      </div>
      
      <div id="password" class="password">
        <input id="passwordInput" type="password" placeholder="비밀번호를 입력하세요" maxlength="20" required name="pw">
        <ion-icon name="lock"></ion-icon>
      </div>
      
      <div id="passwordcheck" class="password">
        <input id="passwordInputcheck" type="password" placeholder="비밀번호 한번 더 입력하세요" maxlength="20" required name="repw">
        <ion-icon name="lock"></ion-icon>
      </div>
      
      <div id="phonenumber" class="password">
        <input id="phonenumberInput" type="number" placeholder="휴대폰 번호 입력하세요" maxlength="11" required name ="mobile">
        <ion-icon name="call"></ion-icon>
      </div>
      <input type="hidden" name="profileImage" value="ProfileImage.jpg">
      
      <div class="btn">
        <input type="button" id="action" value="회원가입">
        <button class="go_login"><a class="go_login_a" href="./login.jsp">로그인으로</a></button>
      </div>
  	</form>
  </div>

  <!-- 스크립트 -->
  <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
  <script src="./js/signup.js" defer></script>
</body>
</html>