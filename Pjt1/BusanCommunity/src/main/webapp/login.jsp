<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
	// 쿠키 가져오기
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(Cookie tempCookie : cookies) {
			if(tempCookie.getName().equals("idKey")) {
				//실행흐름이 서버에 있을때 서버코드로로 강제이동함
	            //특정 page로 이동하라는 정보만 줌
				response.sendRedirect("main.jsp");
			}
		}
	}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <link rel="stylesheet" href="./css/login.css">
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
	<form id="loginForm" name="loginFrm" method="post" action="loginProc.jsp">
		<h4>로그인</h4>
		
	    <div class="id">
             <input id="idInput" type="text" placeholder="ID를 입력하세요." maxlength="15" required name="id">
             <i class="fa-solid fa-user"></i>
           </div>
           
           <div id="password" class="password">
             <input type="password" placeholder="비밀번호를 입력하세요." maxlength="20" required name="pw">
             <ion-icon name="lock"></ion-icon>
           </div>
           
           <label class="keepsignedIn">
           <input type="checkbox" name="loginChk" value="true">자동로그인</label>
           
           <input type="submit" value="로그인" onclick="return check_recaptcha();">
           <a id="naverIdLogin_loginButton" href="javascript:void(0)">
             <img src="./images/btnW_로그인.png" alt="">
           </a>
           
           <a id="kakaoBtn" href="javascript:void(0)" onclick="kakaoLogin();">
             <img src="./images/kakao_login_medium_narrow.png"></img>
           </a>
            
         <!-- <input type = "checkbox" name="loginChk" value = "true">로그인 상태유지
         <button type="submit" id="regLogBtn" onclick="return check_recaptcha();">Login</button> -->
   
         <div class="lowForm">
              <label class="SignUp">
                <a href="./findpassword.jsp" class="forgot">비밀번호 찾기</a><a href="./signup.jsp">회원가입</a>
              </label>
            </div>
            <div class="g-recaptcha" data-sitekey="6Le91hggAAAAAPx4fwZ1YlLZzmm7WPHxwIlPWxjS"></div>
            <div style="padding: 10px;"></div>
   </form>
 </div> <!-- end container -->
 
 <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
 <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
 <script src="./js/naver-login.js"></script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 <script src="./js/kakao-login.js"></script>
 <script src="./js/login.js"></script>
 <script src="https://www.google.com/recaptcha/api.js"></script>
 
</body>
</html>