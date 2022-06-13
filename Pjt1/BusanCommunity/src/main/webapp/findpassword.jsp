<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <link rel="stylesheet" href="./css/findpassword.css">
  <link rel="stylesheet" href="./css/common.css">
  <link rel="stylesheet" href="./css/destyle.css">
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
    <form id="loginForm">
      <h4>비밀번호 찾기</h4>
      <div class="id">
        <input id="idInput" type="id" placeholder="이름을 입력하세요" maxlength="15" required>
        <i class="fa-solid fa-user"></i>
      </div>
      <div id="phonenumber" class="password">
        <input type="text" placeholder="휴대폰 번호를 입력하세요" maxlength="11" required>
        <ion-icon name="call"></ion-icon>
      </div>
      <div>
        <input type="submit" value="인증번호 발송">
      </div>
      <div id="certificationNumber" class="password">
        <input type="passwordInput" placeholder="전송받은 인증번호를 입력하세요" maxlength="20" required>
        <ion-icon name="lock"></ion-icon>
      </div>
      <div id="newPassword" class="password">
        <input type="passwordInput" placeholder="새로 사용할 비밀번호를 입력하세요" maxlength="20" required>
        <ion-icon name="lock"></ion-icon>
      </div>
      <div id="newPasswordcheck" class="password">
        <input type="passwordInput" placeholder="새로 사용할 비밀번호를 한 번 더 입력하세요" maxlength="20" required>
        <ion-icon name="lock"></ion-icon>
      </div>
      <div>
        <input type="submit" value="비밀번호 변경">
      </div>
  </div>
  </form>
  </div>



  <!-- 스크립트 -->
  <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
</body>
</html>